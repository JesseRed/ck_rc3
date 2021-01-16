% MAIN FUNCTION FOR ck_rc3
function out = ck_rc3(varargin)
    VERSION="ck_rc3 v20210113";

    % PARSE the arguments
    if numel(varargin) <1
        ck_rc3('start_gui');
        return
    end

    actionstr = varargin{1};

    if numel(varargin)>1
        app = varargin{2};
    end


    % ACTION_STR
    switch actionstr
        % case 'TEMPL' %ie: ck_rc3('TEMPL', app);
        case 'start_gui' %ie: ck_rc3('start_gui');
            app = ck_rc3_GUI();
            app.ck_rc3_uiUIFigure.Name = VERSION;

            [CK_DIR fn ext] = fileparts(which('ck_rc3'));
            addpath(CK_DIR);
            addpath(fullfile(CK_DIR, 'statics'));
            addpath(fullfile(CK_DIR, 'components'));
            addpath(genpath(fullfile(CK_DIR, 'ck_statistics')));

        
        case 'save_new' %ie: ck_rc3('save_new', app);
            ck_rc3_gui_save_sb(app);

        case 'load_new' %ie: ck_rc3('load_new', app);
            ck_rc3_gui_load_sb(app);

        case 'visualizecorrelation' %ie: ck_rc3('visualizecorrelation', app);
            % lade C2C_stat datei
            try
                load(fullfile(app.resultsdirEditField.Value,'C2C_stat.mat'));
            catch
                msgdlg('no C2C_stat.mat file');
            end
            ck_rc3_visualize_network_clusterbehavior(app.resultsdirEditField.Value,C2C_stat.G);

        case 'updatedataimport' %ie: ck_rc3('updatedataimport', app);
            data_dir = app.g1dirdataimportEditField.Value;
            if ~exist(data_dir), warndlg('ungueltiges Verzeichnis!'); return; end

            subdir_1 = app.dataimportsubdirnameEditField_1.Value;
            subdir_2 = app.dataimportsubdirnameEditField_2.Value;
            filter_str = app.dataimportfilefilterEditField.Value;

            listg1 = get_updatedataimport_list(data_dir,subdir_1, filter_str);
            listg2 = get_updatedataimport_list(data_dir,subdir_2, filter_str);
            app.g1dirdataimportListBox.Items = listg1;
            app.g2dirdataimportListBox.Items = listg2;

            %if successfull try to import a meta.json as well
            if isempty(listg1), return; end
            fn = fullfile(data_dir, listg1{1}, subdir_1, 'meta.json');
            if ~exist(fn), fprintf('no valid meta.json found!\n', fn), return, end
            val = sb_gen_read_jsonfile(fn);
            if isfield(val, 'options')
                if isfield(val.options, 'bp_filter_str')
                    bp_filter = eval(val.options.bp_filter_str);
                    app.lpfEditField.Value = bp_filter(2);
                    app.hpfEditField.Value = bp_filter(1);
                else
                    disp('no lhp/hpf informatino found, please edit manually!');
                end

                if isfield(val.options, 'TR')
                    app.TREditField.Value = val.options.TR;
                else
                    disp('no TR information found, please check manually!');
                end

            end

        case 'update' %ie: ck_rc3('update', app);
            stat = listboxupdate(app);

        case 'testforfilepresence' %ie: ck_rc3('testforfilepresence', app);

             %           g1pathlist
            %fprintf('testforfilepresencebutton\n');
            %Items = app.g1dirdataimportListBox.Items
            %            Val = app.g1dirdataimportListBox.Value
            r1 = test_existence(app, app.g1dirdataimportEditField.Value, app.g1dirdataimportListBox.Items, app.dataimportsubdirnameEditField_1.Value);
            r2 = test_existence(app, app.g1dirdataimportEditField.Value, app.g2dirdataimportListBox.Items, app.dataimportsubdirnameEditField_2.Value);
            

            if (r1)==0
                app.Lamp.Color='green';
                
            else
                app.Lamp.Color='red';
            end          


        case 'saveButton' %ie: ck_rc3('saveButton', app);
            try
                [~,result] = dos('getmac');
                mac = result(160:176);
            catch
                mac = 'no_mac';
                fprintf('keine Mac adresse eruierbar\n');
            end
            
            local_file = fullfile(fileparts(which('ck_rc3.mlapp')),['lastsession_' mac '.mat']);
            lastsession = struct;
            lastsession.resultsdir =  app.resultsdirEditField.Value ;
            lastsession.g1dir = app.g1dirEditField.Value;
            lastsession.g2dir = app.g2dirEditField.Value;
            lastsession.exemplarydatafile = app.exemplarydatafileEditField.Value;
            lastsession.g1dirdataimport = app.g1dirdataimportEditField.Value;
            lastsession.g2dirdataimport = app.g2dirdataimportEditField.Value;
            lastsession.dataimportsubdirname = app.dataimportsubdirnameEditField.Value;
            lastsession.extractallvoxelinCluster =  app.extractallvoxelinClusterCheckBox.Value;
            lastsession.extractconditionalvoxel = app.extractconditionalvoxelCheckBox.Value;
            lastsession.extract2conditionalvoxel = app.extract2conditionalvoxelCheckBox.Value;
            lastsession.graymatterprobgreateras = app.graymatterprobgreaterasEditField.Value;
            lastsession.whitematterproblessthen = app.whitematterproblessthenEditField.Value ;
            lastsession.CSFproblessthen = app.CSFproblessthenEditField.Value ;
            lastsession.graymatterprobgreateras2 = app.graymatterprobgreateras2EditField.Value;
            lastsession.whitematterproblessthen2 = app.whitematterproblessthen2EditField.Value ;
            lastsession.CSFproblessthen2 = app.CSFproblessthen2EditField.Value ;
            lastsession.graymatterfilename = app.graymatterfilenameEditField.Value;
            lastsession.whitematterfilename = app.whitematterfilenameEditField.Value ;
            lastsession.csffilename = app.csffilenameEditField.Value ;
            lastsession.dataimportfilefilter =app.dataimportfilefilterEditField.Value  ;
            lastsession.exelfileeditfield = app.xlscsvFileEditField.Value;
            save(local_file,'lastsession');

        case 'reduceClusterdata' %ie: ck_rc3('reduceClusterdata', app);
            app.idleGauge.Value = 0;
            app.idleGaugeLabel.Text = 'working on cluster reduction';
            prefix = app.newprefixforClustermatfilesEditField.Value;
            
            [listg1,listg2] = get_all_selected_filenames(app,'full');
            reduce_Cluster(app,listg1,prefix);
            app.idleGauge.Value = 50;
            reduce_Cluster(app,listg2,prefix);
            app.idleGauge.Value = 100;
            app.idleGaugeLabel.Text = 'idle';

        case 'loadlastButton' %ie: ck_rc3('loadlastButton', app);
            try
                [~,result] = dos('getmac');
                mac = result(160:176);
                catch 
                    mac = 'no_mac';
                end
                try
                    local_file = fullfile(fileparts(which('ck_rc3.mlapp')),['lastsession_' mac '.mat']);
                    load(local_file,'lastsession');
                    app.resultsdirEditField.Value = lastsession.resultsdir;
                    app.g1dirEditField.Value = lastsession.g1dir;
                    app.g2dirEditField.Value = lastsession.g2dir;
                    app.exemplarydatafileEditField.Value = lastsession.exemplarydatafile;
                    app.g1dirdataimportEditField.Value = lastsession.g1dirdataimport;
                    app.g2dirdataimportEditField = lastsession.g2dirdataimport;
                    app.dataimportsubdirnameEditField.Value = lastsession.dataimportsubdirname;
                    app.extractallvoxelinClusterCheckBox.Value = lastsession.extractallvoxelinCluster;
                    app.extractconditionalvoxelCheckBox.Value = lastsession.extractconditionalvoxel;
                    app.extract2conditionalvoxelCheckBox.Value = lastsession.extract2conditionalvoxel;
                    app.graymatterprobgreaterasEditField.Value = lastsession.graymatterprobgreateras;
                    app.whitematterproblessthenEditField.Value = lastsession.whitematterproblessthen;
                    app.CSFproblessthenEditField.Value = lastsession.CSFproblessthen;
                    app.graymatterprobgreateras2EditField.Value = lastsession.graymatterprobgreateras2;
                    app.whitematterproblessthen2EditField.Value = lastsession.whitematterproblessthen2;
                    app.CSFproblessthen2EditField.Value = lastsession.CSFproblessthen2;
                    app.graymatterfilenameEditField.Value = lastsession.graymatterfilename;
                    app.whitematterfilenameEditField.Value = lastsession.whitematterfilename;
                    app.csffilenameEditField.Value = lastsession.csffilename;
                    app.dataimportfilefilterEditField.Value = lastsession.dataimportfilefilter;
                    app.xlscsvFileEditField.Value = lastsession.exelfileeditfield;
                    cd(app.resultsdirEditField.Value);
                catch
                    fprintf('kein altes verzeichnis abgespeichert\n');
                end
                
                stat = listboxupdate(app);
        case 'loadexelfile' %ie: ck_rc3('loadexelfile', app);
            [Lnum,Ltxt,L] = xlsread(app.xlscsvFileEditField.Value);
            [Lnum,Ltxt,L] = ck_rc3_xlsread_sb(app.xlscsvFileEditField.Value);
            
            titel = L(1,:);
            
            %skala = L(2,:);
            exeldata = L(2:end,:);
            % extrahiere die IDs
            id_col=find(strcmp(titel,'ID'));
            app.IDlist = cell2mat(exeldata(:,id_col));
            assignin('base','titel',titel);
            app.ExelvariablesListBox.Items = titel;
            %app.ExelvariablesListBox.
            
            %set(handles.listboxexelvariables,'Value',1);
            app.exeltitel = titel;
            app.exeldata = exeldata;
        case 'loadButton' %ie: ck_rc3('loadButton', app);

            cd(which('ck_rc3.m'));
            [f,p]=uigetfile('select lastsessionfile');
            
            load(fullfile(p,f),'lastsession');
            app.resultsdirEditField.Value = lastsession.resultsdir;
            app.g1dirEditField.Value = lastsession.g1dir;
            app.g2dirEditField.Value = lastsession.g2dir;
            app.exemplarydatafileEditField.Value = lastsession.exemplarydatafile;
            app.g1dirdataimportEditField.Value = lastsession.g1dirdataimport;
            app.g2dirdataimportEditField.Value = lastsession.g2dirdataimport;
            app.dataimportsubdirnameEditField.Value = lastsession.dataimportsubdirname;
            app.extractallvoxelinClusterCheckBox.Value = lastsession.extractallvoxelinCluster;
            app.extractconditionalvoxelCheckBox.Value = lastsession.extractconditionalvoxel;
            app.extract2conditionalvoxelCheckBox.Value = lastsession.extract2conditionalvoxel;
            app.graymatterprobgreaterasEditField.Value = lastsession.graymatterprobgreateras;
            app.whitematterproblessthenEditField.Value = lastsession.whitematterproblessthen;
            app.CSFproblessthenEditField.Value = lastsession.CSFproblessthen;
            app.graymatterprobgreateras2EditField.Value = lastsession.graymatterprobgreateras2;
            app.whitematterproblessthen2EditField.Value = lastsession.whitematterproblessthen2;
            app.CSFproblessthen2EditField.Value = lastsession.CSFproblessthen2;
            app.graymatterfilenameEditField.Value = lastsession.graymatterfilename;
            app.whitematterfilenameEditField.Value = lastsession.whitematterfilename;
            app.csffilenameEditField.Value = lastsession.csffilename;
            app.dataimportfilefilterEditField.Value = lastsession.dataimportfilefilter;
            
            cd(app.resultsdirEditField.Value);
            
            stat = listboxupdate(app);
        case 'initnew' %ie: ck_rc3('initnew', app);
            d = app.resultsdirEditField.Value;
            f=fullfile(d,'parameter.mat');
            parameter = struct;
            if exist(f)
                answer = questdlg('parameter.mat exists ... overwrite?', 'Overwrite?', 'Yes','No','No');
                switch answer
                    case 'No'
                        return;
                end
            end
                save(f,'parameter');

        case 'estimateconnectivity' %ie: ck_rc3('estimateconnectivity', app);

            [filenamesg1] = app.g1ListBox.Value;
            [filenamesg2] = app.g2ListBox.Value;
            resultsdir = app.resultsdirEditField.Value;
            %get_all_selected_filenames(handles,'part');
            %assignin('base','file',filenamesg1);
            %[filenamesg1, filenamesg2] = get_filenames(handles,'Cluster_');
            %outdir = get(handles.editoutdir,'String');
            
            % GC SB
            if app.sb_gc_switch.Value
                sb_cfg = [];
                sb_cfg.TRIAL_LENGTH = app.sb_gc_TRIAL_LENGTH.Value;
                sb_pn_results = app.resultsdirEditField.Value;
                sb_data_dir = {app.g1dirEditField.Value, app.g2dirEditField.Value};
                ck_rc3_sb_calc_granger(sb_data_dir, sb_pn_results, sb_cfg);
                % ck_rc3_sb_calc_granger({'/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N/A', '/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N/B'}, '/export/nfs_share/BIOMAG_DATA/Projects/TV_Studie_MN/data/processing/RS/RESULTS_7N')
            end
            
            
            load(fullfile(resultsdir,'parameter.mat'));
            
            %options = ck_rc2_estimate_connectivity_options();
            

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %  erstelle die zu uebergebende options struct
            options.parameter = parameter;
            options.cancel = 0;
            options.EstimateCorrelations = app.correlationSwitch.Value;
            options.EstimateCoherence = app.coherenceSwitch.Value;
            options.EstimatePartialCoherence = app.partialcoherenceSwitch.Value;
            options.EstimateTransinformation = app.transinformationSwitch.Value;
            options.EstimateSynchronization = app.synchronizationSwitch.Value;
            options.EstimateComplexity = app.complexitySwitch.Value;
            options.Transinformation_bins = app.histogramEditField.Value;
            options.Transinformation_lag = app.timelagEditField.Value;
            options.Synchronization_bins = app.histogramsynchronizationEditField.Value;
            options.Complexity_bins = app.windowlengthcomplexityEditField.Value;
            options.Complexity_r = app.similaritymeasurecomplexityEditField.Value;
            options.Cluster2Voxel = app.Cluster2VoxelCheckBox.Value;
            options.C2V_c1mask = app.C1maskthresholdCheckBox.Value;
            options.C2V_threshold= app.thresholdEditField.Value;
            options.C2V_smoothing= app.smoothingCheckBox.Value;
            options.C2V_kernel= eval(app.kernelEditField.Value);
            options.Cluster2Cluster= app.Cluster2ClusterCheckBox.Value;
            options.Voxel2Voxel= app.Voxel2VoxelCheckBox.Value;
            options.useY = app.conuseYCheckBox.Value;
            options.useYc1 = app.conuseYc1CheckBox.Value;
            options.useYc2 = app.conuseYc2CheckBox.Value;
            
            
            % options struct fertig erstellt
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Uebergabe der Paramter an die Funktion zur Berechnung der Connectivitaet
            if  ~isempty(filenamesg1)
                ck_rc3_estimate_connectivity(resultsdir,app.g1dirEditField.Value,filenamesg1,options);
            end
            if  ~isempty(filenamesg2)
                ck_rc3_estimate_connectivity(resultsdir,app.g2dirEditField.Value,filenamesg2,options);
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % granger causality als extra aufruf
            
            if app.grangerSwitch.Value
                
                GC_options = struct;
                GC_options.MultiSubjectAnalysis = 1;
                GC_options.EstimateCGCt = app.conditionalGCinthetimedomainCheckBox.Value;
                
                GC_options.nlagst = app.grangernumberoflagsEditField.Value;
                
                GC_options.pt = app.grangerpEditField.Value;
                GC_options.cort = 1;
                GC_options.EstimateCGCf = app.conditionalGCinfrequencydomainCheckBox.Value;
                GC_options.prep.detrend = app.grangerdetrenddataCheckBox.Value;
                GC_options.prep.removemean = app.grangerremovetemporalmeanCheckBox.Value;
                GC_options.prep.removemeanstd = app.grangerremovetemporalmeananddividebystdCheckBox.Value;
                GC_options.prep.differencing = app.grangerdifferencingtimeseriesCheckBox.Value;
                GC_options.prep.differencingit = app.grangeriterationEditField.Value;
                GC_options.EstimateGCautonomy = app.estimategrangerautonomyCheckBox.Value;
                GC_options.cluster2cluster = app.Cluster2ClusterCheckBox.Value;
                GC_options.cluster2voxel = app.Cluster2VoxelCheckBox.Value;
                GC_options.onegroup = 0;
                GC_options.twogroups = 1;
                GC_options.pairedgroups = 0;
                GC_options.freq = eval(app.grangerfrequencyEditField.Value);
                GC_options.prep.filter = 0;
                GC_options.prep.iffreqiteration = 0.01;
                GC_options.prep.freqiteration = app.grangerfrequencyiterationstepEditField.Value;
                
                GC_options.Cluster_sel_name = app.grangerselectedClusterListBox.Value;
                
                GC_options.Cluster_sel_num = length(options.Cluster_sel_name);
                CG_options.TR = parameter.TR;
                CG_options.parameter = parameter;
                % nun der Funktionsaufruf
                resultsdir = app.resultsdirEditField.Value;
                
                if  ~isempty(filenamesg1)
                    datadir = app.g1dirEditField.Value;
                    cGCt_groupA = ck_rc3_estimate_granger_causality(resultsdir,datadir,filenamesg1,GC_options);
                end
                if  ~isempty(filenamesg2)
                    datadir = app.g2dirEditField.Value;
                    cGCt_groupB = ck_rc3_estimate_granger_causality(resultsdir,datadir,filenamesg2,GC_options);
                end
                
                
            end
            % 
            % 
            % handles.output.MultiSubjectAnalysis = get(handles.radiobuttonmultisubjectanalysis,'Value');
            % handles.output.EstimateCGCt = get(handles.radiobuttonCGCtime,'Value');
            % handles.output.nlagst = str2double(get(handles.editnlagst,'String'));
            % handles.output.pt = str2double(get(handles.editpt,'String'));
            % handles.output.cort = (get(handles.popupmenucor,'Value'))-1;
            % handles.output.EstimateCGCf = get(handles.radiobuttonCGCfrequency,'Value');
            % handles.output.prep.detrend = get(handles.checkboxdetrend,'Value');
            % handles.output.prep.removemean = get(handles.checkboxremovetemporalmean,'Value');
            % handles.output.prep.removemeanstd = get(handles.checkboxremovetemporalmeanstdd,'Value');
            % handles.output.prep.differencing = get(handles.checkboxdifferencing,'Value');
            % handles.output.prep.differencingit = str2double(get(handles.editit,'String'));
            % handles.output.EstimateGCautonomy = get(handles.radiobuttongrangerautonomy,'Value');
            % handles.output.cluster2cluster = get(handles.radiobuttoncluster2cluster,'Value');
            % handles.output.cluster2voxel = get(handles.radiobuttoncluster2voxel,'Value');
            % handles.output.onegroup = get(handles.radiobuttononegroup,'Value');
            % handles.output.twogroups = get(handles.radiobuttontwogroups,'Value');
            % handles.output.pairedgroups = get(handles.radiobuttonpairedgroups,'Value');
            % handles.output.onegroupsingle = get(handles.radiobuttononegroupsingle,'Value');
            % handles.output.freq = eval((get(handles.editfrequency,'String')));
            % handles.output.prep.filter = get(handles.checkboxfreq,'Value');
            % handles.output.prep.iffreqiteration = get(handles.checkboxfreqiteration,'Value');
            % handles.output.prep.freqiteration = str2num(get(handles.editfreqiteration,'String'));
            % 
            % idx = get(handles.listbox1,'Value');
            % list = get(handles.listbox1,'String');
            % for i=1:size(idx,2);
            % handles.output.Cluster_sel_name{i} = list{idx(i)};
            % end
            % handles.output.Cluster_sel_num=idx;
            %             
        case 'deletenetworkdefinitionsfromClusterstruct' %ie: ck_rc3('deletenetworkdefinitionsfromClusterstruct', app);
            h=waitbar(0,'Please wait ...');
            f = fullfile(app.resultsdirEditField.Value,'Cluster.mat');
            if exist(f)
                
                load(f);
                Cluster = del_network(app,Cluster);
                waitbar(2/3);
                save(f,'Cluster','-v7.3');
            else
                msgbox('no Cluster.mat file found in results dir','error');
            end
            waitbar(3/3)
            close(h);
            

        case 'chooserootdir' %ie: ck_rc3('chooserootdir', app);
            p = uigetdir('Select  dir for Clusterdata of group 2');
            if isempty(p) | p == 0; return; end
            app.resultsdirEditField.Value = p; 
            app.g1dirEditField.Value = fullfile(p, 'group_1');
            app.g2dirEditField.Value = fullfile(p, 'group_2');

        case 'GOButton' %ie: ck_rc3('GOButton', app);
            fprintf('go for data import\n');
            options = struct;
            options.extract_all = app.extractallvoxelinClusterCheckBox.Value;
            options.extract_con1 = app.extractconditionalvoxelCheckBox1.Value;
            options.extract_con1_g1_val = app.graymatterprobgreaterasEditField.Value;
            options.extract_con_g1_name = app.graymatterfilenameEditField.Value;
            options.extract_con1_g2_val = app.whitematterproblessthenEditField.Value;
            options.extract_con_g2_name = app.whitematterfilenameEditField.Value;
            options.extract_con1_g3_val = app.CSFproblessthenEditField.Value;
            options.extract_con_g3_name = app.csffilenameEditField.Value;
            options.extract_con2 = app.extractconditionalvoxelCheckBox2.Value;
            options.extract_con2_g1_val = app.graymatterprobgreateras2EditField.Value;
            options.extract_con2_g2_val = app.whitematterproblessthen2EditField.Value;
            options.extract_con2_g3_val = app.CSFproblessthen2EditField.Value;

            options.filter_TR = app.TREditField.Value;
            options.filter_lpf = app.lpfEditField.Value;
            options.filter_hpf = app.hpfEditField.Value;
            
            
            
            %PREPARE THE FILE LISTS

            val1 = app.g1dirdataimportListBox.Value;
            val2 = app.g2dirdataimportListBox.Value;
            if isempty(val1), warndlg('nichts ausgewaehlt'), return; end

            subjectfilelist_g1 = get_full_subjects_filenames(app.g1dirdataimportEditField.Value, val1, app.dataimportsubdirnameEditField_1.Value, app.dataimportfilefilterEditField.Value);
            subjectfilelist_g2 = get_full_subjects_filenames(app.g1dirdataimportEditField.Value, val2, app.dataimportsubdirnameEditField_2.Value, app.dataimportfilefilterEditField.Value);

            resultsdir = app.resultsdirEditField.Value;
            outputdirg1 = app.g1dirEditField.Value;
            outputdirg2 = app.g2dirEditField.Value;
            
        
            %SAVE THE PARAMETERS
            parameterfile = fullfile(app.resultsdirEditField.Value,'parameter.mat');

            parameter.TR = app.TREditField.Value;
            parameter.lpf = app.lpfEditField.Value;
            parameter.hpf = app.hpfEditField.Value;
            save(parameterfile,'parameter');
            
            % LOAD THE DATA TO CLUSTERS
            if ~isempty(val1)
                options.trial_id = app.dataimportsubdirnameEditField_1.Value;
                ck_rc3_fill_all_clusters_from_niftifiles(resultsdir,outputdirg1,subjectfilelist_g1,val1,options);
            end
            if ~isempty(val2)
                options.trial_id = app.dataimportsubdirnameEditField_2.Value;
                ck_rc3_fill_all_clusters_from_niftifiles(resultsdir,outputdirg2,subjectfilelist_g2,val2,options);
            end
        

        case 'DefineNetwork' %ie: ck_rc3('DefineNetwork', app);
            ck_rc3_define_network(app.resultsdirEditField.Value);

        case 'DefineCluster' %ie: ck_rc3('DefineCluster', app);
            d = pwd;
            % speichere den ausgewaehlten Namen des Beispieldatensatzes im parameterfile ab
            f = fullfile(app.resultsdirEditField.Value,'parameter.mat');
            load(f);
            parameter.define_cluster_input_file = app.exemplarydatafileEditField.Value;
            save(f,'parameter');
            
            cd(app.resultsdirEditField.Value);
            
            % OPEN SB_ROI_CLUSTER_MANAGER
            if ~exist(which('sb_roi_cluster_manager.m'))
                answ = questdlg('Wollen sie den Pfad auswaehlen?', 'sb_roi_cluster_manager nicht gefunden');
                if ~strcmp(lower(answ), 'yes'), return ; end
                
                pn = uigetdir('/opt/sb_tools/')
                if isempty(pn) | pn==0, return; end
                addpath(pn);
            end

            sb_roi_cluster_manager('start_gui', [], app)


            % ENDE
            stat = listboxupdate(app);
            cd(d);

        case 'C2Cvisualizenetworkcorrelation' %ie: ck_rc3('C2Cvisualizenetworkcorrelation', app);
            fprintf('C2CvisualizenetworkcorrelationButtonPushed');
            try
            [B.TG,B.BG1,B.BG2] = get_selected_exel_data(app);
            catch
                B = 0;
            end
            %             try
            %                 load(fullfile(app.resultsdirEditField.Value,'C2C_stat.mat'));
            %                 load(fullfile(app.resultsdirEditField.Value,'parameter.mat'));
            %             catch
            %                 msgbox('no C2C_stat2.mat file');
            %             end
            %             
            %             parameter.behavioraldata = [BG1 ;BG2];
            %             parameter.behavioraltitle = varnamelistsel;
            %             save(fullfile(app.resultsdirEditField.Value,'parameter.mat'),'parameter');
            %             B.BG1 = BG1;
            %             B.BG2 = BG2;
            %             B.TG = varnamelistsel;
            
            ck_rc3_visualize_network_clusterbehavior2(app.resultsdirEditField.Value,app.C2C_stat,B);

        case 'C2Cshownetworks' %ie: ck_rc3('C2Cshownetworks', app);
            fprintf('show networks\n');
            ck_rc3_show_networkgroup_results(app.resultsdirEditField.Value)

        case 'C2CmeanZdiff' %ie: ck_rc3('C2CmeanZdiff', app);
            figure('Name',' MEan diff Matrix of dataset ','NumberTitle','off');
            app.C2C_stat
            imagesc(app.C2C_stat.C2C.MeanZdiff);
            %ck_rc2_adjust_C2C_figure(handles.C2C_stat_g1.clusternames);

        case 'C2Cloaddata' %ie: ck_rc3('C2Cloaddata', app);
            load(fullfile(app.resultsdirEditField.Value,'parameter.mat'));
            load(fullfile(app.resultsdirEditField.Value,'Cluster.mat'));
            
            [app.namelist1,app.namelist2] = get_all_selected_filenames(app,'part');
            resultsdir = app.resultsdirEditField.Value;
            dir1=app.g1dirEditField.Value;
            dir2=app.g2dirEditField.Value;
            namelistpre1=app.namelist1;
            namelistpre2=app.namelist2;
            if app.C2CYButton.Value; choosedata = 'Y';  postfix = ''; end
            if app.C2CYc1Button.Value; choosedata = 'Yc1';  postfix = 'c1'; end
            if app.C2CYc2Button.Value; choosedata = 'Yc2';  postfix = 'c2'; end
            
            if app.C2CtwosampleButton.Value
                if ~isempty(namelistpre1)
                    assignin('base','dir1',dir1)
                    app.C2C_stat_g1=make_C2C_group_struct2(app,dir1,app.namelist1,postfix);
                    app.C2C_stat_g1.method = 2;
                    if isfield(Cluster{1},'net')
                        app.C2C_stat_g1.NET = ck_rc3_get_C2C_network_values3(resultsdir,app.C2C_stat_g1,Cluster);
                    end
                    app.C2C_stat_g1_org = app.C2C_stat_g1;
                    C2C_stat_g1 = app.C2C_stat_g1;
                    save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g1v2.mat'),'C2C_stat_g1');
                end
                % nochmal für die zweite Gruppe falls gewählt
                if ~isempty(namelistpre2)
                    app.C2C_stat_g2=make_C2C_group_struct2(app,dir2,app.namelist2,postfix);
                    app.C2C_stat_g2.method = 2;
                    
                     if isfield(Cluster{1},'net')
                         app.C2C_stat_g2.NET = ck_rc3_get_C2C_network_values3(resultsdir,app.C2C_stat_g2,Cluster);
                     end
                    app.C2C_stat_g2_org = app.C2C_stat_g2;
                    C2C_stat_g2 = app.C2C_stat_g2;
                    save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g2v2.mat'),'C2C_stat_g2');
                    
                end
            end
            
            %%%%%%%%%%%%%%%%%
            %%% paired t-test
            if app.C2CpairedButton.Value
                fprintf('paired t-test not adpated .. a little work...\n');
            %                 
            %                 %%%%%%modified sb 28.07.2012
            %                 if get(handles.radiobuttonpairedgroups,'Value')
            %                     handles.method=3;
            %                     dir1=get(handles.editdatadirg1,'String');
            %                     dir2=get(handles.editdatadirg2,'String');
            %                     gesetzt=0;
            %                     if isfield(parameter,'C2Ccontrolparameter')
            %                         
            %                         if isfield(parameter.C2Ccontrolparameter,'pairedgroup1')
            %                             choice = questdlg('soll die alte paired liste verwendet werden:','load previous', 'Yes', 'No','No');
            %                             % Handle response
            %                             switch choice
            %                                 case 'Yes'
            %                                     app.namelist1=parameter.C2Ccontrolparameter.pairedgroup1;
            %                                     app.namelist2=parameter.C2Ccontrolparameter.pairedgroup2;
            %                                     gesetzt=1;
            %                                     
            %                                 case 'No'
            %                                     
            %                             end
            %                         end
            %                     end
            %                     % wenn noch nicht eingetragen dann frage ab
            %                     if ~gesetzt
            %                         [t1,sts1]=spm_select([1 Inf],'mat',...
            %                             'Please select C2C_* Files in the correct (paired) oder ',[],dir1,'Cluster_');
            %                         [t2,sts2]=spm_select(size(t1,1),'mat',...
            %                             'Please select C2C_* Files in the correct (paired) oder ',[],dir2,'Cluster_');
            %                         for i=1:size(t1,1)
            %                             [p1 f1 e1 ] = fileparts(t1(i,:));
            %                             [p2 f2 e2 ] = fileparts(t2(i,:));
            %                             app.namelist1{i,1}=[f1 '.mat'];
            %                             app.namelist2{i,1}=[f2 '.mat'];
            %                         end
            %                     end
            %                     %     tmp2name=dir(fullfile(dir2,'AAL_*.mat'));
            %                     %     for i=1:size(tmp2name,1)
            %                     %         app.namelist2{i,1}=tmp2name(i,1).name;
            %                     %     end
            %                     assignin('base','app.namelist1',app.namelist1);
            %                     assignin('base','app.namelist2',app.namelist2);
            %                     set(handles.textg1subjects,'String',num2str(size(app.namelist1,1)));
            %                     set(handles.textg2subjects,'String',num2str(size(app.namelist2,1)));
            %                     namelistpre1=app.namelist1;
            %                     namelistpre2=app.namelist2;
            %                     handles.C2C_stat_g1=make_C2C_group_struct(dir1,app.namelist1);
            %                     handles.C2C_stat_g2=make_C2C_group_struct(dir2,app.namelist2);
            %                     % erstelle stuct nur zum Abspeichern
            %                     C2C_stat_g1=struct;
            %                     C2C_stat_g2=struct;
            %                     C2C_stat_g1=handles.C2C_stat_g1;C2C_stat_g1.method = handles.method;
            %                     C2C_stat_g2=handles.C2C_stat_g2;C2C_stat_g2.method = handles.method;
            %                     handles.C2C_stat_g1_org = C2C_stat_g1;
            %                     handles.C2C_stat_g2_org = C2C_stat_g2;
            %                     save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g1.mat'),'C2C_stat_g1');
            %                     save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g2.mat'),'C2C_stat_g2');
            %                 end
            end
            %%% end modified sb 28.07.2012
            
            app.C2Cgroup1ListBox.Items = app.namelist1;
            app.C2Cgroup2ListBox.Items = app.namelist2;
            
            app.C2CloaddataLamp.Color = 'green';
        case 'C2Cloaddata' %ie: ck_rc3('C2Cloaddata', app);
            load(fullfile(app.resultsdirEditField.Value,'parameter.mat'));
            load(fullfile(app.resultsdirEditField.Value,'Cluster.mat'));
            
            [app.namelist1,app.namelist2] = get_all_selected_filenames(app,'part');
            resultsdir = app.resultsdirEditField.Value;
            dir1=app.g1dirEditField.Value;
            dir2=app.g2dirEditField.Value;
            namelistpre1=app.namelist1;
            namelistpre2=app.namelist2;
            if app.C2CYButton.Value; choosedata = 'Y';  postfix = ''; end
            if app.C2CYc1Button.Value; choosedata = 'Yc1';  postfix = 'c1'; end
            if app.C2CYc2Button.Value; choosedata = 'Yc2';  postfix = 'c2'; end
            
            if app.C2CtwosampleButton.Value
                if ~isempty(namelistpre1)
                    assignin('base','dir1',dir1)
                    app.C2C_stat_g1=make_C2C_group_struct(app,dir1,app.namelist1,postfix);
                    app.C2C_stat_g1.method = 2;
                    if isfield(Cluster{1},'net')
                        app.C2C_stat_g1 = ck_rc3_get_C2C_network_values(resultsdir,app.C2C_stat_g1,Cluster);
                    end
                    app.C2C_stat_g1_org = app.C2C_stat_g1;
                    C2C_stat_g1 = app.C2C_stat_g1;
                    save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g1.mat'),'C2C_stat_g1');
                end
                % nochmal für die zweite Gruppe falls gewählt
                if ~isempty(namelistpre2)
                    app.C2C_stat_g2=make_C2C_group_struct(app,dir2,app.namelist2,postfix);
                    app.C2C_stat_g2.method = 2;
                    if isfield(Cluster{1},'net')
                        app.C2C_stat_g2 = ck_rc3_get_C2C_network_values(resultsdir,app.C2C_stat_g2,Cluster);
                    end
                    app.C2C_stat_g2_org = app.C2C_stat_g2;
                    C2C_stat_g2 = app.C2C_stat_g2;
                    save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g2.mat'),'C2C_stat_g2');
                    
                end
            end
            
            %%%%%%%%%%%%%%%%%
            %%% paired t-test
            if app.C2CpairedButton.Value
                fprintf('paired t-test not adpated .. a little work...\n');
            %                 
            %                 %%%%%%modified sb 28.07.2012
            %                 if get(handles.radiobuttonpairedgroups,'Value')
            %                     handles.method=3;
            %                     dir1=get(handles.editdatadirg1,'String');
            %                     dir2=get(handles.editdatadirg2,'String');
            %                     gesetzt=0;
            %                     if isfield(parameter,'C2Ccontrolparameter')
            %                         
            %                         if isfield(parameter.C2Ccontrolparameter,'pairedgroup1')
            %                             choice = questdlg('soll die alte paired liste verwendet werden:','load previous', 'Yes', 'No','No');
            %                             % Handle response
            %                             switch choice
            %                                 case 'Yes'
            %                                     app.namelist1=parameter.C2Ccontrolparameter.pairedgroup1;
            %                                     app.namelist2=parameter.C2Ccontrolparameter.pairedgroup2;
            %                                     gesetzt=1;
            %                                     
            %                                 case 'No'
            %                                     
            %                             end
            %                         end
            %                     end
            %                     % wenn noch nicht eingetragen dann frage ab
            %                     if ~gesetzt
            %                         [t1,sts1]=spm_select([1 Inf],'mat',...
            %                             'Please select C2C_* Files in the correct (paired) oder ',[],dir1,'Cluster_');
            %                         [t2,sts2]=spm_select(size(t1,1),'mat',...
            %                             'Please select C2C_* Files in the correct (paired) oder ',[],dir2,'Cluster_');
            %                         for i=1:size(t1,1)
            %                             [p1 f1 e1 ] = fileparts(t1(i,:));
            %                             [p2 f2 e2 ] = fileparts(t2(i,:));
            %                             app.namelist1{i,1}=[f1 '.mat'];
            %                             app.namelist2{i,1}=[f2 '.mat'];
            %                         end
            %                     end
            %                     %     tmp2name=dir(fullfile(dir2,'AAL_*.mat'));
            %                     %     for i=1:size(tmp2name,1)
            %                     %         app.namelist2{i,1}=tmp2name(i,1).name;
            %                     %     end
            %                     assignin('base','app.namelist1',app.namelist1);
            %                     assignin('base','app.namelist2',app.namelist2);
            %                     set(handles.textg1subjects,'String',num2str(size(app.namelist1,1)));
            %                     set(handles.textg2subjects,'String',num2str(size(app.namelist2,1)));
            %                     namelistpre1=app.namelist1;
            %                     namelistpre2=app.namelist2;
            %                     handles.C2C_stat_g1=make_C2C_group_struct(dir1,app.namelist1);
            %                     handles.C2C_stat_g2=make_C2C_group_struct(dir2,app.namelist2);
            %                     % erstelle stuct nur zum Abspeichern
            %                     C2C_stat_g1=struct;
            %                     C2C_stat_g2=struct;
            %                     C2C_stat_g1=handles.C2C_stat_g1;C2C_stat_g1.method = handles.method;
            %                     C2C_stat_g2=handles.C2C_stat_g2;C2C_stat_g2.method = handles.method;
            %                     handles.C2C_stat_g1_org = C2C_stat_g1;
            %                     handles.C2C_stat_g2_org = C2C_stat_g2;
            %                     save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g1.mat'),'C2C_stat_g1');
            %                     save(fullfile(app.resultsdirEditField.Value,'C2C_stat_g2.mat'),'C2C_stat_g2');
            %                 end
            end
            %%% end modified sb 28.07.2012
            
            app.C2Cgroup1ListBox.Items = app.namelist1;
            app.C2Cgroup2ListBox.Items = app.namelist2;
            
            app.C2CloaddataLamp.Color = 'green';
            
            
            % speichere die Eintragungen zur späteren Verwendung
            % bei erneuten Aufrufen der Gui damit diese dann sofort automatisch
            % eingetragen werden können
            %             load(fullfile(app.resultsdirEditField.Value,'parameter.mat'));
            %             parameter.C2Ccontrolparameter.dir1=get(app.g1dirEditField.Value);
            %             parameter.C2Ccontrolparameter.dir2=get(handles.editdatadirg2,'String');
            %             parameter.C2Ccontrolparameter.radiobuttononegroup=get(handles.radiobuttononegroup,'Value');
            %             parameter.C2Ccontrolparameter.radiobuttontwogroups=get(handles.radiobuttontwogroups,'Value');
            %             parameter.C2Ccontrolparameter.radiobuttonpairedgroups=get(handles.radiobuttonpairedgroups,'Value');
            %             parameter.C2Ccontrolparameter.editg1datafile=handles.editg1datafile.String;
            %             parameter.C2Ccontrolparameter.editg1titlefile=handles.editg1titlefile.String;
            %             parameter.C2Ccontrolparameter.editg2datafile=handles.editg2datafile.String;
            %             parameter.C2Ccontrolparameter.editg2titlefile=handles.editg2titlefile.String;
            %             save(fullfile(app.resultsdirEditField.Value,'parameter.mat'),'parameter');
            %            guidata(hObject,handles);
        case 'C2Cexelreadme' %ie: ck_rc3('C2Cexelreadme', app);
            readme{1,1} = 'Behavioral data\n';
            readme{2,1} = '-----------------------------------------------------------\n';
            readme{3,1} = 'Datenformat\n';
            readme{4,1} = 'Daten werden als Exel file uebergeben\n';
            readme{5,1} = 'die erste Zeile Kennzeichnet die Varibalennamen \n';
            readme{6,1} = 'Eine Spalte muss den Titel "ID" tragen\n';
            readme{7,1} = 'Diese ID wird mit den letzten 4 Ziffern der Datensatznamen\n';
            readme{8,1} = 'verglichen und die entsprechenden Werte den Probanden/Patienten\n';
            readme{9,1} = 'Zugeordnet\n';
            
            txt = '';
            for i=1:size(readme,1)
                txt = [txt readme{i,1}]; %#ok<AGROW>
            end
            helpdlg(sprintf(txt));

        case 'C2Cestimatenetworkcorrelation' %ie: ck_rc3('C2Cestimatenetworkcorrelation', app);
            fprintf('estimate exel correlation');
            [varnamelistsel,BG1,BG2] = get_selected_exel_data(app);
            load(fullfile(app.resultsdirEditField.Value,'parameter.mat'));
            load(fullfile(app.resultsdirEditField.Value,'C2C_stat.mat'));
            parameter.behavioraldata = [BG1 ;BG2];
            parameter.behavioraltitle = varnamelistsel;
            save(fullfile(app.resultsdirEditField.Value,'parameter.mat'),'parameter');
            
            h=waitbar(0,'Please wait estimating');
            waitbar(1 / 4);
            [G1] = get_Rg(app,app.resultsdirEditField.Value,1,BG1);
            G1.BG = BG1;
            G1.TG = varnamelistsel;
            waitbar(2/4);
            [G2] = get_Rg(app,app.resultsdirEditField.Value,2,BG2);
            G2.BG = BG2;
            G2.TG = varnamelistsel;
            waitbar(3/4);
            G = estimate_GroupDiff(app,G1,G2);
            G.G1 = G1;
            G.G2 = G2;
            G.clusternames = C2C_stat.clusternames;
            G.clusternames_org = G.clusternames;
            G.networknames = C2C_stat.Network2.networknames';
            % waitbar(1);
            waitbar(4/4);
            
            C2C_stat.G = G;
            save(fullfile(app.resultsdirEditField.Value,'C2C_stat.mat'),'C2C_stat');
            app.C2C_stat = C2C_stat;
            close(h);
            app.C2CestimateexelcorrelationLamp.Color = 'green';

        case 'C2Cestimatecorrelation' %ie: ck_rc3('C2Cestimatecorrelation', app);
            fprintf('estimate exel correlation');
            [varnamelistsel,BG1,BG2] = get_selected_exel_data(app);
            load(fullfile(app.resultsdirEditField.Value,'parameter.mat'));
            load(fullfile(app.resultsdirEditField.Value,'C2C_stat.mat'));
            parameter.behavioraldata = [BG1 ;BG2];
            parameter.behavioraltitle = varnamelistsel;
            save(fullfile(app.resultsdirEditField.Value,'parameter.mat'),'parameter');
            
            h=waitbar(0,'Please wait estimating');
            waitbar(1 / 4);
            [G1] = get_Rg(app,app.resultsdirEditField.Value,1,BG1);
            G1.BG = BG1;
            G1.TG = varnamelistsel;
            waitbar(2/4);
            [G2] = get_Rg(app,app.resultsdirEditField.Value,2,BG2);
            G2.BG = BG2;
            G2.TG = varnamelistsel;
            waitbar(3/4);
            G = estimate_GroupDiff(app,G1,G2);
            G.G1 = G1;
            G.G2 = G2;
            G.clusternames = C2C_stat.clusternames;
            G.clusternames_org = G.clusternames;
            G.networknames = C2C_stat.Network2.networknames';
            % waitbar(1);
            waitbar(4/4);
            
            C2C_stat.G = G;
            save(fullfile(app.resultsdirEditField.Value,'C2C_stat.mat'),'C2C_stat');
            app.C2C_stat = C2C_stat;
            close(h);
            app.C2CestimateexelcorrelationLamp.Color = 'green';

        case 'C2CestimateClusterstatistic2' %ie: ck_rc3('C2CestimateClusterstatistic2', app);
            resultsdir = app.resultsdirEditField.Value;
            %dir1=app.g1dirEditField.Value;
            %dir2=app.g2dirEditField.Value;
            
            %erstelle die zu übergebende Datenstruktur
            if app.C2CtwosampleButton.Value
                method = 2;
            elseif app.C2CpairedButton.Value
                method = 3;
            end
            
            unsel_g1 = get_unselected_idx(app,app.C2Cgroup1ListBox);
            unsel_g2 = get_unselected_idx(app, app.C2Cgroup2ListBox);
            
            
            app.namelist1 = app.C2Cgroup1ListBox.Value;
            app.namelist2 = app.C2Cgroup2ListBox.Value;
            
            [app.C2C_stat_g1_des] = deslect_subjects_ck2(app, app.C2C_stat_g1_org, app.namelist1, unsel_g1);
            [app.C2C_stat_g2_des] = deslect_subjects_ck2(app, app.C2C_stat_g2_org, app.namelist2, unsel_g2);
            
            
            
            data=struct;
            if isempty(app.namelist1) || isempty(app.namelist2)
                msgbox('you have to selct at least one subject of each group');
                return
            else
                numgroup=2;
            end
            
            
              
            normalize = app.C2CnormalizeCheckBox.Value;
            C2C_stat=ck_rc3_estimate_C2C_statistic2(resultsdir,app.C2C_stat_g1_des,app.C2C_stat_g2_des,numgroup,method,normalize);
            %               unc = 0.05;
            %             fdr = 0.05;
            %             fwe = 0.05;
            %             assignin('base','C2C_stat',C2C_stat);
            %             % Oberflaeche
            %             %C2C_stat.Oberflaeche = .... % noch einzufuegen
            %             % Berechnung der Netzwerkkonnektivitaet falls diese zuvor spezifiziert
            %             % wurde (Cluster{i}.group)
            %             load(fullfile(resultsdir,'Cluster.mat'));
            %             %if isfield(Cluster{1},'group')
            %             if isfield(Cluster{1},'net')
            %                 IntraNetwork=ck_rc3_estimate_C2C_network_groups_statistic(resultsdir,unc,fdr,fwe,...
            %                     data,numgroup,method,normalize,app.C2C_stat,Cluster);
            %                Network2=ck_rc3_estimate_C2C_network_groups_statistic2(resultsdir,unc,fdr,fwe,...
            %                     data,numgroup,method,normalize,app.C2C_stat,Cluster);
            %                Network3=ck_rc3_estimate_C2C_network_groups_statistic3(resultsdir,unc,fdr,fwe,...
            %                     data,numgroup,method,normalize,app.C2C_stat,Cluster);
            %             end
            %             %C2C_stat = C2C_stat;        
            %             C2C_stat.Network=Network3;
            %             %C2C_stat.Network2=Network2;
             %            C2C_stat.C2C.clusternames=app.C2C_stat_g1.clusternames;
            %             %app.C2C_stat=C2C_stat;
             app.C2C_stat = C2C_stat;
            %             assignin('base','C2C_stat',C2C_stat);
             save(fullfile(resultsdir,'C2C_stat.mat'),'C2C_stat');
            %             save(fullfile(resultsdir,'IntraNetwork.mat'),'IntraNetwork');
            %               
            assignin('base','C2C_stat',C2C_stat);
            app.C2CestimatedataLamp.Color = 'green';

        case 'C2CestimateClusterstatistic' %ie: ck_rc3('C2CestimateClusterstatistic', app);
            resultsdir = app.resultsdirEditField.Value;
            dir1=app.g1dirEditField.Value;
            dir2=app.g1dirEditField.Value;
            
            %erstelle die zu übergebende Datenstruktur
            if app.C2CtwosampleButton.Value
                method = 2;
            elseif app.C2CpairedButton.Value
                method = 3;
            end
            
            unsel_g1 = get_unselected_idx(app,app.C2Cgroup1ListBox);
            unsel_g2 = get_unselected_idx(app, app.C2Cgroup2ListBox);
            
            
            app.namelist1 = app.C2Cgroup1ListBox.Value;
            app.namelist2 = app.C2Cgroup2ListBox.Value;
            
            [app.C2C_stat_g1_des] = deslect_subjects_ck(app, app.C2C_stat_g1_org, app.namelist1, unsel_g1);
            [app.C2C_stat_g2_des] = deslect_subjects_ck(app, app.C2C_stat_g2_org, app.namelist2, unsel_g2);
            
            
            
            data=struct;
            if isempty(app.namelist1)
                msgbox('you have to selct at least one subject of group1');
                return
            else
                numgroup=1;
                assignin('base','C2C_stat_g1_des',app.C2C_stat_g1_des);
                % Uebertragung aller Korrelationsmasse von Gruppe 1
                if isfield(app.C2C_stat_g1_des,'R'); data.R1=app.C2C_stat_g1_des.R;  end
                if isfield(app.C2C_stat_g1_des,'P'); data.P1=app.C2C_stat_g1_des.P;  end
                if isfield(app.C2C_stat_g1_des,'Z'); data.Z1=app.C2C_stat_g1_des.Z;  end
                if isfield(app.C2C_stat_g1_des,'Syn'); data.Syn1=app.C2C_stat_g1_des.Syn;  end
                if isfield(app.C2C_stat_g1_des,'PLV'); data.PLV1=app.C2C_stat_g1_des.PLV;  end
                if isfield(app.C2C_stat_g1_des,'T'); data.T1=app.C2C_stat_g1_des.T; end
                if isfield(app.C2C_stat_g1_des,'Coh'); data.Coh1=app.C2C_stat_g1_des.Coh;  end
                if isfield(app.C2C_stat_g1_des,'CohF'); data.CohF1=app.C2C_stat_g1_des.CohF;  end
                if isfield(app.C2C_stat_g1_des,'Comp'); data.Comp1=app.C2C_stat_g1_des.Comp; end
                if isfield(app.C2C_stat_g1_des,'Power'); data.Power1=app.C2C_stat_g1_des.Power;  end
                if isfield(app.C2C_stat_g1_des,'RN'); data.RN1=app.C2C_stat_g1_des.RN;  end
                if isfield(app.C2C_stat_g1_des,'RiN'); data.RiN1=app.C2C_stat_g1_des.RiN;  end
                if isfield(app.C2C_stat_g1_des,'ZN'); data.ZN1=app.C2C_stat_g1_des.ZN;  end
                if isfield(app.C2C_stat_g1_des,'ZiN'); data.ZiN1=app.C2C_stat_g1_des.ZiN;  end
                if isfield(app.C2C_stat_g1_des,'GNM'); data.GNM1=app.C2C_stat_g1_des.GNM;  end
                if isfield(app.C2C_stat_g1_des,'GiNM'); data.GiNM1=app.C2C_stat_g1_des.GiNM;  end
            end
            if isempty(app.namelist2)
                msgbox('you have to select at least one dataset of group 2');
                return
            else
                numgroup=2;
                if isfield(app.C2C_stat_g2_des,'R'); data.R2=app.C2C_stat_g2_des.R;  end
                if isfield(app.C2C_stat_g2_des,'P'); data.P2=app.C2C_stat_g2_des.P;  end
                if isfield(app.C2C_stat_g2_des,'Z'); data.Z2=app.C2C_stat_g2_des.Z;  end
                if isfield(app.C2C_stat_g2_des,'Syn'); data.Syn2=app.C2C_stat_g2_des.Syn;  end
                if isfield(app.C2C_stat_g2_des,'PLV'); data.PLV2=app.C2C_stat_g2_des.PLV;  end
                if isfield(app.C2C_stat_g2_des,'T'); data.T2=app.C2C_stat_g2_des.T;  end
                if isfield(app.C2C_stat_g2_des,'Coh'); data.Coh2=app.C2C_stat_g2_des.Coh;  end
                if isfield(app.C2C_stat_g2_des,'CohF'); data.CohF2=app.C2C_stat_g2_des.CohF;  end
                if isfield(app.C2C_stat_g2_des,'Comp'); data.Comp2=app.C2C_stat_g2_des.Comp; end
                if isfield(app.C2C_stat_g2_des,'Power'); data.Power2=app.C2C_stat_g2_des.Power;  end
                if isfield(app.C2C_stat_g2_des,'RN'); data.RN2=app.C2C_stat_g2_des.RN;  end
                if isfield(app.C2C_stat_g2_des,'RiN'); data.RiN2=app.C2C_stat_g2_des.RiN;  end
                if isfield(app.C2C_stat_g2_des,'ZN'); data.ZN2=app.C2C_stat_g2_des.ZN;  end
                if isfield(app.C2C_stat_g2_des,'ZiN'); data.ZiN2=app.C2C_stat_g2_des.ZiN;  end
                if isfield(app.C2C_stat_g1_des,'GNM'); data.GNM2=app.C2C_stat_g1_des.GNM;  end
                if isfield(app.C2C_stat_g1_des,'GiNM'); data.GiNM2=app.C2C_stat_g1_des.GiNM;  end           
            end            
            assignin('base','data1',data);
            unc = 0.05;
            fdr = 0.05;
            fwe = 0.05;
            % Festlegung welche Daten ... Y oder Yc1 oder Yc2
            
              
            normalize = app.C2CnormalizeCheckBox.Value;
            C2C_stat=ck_rc3_estimate_C2C_statistic(resultsdir,unc,fdr,fwe,data,numgroup,method,normalize);
            
            assignin('base','datax',data);
            % Berechnung der Netzwerkkonnektivitaet falls diese zuvor spezifiziert
            % wurde (Cluster{i}.group)
            load(fullfile(resultsdir,'Cluster.mat'));
            %if isfield(Cluster{1},'group')
            if isfield(Cluster{1},'net')
                Network=ck_rc3_estimate_C2C_network_groups_statistic(resultsdir,unc,fdr,fwe,...
                    data,numgroup,method,normalize,app.C2C_stat,Cluster);
               Network2=ck_rc3_estimate_C2C_network_groups_statistic2(resultsdir,unc,fdr,fwe,...
                    data,numgroup,method,normalize,app.C2C_stat,Cluster);
            end
            %C2C_stat = C2C_stat;        
            C2C_stat.Network=Network;
            C2C_stat.Network2=Network2;
            C2C_stat.clusternames=app.C2C_stat_g1.clusternames;
            app.C2C_stat=C2C_stat;
            %app.C2C_stat = app.C2C_stat;
            assignin('base','C2C_stat',C2C_stat);
            save(fullfile(resultsdir,'C2C_stat.mat'),'C2C_stat');
            
            assignin('base','C2C_stat',C2C_stat);
            app.C2CestimatedataLamp.Color = 'green';

        case 'export_results'
            % CHECK THE EXPORT OPTIONS
            export_rep = app.export_group_as_rep_measure.Value;
            export_trial = app.export_group_as_trial.Value;
            if ~(export_rep | export_trial),warndlg('bitte eine Option auswaehlen!'); return; end

            % CHECK THE EXPORT GROUPS
            g1_list = app.g1ListBox.Value;
            g2_list = app.g2ListBox.Value;

            if isempty(g1_list) & isempty(g2_list), warndlg('keine Cluster ausgewaehlt (*Cluster.mat)'); return; end

            % PREPARE DATA
            cfg = struct;
            cfg.g1_list = g1_list; 
            cfg.g2_list = g2_list;
            cfg.g1_dir = app.g1dirEditField.Value;
            cfg.g2_dir = app.g2dirEditField.Value;
            cfg.results_dir = app.resultsdirEditField.Value;
            if export_rep
                cfg.method = 'repeated measurements';
            else
                cfg.method = 'trials';
            end

            ck_rc3_export(cfg);

        otherwise
            fprintf('ck_rc3: argument %s not found\n', actionstr)

    end


