function out = ck_rc3_export(cfg)
% FUNKTION: ck_rc3_export(cfg)
% ZIEL: exportieren der Cluster*.mat in ein Object der ExportKlasse und dann exportieren in ein JSON file

    disp('ck_rc3_export'); out = [];

    % CHECK FOR MEG_GEM
    if ~check_meg_gem();disp('MEG_GEM nicht gefunden!'); return; end

    switch(cfg.method)
        case 'repeated measurements'
            % GRUPPE 1
            if ~isempty(cfg.g1_dir)
                export_group(cfg.g1_dir, cfg.g1_list, fullfile(cfg.results_dir, 'export_fmri_group1.json'));
            else
                fprintf('\tGruppe 1: leer\n');
            end
            % GRUPPE 2
            if ~isempty(cfg.g2_dir)
                export_group(cfg.g2_dir, cfg.g2_list, fullfile(cfg.results_dir, 'export_fmri_group2.json'));
            else
                fprintf('\tGruppe 2: leer\n');
            end

        case 'trials'
            % EXPORT TRIAL
            export_trial(cfg, fullfile(cfg.results_dir, 'export_fmri_trials.json'));

        otherwise
            fprintf('\tmethod not supported: %s\n', cfg.method);
    end

    % ENDE
    disp('finished')
end

% LIEST GRUPPE 1 als TRIAL 1 und GRUPPE 2 als TRIAL 2 ein
function export_trial(cfg, json_fn)
    fprintf('exportiere die Gruppen als Trials:\n');
    fprintf('\tTrial 1: %s\n', cfg.g1_dir);
    fprintf('\tTrial 2: %s\n', cfg.g2_dir);

    liste = union(cfg.g1_list, cfg.g2_list);
    OBJ_CORR = gem_export_obj('fmri_corr');
    % LESE JETZT DIE PROBANDEN EIN
    for i = 1:numel(liste)
        fprintf('\t%i/%i: %s ...', i, numel(liste), liste{i});

        % READ TRIAL 1
        trials = {};
        if max(ismember(cfg.g1_list, liste{i})) == 1
            data1_fn = fullfile(cfg.g1_dir, liste{i});
            trials{1} = ck_rc3_read_clusterresults(data1_fn);
        else
            trials{1} = [];
        end

         % READ TRIAL 2
         if max(ismember(cfg.g2_list, liste{i})) == 1
            data2_fn = fullfile(cfg.g2_dir, liste{i});
            trials{2} = ck_rc3_read_clusterresults(data2_fn);
        else
            trials{2} = [];
        end

        OBJ_CORR.add_data(trials);
        fprintf(' [fertig]\n')
    end

    % EXPORT DATA
    [aa bb cc] = fileparts(json_fn);
    assignin('base', bb, OBJ_CORR.export());
    OBJ_CORR.export_to_file(json_fn);

    % DEBUG
    assignin('base', 'OBJ', OBJ_CORR)
end

% LIEST EINE GESAMTE GRUPPE EIN UND ERZEUGT DIE EXPORT STRUKTUR
function export_group(pn, liste, json_fn)
    fprintf('exportiere Gruppe: %s\n', pn);
    OBJ_CORR = gem_export_obj('fmri_corr');

    for i = 1:numel(liste)
        fprintf('\t%i/%i: %s ...', i, numel(liste), liste{i});
        data_fn = fullfile(pn, liste{i});
        data = ck_rc3_read_clusterresults(data_fn);

        OBJ_CORR.add_data(data);

        fprintf(' [fertig]\n')
    end

    % EXPORT DATA
    [aa bb cc] = fileparts(json_fn);
    assignin('base', bb, OBJ_CORR.export())
    OBJ_CORR.export_to_file(json_fn)

end


% CHECKT, ob die MEG_GEM TOolbox im Pfad ist, hier wird die Klasse gem_export_obj benoetigt
function out = check_meg_gem()
    fn = which('gem_export_obj.m');
    if isempty(fn), out = false;
    else out = true;
    end

    if ~out
        pn = uigetdir(pwd, 'Pfad zur MEG_GEM Toolbox bitte angeben');
        if isempty(pn) | pn == 0; return; end
        addpath(pn);
        addpath(fullfile(pn,'classes'));
        addpath(fullfile(pn,'components'));
        fn = which('gem_export_obj.m');
        if ~isempty(fn), out = true;end 
    end
end