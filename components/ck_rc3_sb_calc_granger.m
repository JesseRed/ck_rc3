

function ck_rc3_sb_calc_granger(data_dir, pn_results, varargin)
    %% SOME PRESETS
    % pn_results = '/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N';
    % TEST WITH: ck_rc3_sb_calc_granger({'/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N/A', '/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N/B'}, '/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N')


    fprintf('ck_rc3_sb_calc_granger\n');
    fprintf('\t-input folder: %s'), disp(data_dir)
    fprintf('\t-results will be written to: %s\n', pn_results)


    % PRESETS
    TRIAL_LENGTH = 60; %ie. RS has 247 images >> there will be 3 Trials with 80 datapoints each
    VARIABLES_MAX = 15; %MEHR ROIs sollte es nicht geben, sonst funkioniert GC nicht richtig
    FSTR = 'Yc1_mean';

    % parse through arguments
    if numel(varargin) == 0
        % DO NOTHING
    else
        cfg = varargin{1};
        if isfield(cfg, 'TRIAL_LENGTH'), TRIAL_LENGTH = cfg.TRIAL_LENGTH; end
        if isfield(cfg, 'VARIABLES_MAX'), TRIAL_LENGTH = cfg.VARIABLES_MAX; end
        if isfield(cfg, 'FSTR'), TRIAL_LENGTH = cfg.FSTR; end
    end

    % COLLECT THE DATA
    if ~iscell(data_dir), data_dir = {data_dir};end
    LIST = []; group_tag = [];
    for i_dir = 1:numel(data_dir)
        tmplist = sb_gen_dir_list(fullfile(data_dir{i_dir}, 'Cluster_*.mat'));
        LIST = [LIST; tmplist];
        group_tag = [group_tag; repmat(i_dir, numel(tmplist),1)];

    end

    %% OUTPUT:
    LABEL = {};
    GC = {};
    ID = {};

    %% NOW LOOP THROUGH ALL DATA > LOAD AND GC
    for ind = 1 : numel(LIST);

        %% LOAD THE CLUSTER
        fprintf('\n\treading: %s (%i/%i)\n', LIST{ind}, ind, numel(LIST))
        load(LIST{ind}); %DATA Loaded to variable: 'Cluster'

        %% FIRST Build a List with all Labels / Regions / ROIs
        if ind ==1 
            for i_cluster = 1:size(Cluster,1)
                LABEL{i_cluster} = Cluster{i_cluster}.name;
            end
        end

        %%CALC GC
        GC{ind} = calc_individual_gc(Cluster, FSTR, TRIAL_LENGTH, VARIABLES_MAX);

        %% NICE SUBJECT NAME
        [aa bb cc] = fileparts(LIST{ind});
        ID{ind}= bb(numel('Cluster_')+1:end);
    end

    %% NOW COLLECT THE RESULTS
    RESULTS = table;
    RESULTS.ID = ID';
    RESULTS.group = group_tag;
    for i1= 1:numel(LABEL)
        for i2 = 1:numel(LABEL)
            if i1 ~= i2
                label_str = sprintf('%s>%s', check_label(LABEL{i1}), check_label(LABEL{i2}));
                Y = [];
                for i_subj = 1:numel(GC);
                    Y(i_subj) = GC{i_subj}.GrangerC(i1,i2);
                end
                RESULTS.(label_str) = Y';
            end
        end
    end

    % WRITE RESULTS TO DISK
    fn_out = fullfile(pn_results, 'export_GC.csv');
    fprintf('\t-results written to: %s\n', fn_out)
    writetable(RESULTS,fn_out,'WriteRowNames',true, 'Delimiter',',') ;
    assignin('base', 'export_GC', RESULTS);

    disp('done')

end


%% PRIVATE FUNCTINO TO CALC THE GC FOR EACH SUBJECT 
function GC = calc_individual_gc(Cluster, FSTR, TRIAL_LENGTH, VARIABLES_MAX)
    GC = struct();

    % THEN EXTRACT THE DATA TO A 2D ARRAY
    fstr = FSTR;
    for i_cluster = 1:size(Cluster,1)
        if i_cluster == 1
            Y = zeros(size(Cluster,1), numel(Cluster{1}.(fstr)));
        end

        % MAKE SURE, the DATA FITS ...
        if size(Y,2) == numel(Cluster{i_cluster}.(fstr))
            Y(i_cluster, :) = Cluster{i_cluster}.(fstr);
        elseif  size(Y,2) > numel(Cluster{i_cluster}.(fstr))
            Y(i_cluster, 1:numel(Cluster{i_cluster}.(fstr))) = Cluster{i_cluster}.(fstr);
        elseif  size(Y,2) < numel(Cluster{i_cluster}.(fstr))
            Y(i_cluster, :) = Cluster{i_cluster}.(fstr)(1:size(Y,2));
        end
    end

    % NOW PREPARE THE TRIALS
    num_trials = floor(size(Y,2)/TRIAL_LENGTH);

    DATA3D = nan(size(Y,1), TRIAL_LENGTH, num_trials);
    p_start = 1;
    for i_trial = 1 : num_trials
        p_ende = p_start + TRIAL_LENGTH-1;
        if p_ende > size(Y,2), p_ende = size(Y,2);end
        % fprintf('%i - %i\n', p_start, p_ende)
        sl = Y(:,p_start:p_ende);
        DATA3D(:,1:size(sl,2),i_trial) = sl;
        p_start = p_start + TRIAL_LENGTH;
    end

    % PICK THE DATA TO REALY USE (to much variables will cause an error)
    if size(DATA3D,1) > VARIABLES_MAX
        fprintf('gc preparation: too much variables found: %i\n', size(DATA3d));
        fprintf('\twe will shrink to %i\n', VARIABLES_MAX);
        DATA3D = DATA3D(1:VARIABLES_MAX, :, :);
    end

    % NOW RUN THE CALCULATION
    cfg = [];
    cfg.method = 'granger_mri';
    GC = sb_gen_connectivity(cfg, DATA3D);

end

%  MINOR FUNCTIONS
function str = check_label(str)
    if numel(str) > 20
        str = str(1:20);
    end
end