end

%% |||||||||||||| PRIVATE FUNCTIONS ||||||||||||||||||||||||||||
function stat = listboxupdate(app)
    stat = 1;
    fprintf('updating listbox\n');
    

    
    g1 = dir([app.g1dirEditField.Value filesep '*.mat']);
    g2 = dir([app.g2dirEditField.Value filesep '*.mat']);
    
    listg1{1}='empty';
    idxg1 = 1;
    listg2{1}='empty';
    idxg2 = 1;
    
    Valg1(1)=1;
    Valg2(1)=1;
    for i=1:size(g1,1)
        listg1{i} = g1(i,1).name;
    end
    for i=1:size(g2,1)
        listg2{i} = g2(i,1).name;
    end
    app.g1ListBox.Items=listg1;
    app.g2ListBox.Items=listg2;
    
    % if idxg1>1
    %     set(handles.listboxg1,'Value',Valg1);
    % else
    %     set(handles.listboxg1,'Value',1);
    % end
    % if idxg2>1
    %     set(handles.listboxg2,'Value',Valg2);
    % else
    %     set(handles.listboxg2,'Value',1);
    % end
    %
    %save(fullfile(fileparts(which('ck_rc2.m')),'lastprocessingdir.mat'),'lastprocessingdir');
    % speichere REchnerspezifisch unter Hilfe der MAC Adresse des REchners
    
    %[~,result] = dos('getmac')
    %mac = result(160:176);
    mac = '123456789101010';
    try
        load(fileparts(which(which('ck_rc3.mlapp')),['lastsession_' mac '.mat']),'lastsession');
        
        cd(app.resultsdirEditField.Value);
    catch
        lastsession.resultsdir = app.resultsdirEditField.Value;
        cd(app.resultsdirEditField.Value);
    end
    lastsession.resultsdir = app.resultsdirEditField.Value;
    lastsession.datadirg1 = app.g1dirEditField.Value;
    lastsession.datadirg2 = app.g2dirEditField.Value;
    %     lastsession.multifileg1 = handles.multifileg1;
    %     lastsession.multifileg2 = handles.multifileg2;
    savefile = fullfile(fileparts(which('ck_rc3.mlapp')),['lastsession_' mac '.mat']);
    save(savefile,'lastsession');
    parameterfile = fullfile(app.resultsdirEditField.Value,'parameter.mat');
    try
        load(parameterfile);
    catch
        parameter = struct;
    end
    parameter.outdir = app.resultsdirEditField.Value;
    parameter.datadirg1 = app.g1dirEditField.Value;
    parameter.datadirg2 = app.g2dirEditField.Value;
    try
        save(parameterfile,'parameter');
    catch
        fprintf('fehler beim Speichern des Parameterfiles\n');
    end
    
