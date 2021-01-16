function out = ck_rc3_read_clusterresults(filename)
% LIEST EIN CLUSTER.mat ein und extrahiert die Ergebnisse, Struktur sollte zu gem_export_obj kompatibel sein
    
    out = [];
    fprintf('\tck_rc3_read_clusterresults: %s ', filename);
    if ~exist(filename), disp(' EXISTIERT NICHT!'); return;end

    DATA = load(filename);
    Cluster = DATA.Cluster;

    for i = 1:numel(Cluster)
        if i == 1
            out = struct();
            out.info = Cluster{i}.info;
            out.series_id = out.info.series_id;
            out.channels = {};
            out.data = struct();
            out.data.corr = [];
            if isfield(out.info, 'trial_id')
                out.trial_id = out.info.trial_id;
            else
                out.trial_id = 'fmrt trial';
            end
            if isfield(out.info, 'subject_id')
                out.subject_id = out.info.subject_id;
            else
                % extract from filename
                [aa subject_id cc] = fileparts(filename);
                pos = strfind(subject_id, 'Cluster_');
                if ~isempty(pos)
                    subject_id = subject_id(9:end);
                end
                out.subject_id = subject_id;
            end
        end

        out.channels{i,1} = Cluster{i}.name;

        % CLUSTER2CLUSTER results
        if isfield(Cluster{i}, 'Cluster2Cluster')
            cl = Cluster{i}.Cluster2Cluster;
            
            % COREELATION RESULTS:
            if isfield(cl, 'R') 
                out.data.corr = [out.data.corr cl.R];
            end
        end
    end
    
    disp('fertig')
end