end

function C = del_network(app,C)
    for i=1:length(C)
        if isfield(C{i},'net')
            C{i} = rmfield(C{i},'net');
        end
        if isfield(C{i},'group')
            C{i} = rmfield(C{i},'group');
        end
        if isfield(C{i},'groupname')
            C{i} = rmfield(C{i},'groupname');
        end
        if isfield(C{i},'groupm')
            C{i} = rmfield(C{i},'groupm');
        end
        if isfield(C{i},'groupnamem')
            C{i} = rmfield(C{i},'groupnamem');
        end
        if isfield(C{i},'num_global_networks')
            C{i} = rmfield(C{i},'num_global_networks');
        end
        if isfield(C{i},'num_local_networks')
            C{i} = rmfield(C{i},'num_local_networks');
        end
    end
    
end

function cell_list = get_updatedataimport_list(rootdir,subdir, file_str)
    %rootdir = 'H:\data_ck\Vesti\data';
    %filter = 'filter_rs6';
    cell_list = {};

    
    dx = dir(rootdir);
    idx = 0;
    %dx2 = dx;
    for i=1:length(dx)
        if dx(i).isdir && ~strcmp(dx(i).name,'.') && ~strcmp(dx(i).name,'..')
            idx = idx + 1;
            dx2(idx)=dx(i);
        end
    end
    
    idx = 0;
    for i=1:length(dx2)
        dtmp = dir([rootdir, filesep ,dx2(i).name]);
        subdir_exist = 0;
        for j=1:length(dtmp)
            
            if dtmp(j).isdir && ~strcmp(dtmp(j).name,'.') && ~strcmp(dtmp(j).name,'..')
                if strcmp(dtmp(j).name,subdir)
                    %fprintf('korrektes unterverzeichnis gefunden %.0d %.0d\n',i,j)
                    subdir_exist = 1;
                end
            end
        end
        if subdir_exist || isempty(subdir)
            idx = idx + 1;
            rel_subdirs(idx)=dx2(i);
            cell_list{idx} = dx2(i).name;
        end
        % wenn es keinen Filter gibt dann sollten die Bilder im Subjectverzeichnis sein
        
    end
    assignin('base','cell_list',cell_list);
    
end

function file_list = get_full_subjects_filenames(path,Items, subdir, filefilter)
    %assignin('base','Items',Items);
    %            length(Items)
    file_list = [];

    for i=1:length(Items)
        
        tmp = [path filesep Items{i} filesep filefilter];
        if ~isempty(subdir)
            tmp = [path filesep Items{i} filesep subdir filesep filefilter];
        end
    %                tmp = [p filefilter];
        
        files = dir(tmp);
        assignin('base','files',files);
        
        for j=1:length(files)
            name = fullfile(files(j).folder,files(j).name);
            file_list{i}(j,1:length(name))=name;
        end
        %file_list{i} = spm_vol(name);
    %                path_list{i}=[path filesep Items{i} filesep subdir];
    end
                    

    %assignin('base','file_list',file_list);
end



function error = test_existence(app, rootdir,pathlist, subdir)
    error = 0;
    for i=1:length(pathlist)
        
        p = [rootdir filesep pathlist{i} filesep subdir];

        e1 = exist(fullfile(p,app.graymatterfilenameEditField.Value));
        e2 = exist(fullfile(p,app.whitematterfilenameEditField.Value));
        e3 = exist(fullfile(p,app.csffilenameEditField.Value));
       
        if (e1+e2+e3)~=6
            fprintf('no c1-2-3 files were found in folder %s \n',p);
            error = 1;
        end
    end
end

function [listg1,listg2] = get_all_selected_filenames(app,string)
    
    d1 = [app.g1dirEditField.Value,filesep'];
    d2 = [app.g2dirEditField.Value,filesep'];
    
    listg1 = app.g1ListBox.Value;
    listg2 = app.g2ListBox.Value;
    
    if strcmp(string,'full')
        listg1 = strcat(d1,listg1);
        listg2 = strcat(d2,listg2);
    end

end

function Cluster = reduce_Cluster(app,filelist,prefix)
    % entfernt die Y Daten und speichert die Cluster unter neuem Namen ab
    
    for i=1:length(filelist)
        fprintf('reduce_Cluster %.0d / %.0d subjects\n',i,length(filelist));
        file = filelist{i};
        [p,f,e] = fileparts(file);
        newfilename = fullfile(p,[prefix, f, e]);
        load(file); % load Cluster
        for j=1:length(Cluster)
            
            if isfield(Cluster{j},'Y') && app.YCheckBox.Value
                Cluster{j} = rmfield(Cluster{j},'Y');
            end
            if isfield(Cluster{j},'Yc1') && app.Yc1CheckBox.Value
                Cluster{j} = rmfield(Cluster{j},'Yc1');
            end
            if isfield(Cluster{j},'Yc2') && app.Yc2CheckBox.Value
                Cluster{j} = rmfield(Cluster{j},'Yc2');
            end
        end
        save(newfilename,'Cluster');
        
    end
    
end

function C2C_stat_g1 = deslect_subjects_ck(app,C2C_stat_g1,namelist,idx)
    %fprintf('deselect subjects\n');
    if length(idx)==0
        return;
    end
    %C2C_stat_g1.Z
    
    
    if isfield(C2C_stat_g1,'R'); C2C_stat_g1.R(:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'P'); C2C_stat_g1.P(:,:,idx)=[];  end
    if isfield(C2C_stat_g1,'Z'); C2C_stat_g1.Z(:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'Syn'); C2C_stat_g1.Syn(:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'PLV'); C2C_stat_g1.PLV(:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'T'); C2C_stat_g1.T(:,:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'Coh'); C2C_stat_g1.Coh(:,:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'CohF'); C2C_stat_g1.CohF(:,:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'Power'); C2C_stat_g1.Power(:,idx)=[]; end
    if isfield(C2C_stat_g1,'Comp'); C2C_stat_g1.Comp(:,idx)=[]; end
    if isfield(C2C_stat_g1,'RiN'); C2C_stat_g1.RiN(:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'RN'); C2C_stat_g1.RN(:,idx)=[]; end
    if isfield(C2C_stat_g1,'ZiN'); C2C_stat_g1.ZiN(:,:,idx)=[]; end
    if isfield(C2C_stat_g1,'ZN'); C2C_stat_g1.ZN(:,idx)=[]; end
    if isfield(C2C_stat_g1,'namelist'); C2C_stat_g1.namelist = namelist; end
    
    

end

function unsel = get_unselected_idx(app,listbox)
    tmpall = listbox.Items;
    tmpsel = listbox.Value;
    tmp = ismember(tmpall,tmpsel)==0;
    unsel = find(tmp);
end

function C2C = make_C2C_group_struct(app,dir,namelist,postfix)
    % postfix definiert die Daten die rausgeschrieben werden Y Yc1, Yc2
    h=waitbar(0,'Please wait');
    
    % gibt es eine Netzwerkdefinition ?
    load(fullfile(app.resultsdirEditField.Value,'Cluster.mat'));
    if isfield(Cluster,'net')
        net =1;
    end
    
    load(fullfile(dir,namelist{1,1}));
    C2C.R=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    C2C.P=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    C2C.Z=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    C2C.Syn=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    %C2C.T=zeros(size(Cluster,1),1,size(Cluster,1),length(namelist));
    C2C.PLV=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    Power=zeros(size(Cluster,1),length(namelist));
    clusterXYZ = cell(0);
    for i=1:length(namelist)
        waitbar(i / length(namelist));
        fprintf('load Cluster %s \n',fullfile(dir,namelist{i}));
        load(fullfile(dir,namelist{i}));
        % die Clusternamen und Koordinaten werden aus einem
        % Cluster extrahiert (alle Cluster müssen natürlich gleich sein)
        %fprintf('%d\n',size(Cluster,1));
        %fprintf('loading %s\n',namelist{i});
        for j=1:size(Cluster,1)
            clusternames{j,1}=Cluster{j,1}.name;
            if isfield(Cluster{j,1},'XYZ')
                clusterXYZ{j,1}=Cluster{j,1}.XYZ;
            end
            %assignin('base','Cluster',Cluster);
            if ~isfield(Cluster{j,1},'Cluster2Cluster')
                error('please estimate C2C connectivity first (no Cluster2Cluster field in Cluster struct)');
                
            end
           
            if isfield(Cluster{j,1}.Cluster2Cluster,['R', postfix])
                C2C.R(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['R', postfix]);
                C2C.P(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['P', postfix]);
                C2C.Z(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['Z', postfix]);
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['T', postfix]))
                Tx = Cluster{j,1}.Cluster2Cluster.(['T', postfix]);
                C2C.T(:,1:size(Tx,1),j,i)=Tx';
            end
            % hier manchmal komplexe Zahlen ... evtl bei merkwuerdiegen Y_mean eingabe
            try
            if isfield(Cluster{j,1}.Cluster2Cluster,(['Coh', postfix]))
                Coh = Cluster{j,1}.Cluster2Cluster.(['Coh', postfix]);
                CohF = Cluster{j,1}.Cluster2Cluster.(['CohF', postfix]);
                C2C.Coh(:,1:size(Coh,2),j,i)=Coh;
                C2C.CohF(:,1:size(Coh,2),j,i)=CohF;
            end
            catch
                fprintf('choerence konnte nicht berechnet werden warscheinlich Y_mean ungeeignet\n');
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['Syn', postfix]))
                C2C.Syn(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['Syn', postfix]);
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['PLV', postfix]))
                C2C.PLV(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['PLV', postfix]);
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['Comp', postfix]))
                C2C.Comp(j,i)=Cluster{j,1}.Cluster2Cluster.(['Comp', postfix]);
            end
            Y_mean = Cluster{j,1}.(['Y', postfix, '_mean']);
            C2C.Power(j,i)=sum(Y_mean.^2)/(length(Y_mean)*2+1);
            
            % Netzwerk einfuegen 
            % C2C.RiN
            % C2C.ZiN
            
        end
        
    end
    close(h)
    C2C.clusternames=clusternames;
    C2C.clusterXYZ=clusterXYZ;
    C2C.namelist = namelist;
end

function idx = get_rows_of_subjects(app,IDlist,names)
    assignin('base','IDlist',IDlist)
    k = 1;
    for i=1:length(names)
        
        assignin('base','names',names);
        id = str2num(names{i}(end-7:end-4));
        tmp = find(IDlist==id);
        if isempty(tmp)
            sprintf(str,'Patient ID not found %s ',id);
            msgdlg(str);
        else
        idx(k) = tmp;
        k = k + 1;
        end
    end
end


% berechnet die Korrelation zwischen Konnektivitaet und behavioralen Daten
%function [R_3d,R,P,clusternames] = get_Rg(d,group,B,handles)
function [G] = get_Rg(app, d, group, B)
    % berechnet die Korrelation zwischen Konnektivitaet und behavioralen Daten
    %function [R_3d,R,P,clusternames] = get_Rg(d,group,B,handles)
    % gibt die Variable G zurueck mit den Eintraegen
    % G.R_3d
    % G.R
    % G.P
    % G.clusternames
    % falls vorhanden noch folgende weitere
    % G.Syn
    % G.PLV
    % G.
    assignin('base','B',B);
    file = fullfile(d,'C2C_stat.mat');
    try
        load(file)
    catch
        msgbox('please estimate Cluster statistic first for group 2\n');
    end
    
    if group==1
        C2C = app.C2C_stat_g1_des;
    elseif group==2
        C2C = app.C2C_stat_g2_des;
    end
    assignin('base','C2C_stat_g1_des',app.C2C_stat_g1_des);
    R_3d = C2C.R;
    clusternames = C2C.clusternames;
    G.R_3d = R_3d;
    % berechne Korrelation zweichen Person und behavioralen Daten
    [G.RR, G.RP] = get_conn_R_B(app,R_3d, B);
    
    if isfield(C2C,'Syn')
        G.Syn_3d = C2C.Syn;
        % berechne Korrelation zwischen Synchronization yund behavioralen Daten
        [G.SynR, G.SynP] = get_conn_R_B(app,G.Syn_3d, B);
    end
    if isfield(C2C,'PLV')
        G.PLV_3d = C2C.PLV;
        [G.PLVR, G.PLVP] = get_conn_R_B(app,G.PLV_3d, B);
    end
    if isfield(C2C,'T')
        G.T_4d = C2C.T;
        for i = 1:size(G.T_4d,2)
            [G.TR(:,:,:,i), G.TP(:,:,:,i)] = get_conn_R_B(app,squeeze(G.T_4d(:,i,:,:)), B);
        end
    end
    
    try
    % Coherence
    if isfield(C2C,'Coh')
        G.Coh_4d = C2C.Coh;
        % frequenzen
        G.CohF = squeeze(C2C.CohF(1,:,1,1));
        for i = 1:size(G.Coh_4d,2)
            [G.CohR(:,:,:,i), G.CohP(:,:,:,i)] = get_conn_R_B(app,squeeze(G.Coh_4d(:,i,:,:)), B);
        end
    end
    catch
        fprintf('problems with coherence estimation see workspace with input G_Coherr and B_err\n');
        G_Coherr = squeeze(G.Coh_4d(:,i,:,:));
        B_err = B;
        assignin('base','G_Coherr',G_Coherr);
        assignin('base','B_err',B_err);
        
    end
    
    % Power
    if isfield(C2C,'Power')
        G.Power = C2C.Power;
        [G.PowerR, G.PowerP] = get_conn_R2d_B(app,G.Power, B);
    end
    
    % Complexity
    if isfield(C2C,'Power')
        G.Power = C2C.Power;
        [G.PowerR, G.PowerP] = get_conn_R2d_B(app,G.Power, B);
    end
    % intranetwork
    if isfield(C2C,'RN')
        G.RN_2d = C2C.RN;
        % berechne Korrelation zwischen Synchronization yund behavioralen Daten
        [G.RNR, G.RNP] = get_conn_R2d_B(app,G.RN_2d, B);
        G.networknames = C2C.networknames;
    end
   % internetwork
    if isfield(C2C,'RiN')
        G.RiN_3d = C2C.RiN;
        % berechne Korrelation zwischen Synchronization yund behavioralen Daten
        [G.RiNR, G.RiNP] = get_conn_R_B(app,G.RiN_3d, B);
        % fuelle die diagonalelemente mit den RN netzwerken auf
        if isfield(G,'RNR')
            for ii=1:size(G.RNR,1)
                G.RiNR(ii,ii,:)=G.RNR(ii,:);
                G.RiNP(ii,ii,:)=G.RNP(ii,:);
                G.RiN_3d(ii,ii,:)=G.RN_2d(ii,:);
                
            end
        end
        G.networknames = C2C.networknames;
    end

    
    G.clusternames = clusternames;
    G.clusternames_org = clusternames;
    
end

function G = estimate_GroupDiff(app,G1,G2)
    
    
    % berechne eine gemeinsame Korrelationsmatrix zu den behavioralen Daten
    % erzeuge eine gemeinsames R R12 mit R1 links unten  und R2 rechts oben
    assignin('base','G1',G1);
    assignin('base','G2',G2);
    
    G.RR12 = G2.RR;
    for i=1:size(G2.RR,1)
        for j=1:i-1
            G.RR12(i,j,:)=G1.RR(i,j,:);
        end
    end
    
    G.SynR12 = G2.SynR;
    for i=2:size(G1.SynR,1)
        G.SynR12(i,1:i-1,:)=G1.SynR(i,1:i-1,:);
    end
    G.PLVR12 = G2.PLVR;
    for i=2:size(G1.PLVR,1)
        G.PLVR12(i,1:i-1,:)=G1.PLVR(i,1:i-1,:);
    end
    %intranetwork
    G2.RNR
    G.RNR12 = zeros(size(G2.RNR,1),2);
    G.RNR12(:,2) =G2.RNR(:,1);
    G.RNR12(:,1) =G1.RNR(:,1);
    
    %internetwork
    G.RiNR12 = G2.RiNR;
    for i=1:size(G2.RiNR,1)
        for j=1:i-1
            G.RiNR12(i,j,:)=G1.RiNR(i,j,:);
        end
    end

    
end

function [R,P] = get_conn_R2d_B(app,R_2d, B)
    
    
    R = zeros(size(R_2d,1),size(B,2));
    P = ones(size(R_2d,1),size(B,2));
    
    for i=1:size(R_2d,1)
        for k=1:size(B,2)
            [R(i,k),P(i,k)]=corr(squeeze(R_2d(i,:))',squeeze(B(:,k)));
        end
    end
end

function [R,P] = get_conn_R_B(app,R_3d, B)
    
    R = zeros(size(R_3d,1),size(R_3d,2),size(B,2));
    P = ones(size(R_3d,1),size(R_3d,2),size(B,2));
    
    for i=1:size(R_3d,1)
        %for j=1:size(R_3d,2)
        for j=1:i-1
            for k=1:size(B,2)
                %size(R_3d)
                %size(B)
                [R(i,j,k),P(i,j,k)]=corr(squeeze(R_3d(i,j,:)),B(:,k));
                R(j,i,k) = R(i,j,k);
                P(j,i,k) = P(i,j,k);
            end
        end
    end
    
    
end

function [varnamelistsel,BG1,BG2] = get_selected_exel_data(app)

    varnamelistall = app.ExelvariablesListBox.Items;
    varnamelistsel = app.ExelvariablesListBox.Value;
    
    tmp = ismember( varnamelistall,varnamelistsel)==1;
    varidxlist = find(tmp);

    [row_g1] = get_rows_of_subjects(app,app.IDlist,app.namelist1);
    [row_g2] = get_rows_of_subjects(app,app.IDlist,app.namelist2);
    
    %ID_sel_list = handles.IDlist;
    BG1 = cell2mat(app.exeldata(row_g1,varidxlist));
    BG2 = cell2mat(app.exeldata(row_g2,varidxlist));


end

%         function test_for_g_1(app,R)
%             for i=1:size(R,1); for j=1:size(R,2); for k =1:size(R,3); if R(i,j,k)>1; fprintf(' %.0f  %.0f %.0f %.5f\n',i,j,k,R(i,j,k)); end; end; end; end;
%         end


function STAT = make_C2C_group_struct2(app,dir,namelist,postfix)
    % postfix definiert die Daten die rausgeschrieben werden Y Yc1, Yc2
    h=waitbar(0,'Please wait');
    
    % gibt es eine Netzwerkdefinition ?
    load(fullfile(app.resultsdirEditField.Value,'Cluster.mat'));
    if isfield(Cluster,'net')
        net =1;
    end
    
    load(fullfile(dir,namelist{1,1}));
    STAT.C2C.PCC.R=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    STAT.C2C.PCC.P=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    STAT.C2C.PCC.Z=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    STAT.C2C.SYN.R=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    %C2C.T=zeros(size(Cluster,1),1,size(Cluster,1),length(namelist));
    STAT.C2C.PLV.R=zeros(size(Cluster,1),size(Cluster,1),length(namelist));
    STAT.C2C.POW.R2d=zeros(size(Cluster,1),length(namelist));
    clusterXYZ = cell(0);
    for i=1:length(namelist)
        waitbar(i / length(namelist));
        fprintf('load Cluster %s \n',fullfile(dir,namelist{i}));
        load(fullfile(dir,namelist{i}));
        % die Clusternamen und Koordinaten werden aus einem
        % Cluster extrahiert (alle Cluster müssen natürlich gleich sein)
        %fprintf('%d\n',size(Cluster,1));
        %fprintf('loading %s\n',namelist{i});
        for j=1:size(Cluster,1)
            clusternames{j,1}=Cluster{j,1}.name;
            if isfield(Cluster{j,1},'XYZ')
                clusterXYZ{j,1}=Cluster{j,1}.XYZ;
            end
            %assignin('base','Cluster',Cluster);
            if ~isfield(Cluster{j,1},'Cluster2Cluster')
                error('please estimate C2C connectivity first (no Cluster2Cluster field in Cluster struct)');
                
            end
           
            if isfield(Cluster{j,1}.Cluster2Cluster,['R', postfix])
                STAT.C2C.PCC.R(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['R', postfix]);
                STAT.C2C.PCC.P(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['P', postfix]);
                STAT.C2C.PCC.Z(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['Z', postfix]);
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['T', postfix]))
                Tx = Cluster{j,1}.Cluster2Cluster.(['T', postfix]);
                STAT.C2C.TRA.T(:,1:size(Tx,1),j,i)=Tx';
            end
            % hier manchmal komplexe Zahlen ... evtl bei merkwuerdiegen Y_mean eingabe
            try
            if isfield(Cluster{j,1}.Cluster2Cluster,(['Coh', postfix]))
                Coh = Cluster{j,1}.Cluster2Cluster.(['Coh', postfix]);
                CohF = Cluster{j,1}.Cluster2Cluster.(['CohF', postfix]);
                STAT.C2C.COH.Coh(:,1:size(Coh,2),j,i)=Coh;
                STAT.C2C.COH.Cohf(:,1:size(Coh,2),j,i)=CohF;
            end
            catch
                fprintf('choerence konnte nicht berechnet werden warscheinlich Y_mean ungeeignet\n');
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['Syn', postfix]))
                STAT.C2C.SYN.R(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['Syn', postfix]);
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['PLV', postfix]))
                STAT.C2C.PLV.R(:,j,i)=Cluster{j,1}.Cluster2Cluster.(['PLV', postfix]);
            end
            if isfield(Cluster{j,1}.Cluster2Cluster,(['Comp', postfix]))
                STAT.C2C.COM.R(j,i)=Cluster{j,1}.Cluster2Cluster.(['Comp', postfix]);
            end
            Y_mean = Cluster{j,1}.(['Y', postfix, '_mean']);
            STAT.C2C.POW.Power(j,i)=sum(Y_mean.^2)/(length(Y_mean)*2+1);
            
            % Netzwerk einfuegen 
            % STAT.RiN
            % STAT.ZiN
            
        end
        
    end
    close(h)
    % die jeweilige Variable hat noch eine beschreibung mit dem Namen der Variablen + des
    STAT.C2C.PCC.des{1} = 'R ... Pearson correlation';
    STAT.C2C.COH.des{1} = 'Coh ... Coherence value';
    STAT.C2C.SYN.des{1} = 'Synchronicity value';
    STAT.C2C.PLV.des{1} = 'R ... PLV value';
    STAT.C2C.COM.des{1} = 'R ... Complexity value';
    STAT.C2C.POW.des{1} = 'Power ... Power value';
    STAT.C2C.TRA.des{1} = 'T ... Transinformation';
    STAT.C2C.clusternames=clusternames;
    STAT.C2C.clusterXYZ=clusterXYZ;
    STAT.namelist = namelist;
end

function C2C_stat_g1 = deslect_subjects_ck2(app,C2C_stat_g1,namelist,idx)
    %fprintf('deselect subjects\n');
    if length(idx)==0
        return;
    end
    %C2C_stat_g1.Z
    f = fields(C2C_stat_g1);
    for i=1:length(f)
        if isstruct(C2C_stat_g1.(f{i}))
            f2 = fields(C2C_stat_g1.(f{i}));
            for j = 1:length(f2)
                if isstruct(C2C_stat_g1.(f{i}).(f2{j}))
                    C2C_stat_g1.(f{i}).f2{j}=reduce(C2C_stat_g1.(f{i}).(f2{j}),idx);
                end
            end
        end
    end
    
end

function C = reduce(C,idx,num_subjects)
    f = fields(C);
    for i=1:length(f)
        t = size(C.(f{i}));
        dims = length(t);
        if isnumeric(C.(f{i})) && t(end)==num_subjects
            if dims== 1
                C.(f{i})(idx)=[];
            end
            if dims == 2
                C.(f{i})(:,idx)=[];
            end
            if dims == 3
                C.(f{i})(:,:,idx)=[];
            end
            if dims == 4
                C.(f{i})(:,:,:,idx)=[];
            end
        end
    end
            
            %     C2C_stat_g1.R(:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'P'); C2C_stat_g1.P(:,:,idx)=[];  end
            % if isfield(C2C_stat_g1,'Z'); C2C_stat_g1.Z(:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'Syn'); C2C_stat_g1.Syn(:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'PLV'); C2C_stat_g1.PLV(:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'T'); C2C_stat_g1.T(:,:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'Coh'); C2C_stat_g1.Coh(:,:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'CohF'); C2C_stat_g1.CohF(:,:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'Power'); C2C_stat_g1.Power(:,idx)=[]; end
            % if isfield(C2C_stat_g1,'Comp'); C2C_stat_g1.Comp(:,idx)=[]; end
            % if isfield(C2C_stat_g1,'RiN'); C2C_stat_g1.RiN(:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'RN'); C2C_stat_g1.RN(:,idx)=[]; end
            % if isfield(C2C_stat_g1,'ZiN'); C2C_stat_g1.ZiN(:,:,idx)=[]; end
            % if isfield(C2C_stat_g1,'ZN'); C2C_stat_g1.ZN(:,idx)=[]; end
            % if isfield(C2C_stat_g1,'namelist'); C2C_stat_g1.namelist = namelist; end
            
    


end