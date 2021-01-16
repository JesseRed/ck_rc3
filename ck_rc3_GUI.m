classdef ck_rc3_GUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ck_rc3_uiUIFigure               matlab.ui.Figure
        GridLayout                      matlab.ui.container.GridLayout
        TabGroup                        matlab.ui.container.TabGroup
        ClusterDefinitionTab            matlab.ui.container.Tab
        GridLayout5                     matlab.ui.container.GridLayout
        DefineClusterButton             matlab.ui.control.Button
        DefineNetworkButton             matlab.ui.control.Button
        deletenetworkdefinitionsfromClusterstructButton  matlab.ui.control.Button
        exemplarydatadirButton          matlab.ui.control.Button
        exemplarydatafileEditField      matlab.ui.control.EditField
        exemplarydatafileLabel          matlab.ui.control.Label
        DataimportTab                   matlab.ui.container.Tab
        GridLayout6                     matlab.ui.container.GridLayout
        GridLayout7                     matlab.ui.container.GridLayout
        updatedataimportButton          matlab.ui.control.Button
        DatasourceLabel                 matlab.ui.control.Label
        GridLayout10                    matlab.ui.container.GridLayout
        g1dirdataimportListBox          matlab.ui.control.ListBox
        g2dirdataimportListBox          matlab.ui.control.ListBox
        TrialGroup1Label                matlab.ui.control.Label
        TrialGroup2Label                matlab.ui.control.Label
        GridLayout56                    matlab.ui.container.GridLayout
        subdirnamegroup1Label           matlab.ui.control.Label
        dataimportsubdirnameEditField_1  matlab.ui.control.EditField
        GridLayout57                    matlab.ui.container.GridLayout
        subdirnamegroup2Label           matlab.ui.control.Label
        dataimportsubdirnameEditField_2  matlab.ui.control.EditField
        GridLayout55                    matlab.ui.container.GridLayout
        filefilterLabel                 matlab.ui.control.Label
        dataimportfilefilterEditField   matlab.ui.control.EditField
        GridLayout58                    matlab.ui.container.GridLayout
        g1dirdataimportEditField        matlab.ui.control.EditField
        g1dirdataimportButton           matlab.ui.control.Button
        GridLayout11                    matlab.ui.container.GridLayout
        GOButton                        matlab.ui.control.Button
        DatapropertiesPanel             matlab.ui.container.Panel
        GridLayout12                    matlab.ui.container.GridLayout
        TRinsecEditFieldLabel           matlab.ui.control.Label
        TREditField                     matlab.ui.control.NumericEditField
        lpfEditFieldLabel               matlab.ui.control.Label
        lpfEditField                    matlab.ui.control.NumericEditField
        hpfEditFieldLabel               matlab.ui.control.Label
        hpfEditField                    matlab.ui.control.NumericEditField
        Panel                           matlab.ui.container.Panel
        GridLayout13                    matlab.ui.container.GridLayout
        extractallvoxelinClusterCheckBox  matlab.ui.control.CheckBox
        Panel_2                         matlab.ui.container.Panel
        GridLayout14                    matlab.ui.container.GridLayout
        GridLayout15                    matlab.ui.container.GridLayout
        testforfilepresenceButton       matlab.ui.control.Button
        Lamp                            matlab.ui.control.Lamp
        graymatterfilenameEditFieldLabel  matlab.ui.control.Label
        graymatterfilenameEditField     matlab.ui.control.EditField
        whitematterfilenameEditFieldLabel  matlab.ui.control.Label
        whitematterfilenameEditField    matlab.ui.control.EditField
        csffilenameEditFieldLabel       matlab.ui.control.Label
        csffilenameEditField            matlab.ui.control.EditField
        GridLayout16                    matlab.ui.container.GridLayout
        GridLayout17                    matlab.ui.container.GridLayout
        extractconditionalvoxelCheckBox1  matlab.ui.control.CheckBox
        extractconditionalvoxelCheckBox2  matlab.ui.control.CheckBox
        GridLayout18                    matlab.ui.container.GridLayout
        graymatterprobgreaterasEditFieldLabel  matlab.ui.control.Label
        whitematterproblessthenEditFieldLabel  matlab.ui.control.Label
        CSFproblessthenEditFieldLabel   matlab.ui.control.Label
        graymatterprobgreaterasEditField  matlab.ui.control.NumericEditField
        whitematterproblessthenEditField  matlab.ui.control.NumericEditField
        CSFproblessthenEditField        matlab.ui.control.NumericEditField
        graymatterprobgreateras2EditField  matlab.ui.control.NumericEditField
        whitematterproblessthen2EditField  matlab.ui.control.NumericEditField
        CSFproblessthen2EditField       matlab.ui.control.NumericEditField
        OptionsforvoxelextractionLabel  matlab.ui.control.Label
        connectivityestimationTab       matlab.ui.container.Tab
        GridLayout27                    matlab.ui.container.GridLayout
        estimateconnectivityButton      matlab.ui.control.Button
        estimationoptionsPanel          matlab.ui.container.Panel
        GridLayout28                    matlab.ui.container.GridLayout
        GridLayout36                    matlab.ui.container.GridLayout
        usedataLabel                    matlab.ui.control.Label
        conuseYCheckBox                 matlab.ui.control.CheckBox
        conuseYc1CheckBox               matlab.ui.control.CheckBox
        conuseYc2CheckBox               matlab.ui.control.CheckBox
        GridLayout37                    matlab.ui.container.GridLayout
        Cluster2ClusterCheckBox         matlab.ui.control.CheckBox
        Voxel2VoxelCheckBox             matlab.ui.control.CheckBox
        Cluster2VoxelCheckBox           matlab.ui.control.CheckBox
        ClustermethodLabel              matlab.ui.control.Label
        GridLayout38                    matlab.ui.container.GridLayout
        GridLayout30                    matlab.ui.container.GridLayout
        C1maskthresholdCheckBox         matlab.ui.control.CheckBox
        smoothingCheckBox               matlab.ui.control.CheckBox
        thresholdEditFieldLabel         matlab.ui.control.Label
        thresholdEditField              matlab.ui.control.NumericEditField
        kernelEditFieldLabel            matlab.ui.control.Label
        kernelEditField                 matlab.ui.control.EditField
        Cluster2VoxeloptionsLabel       matlab.ui.control.Label
        GridLayout31                    matlab.ui.container.GridLayout
        readmecoherenceButton           matlab.ui.control.Button
        readmepartialcoherenceButton    matlab.ui.control.Button
        readmetransinformationButton    matlab.ui.control.Button
        readmesynchronizationButton     matlab.ui.control.Button
        readmecomplexityButton          matlab.ui.control.Button
        GridLayout32                    matlab.ui.container.GridLayout
        triallengthimagesLabel          matlab.ui.control.Label
        sb_gc_TRIAL_LENGTH              matlab.ui.control.NumericEditField
        GridLayout33                    matlab.ui.container.GridLayout
        similaritymeasureEditFieldLabel  matlab.ui.control.Label
        similaritymeasurecomplexityEditField  matlab.ui.control.NumericEditField
        windowlengthEditFieldLabel      matlab.ui.control.Label
        windowlengthcomplexityEditField  matlab.ui.control.NumericEditField
        GridLayout34                    matlab.ui.container.GridLayout
        histogramEditField_2Label       matlab.ui.control.Label
        histogramsynchronizationEditField  matlab.ui.control.NumericEditField
        GridLayout35                    matlab.ui.container.GridLayout
        timelagEditFieldLabel           matlab.ui.control.Label
        timelagEditField                matlab.ui.control.NumericEditField
        histogramEditFieldLabel         matlab.ui.control.Label
        histogramEditField              matlab.ui.control.NumericEditField
        GridLayout39                    matlab.ui.container.GridLayout
        selectedClusterListBoxLabel     matlab.ui.control.Label
        grangerselectedClusterListBox   matlab.ui.control.ListBox
        readmegrangerpreprocessingButton  matlab.ui.control.Button
        GridLayout40                    matlab.ui.container.GridLayout
        grangerdetrenddataCheckBox      matlab.ui.control.CheckBox
        grangerremovetemporalmeanCheckBox  matlab.ui.control.CheckBox
        grangerremovetemporalmeananddividebystdCheckBox  matlab.ui.control.CheckBox
        grangerdifferencingtimeseriesCheckBox  matlab.ui.control.CheckBox
        grangeriterationEditField       matlab.ui.control.NumericEditField
        iterationEditFieldLabel         matlab.ui.control.Label
        GridLayout41                    matlab.ui.container.GridLayout
        conditionalGCinthetimedomainCheckBox  matlab.ui.control.CheckBox
        GridLayout42                    matlab.ui.container.GridLayout
        estimategrangerautonomyCheckBox  matlab.ui.control.CheckBox
        GridLayout43                    matlab.ui.container.GridLayout
        numberoflagsEditFieldLabel      matlab.ui.control.Label
        grangernumberoflagsEditField    matlab.ui.control.NumericEditField
        pEditFieldLabel                 matlab.ui.control.Label
        grangerpEditField               matlab.ui.control.NumericEditField
        GridLayout44                    matlab.ui.container.GridLayout
        conditionalGCinfrequencydomainCheckBox  matlab.ui.control.CheckBox
        GridLayout45                    matlab.ui.container.GridLayout
        frequencyiterationstepEditFieldLabel  matlab.ui.control.Label
        grangerfrequencyiterationstepEditField  matlab.ui.control.NumericEditField
        frequencyEditFieldLabel         matlab.ui.control.Label
        grangerfrequencyEditField       matlab.ui.control.EditField
        readmegrangerpreprocessingButton_2  matlab.ui.control.Button
        correlationSwitch               matlab.ui.control.StateButton
        coherenceSwitch                 matlab.ui.control.StateButton
        partialcoherenceSwitch          matlab.ui.control.StateButton
        grangerSwitch                   matlab.ui.control.StateButton
        sb_gc_switch                    matlab.ui.control.StateButton
        complexitySwitch                matlab.ui.control.StateButton
        synchronizationSwitch           matlab.ui.control.StateButton
        transinformationSwitch          matlab.ui.control.StateButton
        DataexportTab                   matlab.ui.container.Tab
        GridLayout61                    matlab.ui.container.GridLayout
        ExportLabel                     matlab.ui.control.Label
        Label_3                         matlab.ui.control.Label
        ExportButton                    matlab.ui.control.Button
        GridLayout62                    matlab.ui.container.GridLayout
        OptionenLabel                   matlab.ui.control.Label
        GridLayout63                    matlab.ui.container.GridLayout
        export_group_as_rep_measure     matlab.ui.control.StateButton
        export_group_as_trial           matlab.ui.control.StateButton
        datareductionTab                matlab.ui.container.Tab
        GridLayout22                    matlab.ui.container.GridLayout
        reduceClusterdataButton         matlab.ui.control.Button
        GridLayout23                    matlab.ui.container.GridLayout
        ExplanationTextAreaLabel        matlab.ui.control.Label
        ExplanationTextArea             matlab.ui.control.TextArea
        deleteifpossiblePanel           matlab.ui.container.Panel
        GridLayout24                    matlab.ui.container.GridLayout
        GridLayout25                    matlab.ui.container.GridLayout
        YCheckBox                       matlab.ui.control.CheckBox
        Yc1CheckBox                     matlab.ui.control.CheckBox
        Yc2CheckBox                     matlab.ui.control.CheckBox
        GridLayout26                    matlab.ui.container.GridLayout
        newprefixforClustermatfilesLabel  matlab.ui.control.Label
        newprefixforClustermatfilesEditField  matlab.ui.control.EditField
        visualizationTab                matlab.ui.container.Tab
        GridLayout59                    matlab.ui.container.GridLayout
        GridLayout47                    matlab.ui.container.GridLayout
        GridLayout48                    matlab.ui.container.GridLayout
        C2CestimateClusterstatisticButton_2  matlab.ui.control.Button
        C2CestimateClusterstatisticButton  matlab.ui.control.Button
        C2CnormalizeCheckBox            matlab.ui.control.CheckBox
        C2CestimatedataLamp             matlab.ui.control.Lamp
        GridLayout49                    matlab.ui.container.GridLayout
        group1ListBoxLabel              matlab.ui.control.Label
        C2Cgroup1ListBox                matlab.ui.control.ListBox
        group2ListBoxLabel              matlab.ui.control.Label
        C2Cgroup2ListBox                matlab.ui.control.ListBox
        GridLayout50                    matlab.ui.container.GridLayout
        DatatouseLabel                  matlab.ui.control.Label
        C2CDatatouseButtonGroup         matlab.ui.container.ButtonGroup
        C2CYButton                      matlab.ui.control.RadioButton
        C2CYc1Button                    matlab.ui.control.RadioButton
        C2CYc2Button                    matlab.ui.control.RadioButton
        StatisticsLabel                 matlab.ui.control.Label
        C2CstatisticButtonGroup         matlab.ui.container.ButtonGroup
        C2CtwosampleButton              matlab.ui.control.ToggleButton
        C2CpairedButton                 matlab.ui.control.ToggleButton
        C2CloaddataLamp                 matlab.ui.control.Lamp
        GridLayout60                    matlab.ui.container.GridLayout
        C2CloaddataButton               matlab.ui.control.Button
        C2CloaddataButton_2             matlab.ui.control.Button
        GridLayout51                    matlab.ui.container.GridLayout
        C2CshownetworksButton           matlab.ui.control.Button
        BehaviorvsBrainconnectivitywithEXELdataPanel  matlab.ui.container.Panel
        GridLayout53                    matlab.ui.container.GridLayout
        loadexelfileButton              matlab.ui.control.Button
        C2CexelreadmeButton             matlab.ui.control.Button
        ExelvariablesListBoxLabel       matlab.ui.control.Label
        ExelvariablesListBox            matlab.ui.control.ListBox
        C2CestimatenetworkcorrelationButton  matlab.ui.control.Button
        C2CestimatecorrelationButton    matlab.ui.control.Button
        visualizecorrelationButton      matlab.ui.control.Button
        C2CvisualizenetworkcorrelationButton  matlab.ui.control.Button
        C2CestimateexelcorrelationLamp  matlab.ui.control.Lamp
        GridLayout54                    matlab.ui.container.GridLayout
        C2CchooseexelfileButton         matlab.ui.control.Button
        xlscsvFileEditFieldLabel        matlab.ui.control.Label
        xlscsvFileEditField             matlab.ui.control.EditField
        BrainconnectivityPanel          matlab.ui.container.Panel
        GridLayout52                    matlab.ui.container.GridLayout
        C2CmeanZdiffButton              matlab.ui.control.Button
        C2CBCsigdiffButton              matlab.ui.control.Button
        GridLayout2                     matlab.ui.container.GridLayout
        GridLayout3                     matlab.ui.container.GridLayout
        updateButton                    matlab.ui.control.Button
        GridLayout4                     matlab.ui.container.GridLayout
        trialgroup1Label                matlab.ui.control.Label
        g1ListBox                       matlab.ui.control.ListBox
        g2ListBox                       matlab.ui.control.ListBox
        trialgroup2Label                matlab.ui.control.Label
        OutputDirectoryimportedClusterdatawillbestoredhereLabel  matlab.ui.control.Label
        GridLayout19                    matlab.ui.container.GridLayout
        GridLayout20                    matlab.ui.container.GridLayout
        initnewButton                   matlab.ui.control.Button
        loadButton                      matlab.ui.control.Button
        saveButton                      matlab.ui.control.Button
        GridLayout21                    matlab.ui.container.GridLayout
        resultsrootdirEditFieldLabel    matlab.ui.control.Label
        group1dirEditFieldLabel         matlab.ui.control.Label
        group2dirEditFieldLabel         matlab.ui.control.Label
        g1dirEditField                  matlab.ui.control.EditField
        g2dirEditField                  matlab.ui.control.EditField
        GridLayout64                    matlab.ui.container.GridLayout
        resultsdirEditField             matlab.ui.control.EditField
        Buttonchooseresultsdir          matlab.ui.control.Button
        Label_2                         matlab.ui.control.Label
    end


    properties (Access = private)


    end
    
    properties (Access = public)
        IDlist % Liste mit den IDs der Subjects
        exeltitel % Description
        exeldata
        C2C_stat_g1 % Description
        C2C_stat_g1_org
        C2C_stat_g2 % Description
        C2C_stat_g2_org
        C2C_stat_g1_des
        C2C_stat_g2_des
        Property8 % Description
        C2C_stat % Description
        namelist1
        namelist2% Description
    end

    methods (Access = private)
        
        function toggleColorBtn(app, btn) % Description
           if btn.Value
                btn.BackgroundColor = 'green';
            else
                btn.BackgroundColor = [0.96,0.96,0.96];
            end
        
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function
        function Buttonchooseg1dirPushed(app, event)
            ck_rc3('chooseg1dir', app);
        end

        % Button pushed function: Buttonchooseresultsdir
        function ButtonchooseresultsdirPushed(app, event)
            ck_rc3('chooserootdir', app);
        end

        % Button pushed function: C2CBCsigdiffButton
        function C2CBCsigdiffButtonPushed(app, event)
            %             figure('Name',' significant differences ','NumberTitle','off');
            %             imagesc(app.C2C_stat.Zh);
            %             %ck_rc2_adjust_C2C_figure(handles.C2C_stat_g1.clusternames);
        end

        % Button pushed function: C2CchooseexelfileButton
        function C2CchooseexelfileButtonPushed(app, event)
            [f,p]=uigetfile('*.*');
            app.xlscsvFileEditField.Value = fullfile(p,f);
        end

        % Button pushed function: C2CestimateClusterstatisticButton
        function C2CestimateClusterstatisticButtonPushed(app, event)
            ck_rc3('C2CestimateClusterstatistic', app);
        end

        % Button pushed function: 
        % C2CestimateClusterstatisticButton_2
        function C2CestimateClusterstatisticButton_2Pushed(app, event)
            ck_rc3('C2CestimateClusterstatistic2', app);
        end

        % Button pushed function: C2CestimatecorrelationButton
        function C2CestimatecorrelationButtonPushed(app, event)
           ck_rc3('C2Cestimatecorrelation', app);
        end

        % Button pushed function: 
        % C2CestimatenetworkcorrelationButton
        function C2CestimatenetworkcorrelationButtonPushed(app, event)
            ck_rc3('C2Cestimatenetworkcorrelation', app);
            
        end

        % Button pushed function: C2CexelreadmeButton
        function C2CexelreadmeButtonPushed(app, event)
            ck_rc3('C2Cexelreadme', app);
        end

        % Button pushed function: C2CloaddataButton
        function C2CloaddataButtonPushed(app, event)
            ck_rc3('C2Cloaddata', app);
            
        end

        % Button pushed function: C2CloaddataButton_2
        function C2CloaddataButton_2Pushed(app, event)
            ck_rc3('C2Cloaddata', app);
            
        end

        % Button pushed function: C2CmeanZdiffButton
        function C2CmeanZdiffButtonPushed(app, event)
            ck_rc3('C2CmeanZdiff', app);
            
        end

        % Button pushed function: C2CshownetworksButton
        function C2CshownetworksButtonPushed(app, event)
            ck_rc3('C2Cshownetworks', app);
        end

        % Button pushed function: 
        % C2CvisualizenetworkcorrelationButton
        function C2CvisualizenetworkcorrelationButtonPushed(app, event)
            ck_rc3('C2Cvisualizenetworkcorrelation', app);
            
        end

        % Button pushed function: DefineClusterButton
        function DefineClusterButtonPushed(app, event)
            ck_rc3('DefineCluster', app);
        end

        % Button pushed function: DefineNetworkButton
        function DefineNetworkButtonPushed(app, event)
            ck_rc3('DefineNetwork', app);
        end

        % Button pushed function: GOButton
        function GOButtonPushed(app, event)
            ck_rc3('GOButton', app);
            
        end

        % Callback function
        function chooseg2dirButtonPushed(app, event)
            ck_rc3('chooseg2dir', app);
        end

        % Callback function
        function coherenceSwitchValueChanged(app, event)
            value = str2num(app.coherenceSwitch.Value);
            if value
                app.coherenceLabel.BackgroundColor = 'green';
            else
                app.coherenceLabel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Callback function
        function complexitySwitchValueChanged(app, event)
            value = str2num(app.complexitySwitch.Value);
            if value
                app.complexityLabel.BackgroundColor = 'green';
            else
                app.complexityLabel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Callback function
        function correlationSwitchValueChanged(app, event)
            value = str2num(app.correlationSwitch.Value);
            if value
                app.correlationsLabel.BackgroundColor = 'green';
            else
                app.correlationsLabel.BackgroundColor = [0.94 0.94 0.94];
            end            
            
        end

        % Button pushed function: 
        % deletenetworkdefinitionsfromClusterstructButton
        function deletenetworkdefinitionsfromClusterstructButtonPushed(app, event)
            ck_rc3('deletenetworkdefinitionsfromClusterstruct', app);
        end

        % Button pushed function: estimateconnectivityButton
        function estimateconnectivityButtonPushed(app, event)
            ck_rc3('estimateconnectivity', app);
            
        end

        % Button pushed function: exemplarydatadirButton
        function exemplarydatadirButtonPushed(app, event)
            [f,p] = uigetfile({'*.nii','*.img'},'Select nifti image file');
            if isempty(p) | p == 0, return; end
            app.exemplarydatafileEditField.Value = fullfile(p,f);
        end

        % Button pushed function: g1dirdataimportButton
        function g1dirdataimportButtonPushed(app, event)
            p = uigetdir('Select root dir for data of group 2');
            if isempty(p) | p == 0, return; end
            app.g1dirdataimportEditField.Value = p; 
        end

        % Callback function
        function g2dirdataimportButtonPushed(app, event)
            p = uigetdir('Select root dir for data of group 2');
            if isempty(p) | p == 0, return; end
            app.g2dirdataimportEditField.Value = p; 
        end

        % Callback function
        function grangerSwitchValueChanged(app, event)
            value = str2num(app.grangerSwitch.Value);
            if value
                app.Label_4.BackgroundColor = 'green';
                try
                    load(fullfile(app.resultsdirEditField.Value,'Cluster.mat'));
                    for i=1:length(Cluster)
                        list{i} = Cluster{i}.name;
                    end
                    app.grangerselectedClusterListBox.Items = list;
                catch
                    msgbox('Cluster struct is needed');
                end
            else
                app.Label_4.BackgroundColor = [0.94 0.94 0.94];
            end            
        end

        % Button pushed function: initnewButton
        function initnewButtonPushed(app, event)
            ck_rc3('initnew', app);
                
            
        end

        % Callback function
        function loadButtonPushed(app, event)
            ck_rc3('loadButton', app);
        end

        % Button pushed function: loadexelfileButton
        function loadexelfileButtonPushed(app, event)
            ck_rc3('loadexelfile', app);
%            
        end

        % Callback function
        function loadlastButtonPushed(app, event)
            %ie: ck_rc3('loadlastButton', app);
        end

        % Callback function
        function partialcoherenceSwitchValueChanged(app, event)
            value = str2num(app.partialcoherenceSwitch.Value);
            if value
                app.Label_4.BackgroundColor = 'green';
            else
                app.Label_4.BackgroundColor = [0.94 0.94 0.94];
            end
            
        end

        % Button pushed function: reduceClusterdataButton
        function reduceClusterdataButtonPushed(app, event)
            ck_rc3('reduceClusterdata', app);
            
            
        end

        % Callback function
        function saveButtonPushed(app, event)
            ck_rc3('saveButton', app);
            
            
        end

        % Callback function
        function synchronizationSwitchValueChanged(app, event)
            value = str2num(app.synchronizationSwitch.Value);
            if value
                app.synchronityLabel.BackgroundColor = 'green';
            else
                app.synchronityLabel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Button pushed function: testforfilepresenceButton
        function testforfilepresenceButtonPushed(app, event)
            ck_rc3('testforfilepresence', app);
        end

        % Callback function
        function transinformationSwitchValueChanged(app, event)
            value = str2num(app.transinformationSwitch.Value);
            
            if value
                app.transinformationLabel.BackgroundColor = 'green';
            else
                app.transinformationLabel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Button pushed function: updateButton
        function updateButtonPushed(app, event)
            ck_rc3('update', app);
        end

        % Button pushed function: updatedataimportButton
        function updatedataimportButtonPushed(app, event)
            ck_rc3('updatedataimport', app);
        end

        % Button pushed function: visualizecorrelationButton
        function visualizecorrelationButtonPushed(app, event)
           ck_rc3('visualizecorrelation', app);
            
        end

        % Button pushed function: loadButton
        function loadButtonPushed2(app, event)
            ck_rc3('load_new', app);
        end

        % Button pushed function: saveButton
        function saveButtonPushed2(app, event)
            ck_rc3('save_new', app);
        end

        % Callback function
        function sb_gc_switchValueChanged(app, event)
            value = str2num(app.sb_gc_switch.Value);
            if value
                app.complexityLabel.BackgroundColor = 'green';
            else
                app.complexityLabel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Value changed function: export_group_as_rep_measure
        function export_group_as_rep_measureValueChanged(app, event)
            value = app.export_group_as_rep_measure.Value;
            if value
                app.export_group_as_trial.Value = false;
            else
                
            end
        end

        % Value changed function: export_group_as_trial
        function export_group_as_trialValueChanged(app, event)
            value = app.export_group_as_trial.Value;
            if value
                app.export_group_as_rep_measure.Value = false;
            else
                
            end
        end

        % Button pushed function: ExportButton
        function ExportButtonPushed(app, event)
            ck_rc3('export_results', app);
        end

        % Value changed function: correlationSwitch
        function correlationSwitchValueChanged2(app, event)
            app.toggleColorBtn(app.correlationSwitch);
        end

        % Value changed function: coherenceSwitch
        function coherenceSwitchValueChanged2(app, event)
            app.toggleColorBtn(app.coherenceSwitch);
        end

        % Value changed function: transinformationSwitch
        function transinformationSwitchValueChanged2(app, event)
            app.toggleColorBtn(app.transinformationSwitch);
        end

        % Value changed function: synchronizationSwitch
        function synchronizationSwitchValueChanged2(app, event)
            app.toggleColorBtn(app.synchronizationSwitch);
        end

        % Value changed function: complexitySwitch
        function complexitySwitchValueChanged2(app, event)
            app.toggleColorBtn(app.complexitySwitch);
        end

        % Value changed function: sb_gc_switch
        function sb_gc_switchValueChanged2(app, event)
            app.toggleColorBtn(app.sb_gc_switch);
        end

        % Value changed function: grangerSwitch
        function grangerSwitchValueChanged2(app, event)
            app.toggleColorBtn(app.grangerSwitch);
        end

        % Value changed function: partialcoherenceSwitch
        function partialcoherenceSwitchValueChanged2(app, event)
            app.toggleColorBtn(app.partialcoherenceSwitch);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ck_rc3_uiUIFigure and hide until all components are created
            app.ck_rc3_uiUIFigure = uifigure('Visible', 'off');
            app.ck_rc3_uiUIFigure.Position = [100 100 1027 769];
            app.ck_rc3_uiUIFigure.Name = 'ck_rc3_ui';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.ck_rc3_uiUIFigure);
            app.GridLayout.ColumnWidth = {'1x', '2x'};
            app.GridLayout.RowHeight = {'1x'};

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout);
            app.TabGroup.Layout.Row = 1;
            app.TabGroup.Layout.Column = 2;

            % Create ClusterDefinitionTab
            app.ClusterDefinitionTab = uitab(app.TabGroup);
            app.ClusterDefinitionTab.Title = 'Cluster Definition';

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.ClusterDefinitionTab);
            app.GridLayout5.ColumnWidth = {'1x', '5x', '1x'};
            app.GridLayout5.RowHeight = {'1x', '1x', '1x', '1x', '10x'};

            % Create DefineClusterButton
            app.DefineClusterButton = uibutton(app.GridLayout5, 'push');
            app.DefineClusterButton.ButtonPushedFcn = createCallbackFcn(app, @DefineClusterButtonPushed, true);
            app.DefineClusterButton.Layout.Row = 2;
            app.DefineClusterButton.Layout.Column = 2;
            app.DefineClusterButton.Text = 'Define Cluster';

            % Create DefineNetworkButton
            app.DefineNetworkButton = uibutton(app.GridLayout5, 'push');
            app.DefineNetworkButton.ButtonPushedFcn = createCallbackFcn(app, @DefineNetworkButtonPushed, true);
            app.DefineNetworkButton.Enable = 'off';
            app.DefineNetworkButton.Layout.Row = 3;
            app.DefineNetworkButton.Layout.Column = 2;
            app.DefineNetworkButton.Text = 'Define Network';

            % Create deletenetworkdefinitionsfromClusterstructButton
            app.deletenetworkdefinitionsfromClusterstructButton = uibutton(app.GridLayout5, 'push');
            app.deletenetworkdefinitionsfromClusterstructButton.ButtonPushedFcn = createCallbackFcn(app, @deletenetworkdefinitionsfromClusterstructButtonPushed, true);
            app.deletenetworkdefinitionsfromClusterstructButton.Enable = 'off';
            app.deletenetworkdefinitionsfromClusterstructButton.Layout.Row = 4;
            app.deletenetworkdefinitionsfromClusterstructButton.Layout.Column = 2;
            app.deletenetworkdefinitionsfromClusterstructButton.Text = 'delete network definitions from Cluster struct';

            % Create exemplarydatadirButton
            app.exemplarydatadirButton = uibutton(app.GridLayout5, 'push');
            app.exemplarydatadirButton.ButtonPushedFcn = createCallbackFcn(app, @exemplarydatadirButtonPushed, true);
            app.exemplarydatadirButton.Layout.Row = 1;
            app.exemplarydatadirButton.Layout.Column = 3;
            app.exemplarydatadirButton.Text = '...';

            % Create exemplarydatafileEditField
            app.exemplarydatafileEditField = uieditfield(app.GridLayout5, 'text');
            app.exemplarydatafileEditField.Editable = 'off';
            app.exemplarydatafileEditField.HorizontalAlignment = 'center';
            app.exemplarydatafileEditField.FontSize = 10;
            app.exemplarydatafileEditField.Layout.Row = 1;
            app.exemplarydatafileEditField.Layout.Column = 2;
            app.exemplarydatafileEditField.Value = 'bitte ein nifti-file als template auswaehlen';

            % Create exemplarydatafileLabel
            app.exemplarydatafileLabel = uilabel(app.GridLayout5);
            app.exemplarydatafileLabel.HorizontalAlignment = 'center';
            app.exemplarydatafileLabel.Layout.Row = 1;
            app.exemplarydatafileLabel.Layout.Column = 1;
            app.exemplarydatafileLabel.Text = 'exemplary data file';

            % Create DataimportTab
            app.DataimportTab = uitab(app.TabGroup);
            app.DataimportTab.Title = 'Data import';

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.DataimportTab);
            app.GridLayout6.RowHeight = {'1x'};

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.GridLayout6);
            app.GridLayout7.ColumnWidth = {'1x'};
            app.GridLayout7.RowHeight = {'1x', '1x', '8x', '1x', '1x'};
            app.GridLayout7.Padding = [0 0 0 0];
            app.GridLayout7.Layout.Row = 1;
            app.GridLayout7.Layout.Column = 1;

            % Create updatedataimportButton
            app.updatedataimportButton = uibutton(app.GridLayout7, 'push');
            app.updatedataimportButton.ButtonPushedFcn = createCallbackFcn(app, @updatedataimportButtonPushed, true);
            app.updatedataimportButton.Layout.Row = 5;
            app.updatedataimportButton.Layout.Column = 1;
            app.updatedataimportButton.Text = 'update';

            % Create DatasourceLabel
            app.DatasourceLabel = uilabel(app.GridLayout7);
            app.DatasourceLabel.HorizontalAlignment = 'center';
            app.DatasourceLabel.FontWeight = 'bold';
            app.DatasourceLabel.Layout.Row = 1;
            app.DatasourceLabel.Layout.Column = 1;
            app.DatasourceLabel.Text = 'Data source';

            % Create GridLayout10
            app.GridLayout10 = uigridlayout(app.GridLayout7);
            app.GridLayout10.RowHeight = {'1x', '8x', '1x'};
            app.GridLayout10.ColumnSpacing = 3;
            app.GridLayout10.Padding = [0 0 0 0];
            app.GridLayout10.Layout.Row = 3;
            app.GridLayout10.Layout.Column = 1;

            % Create g1dirdataimportListBox
            app.g1dirdataimportListBox = uilistbox(app.GridLayout10);
            app.g1dirdataimportListBox.Items = {};
            app.g1dirdataimportListBox.Multiselect = 'on';
            app.g1dirdataimportListBox.Layout.Row = 2;
            app.g1dirdataimportListBox.Layout.Column = 1;
            app.g1dirdataimportListBox.Value = {};

            % Create g2dirdataimportListBox
            app.g2dirdataimportListBox = uilistbox(app.GridLayout10);
            app.g2dirdataimportListBox.Items = {};
            app.g2dirdataimportListBox.Multiselect = 'on';
            app.g2dirdataimportListBox.Layout.Row = 2;
            app.g2dirdataimportListBox.Layout.Column = 2;
            app.g2dirdataimportListBox.Value = {};

            % Create TrialGroup1Label
            app.TrialGroup1Label = uilabel(app.GridLayout10);
            app.TrialGroup1Label.HorizontalAlignment = 'center';
            app.TrialGroup1Label.Layout.Row = 1;
            app.TrialGroup1Label.Layout.Column = 1;
            app.TrialGroup1Label.Text = 'Trial / Group 1';

            % Create TrialGroup2Label
            app.TrialGroup2Label = uilabel(app.GridLayout10);
            app.TrialGroup2Label.HorizontalAlignment = 'center';
            app.TrialGroup2Label.Layout.Row = 1;
            app.TrialGroup2Label.Layout.Column = 2;
            app.TrialGroup2Label.Text = 'Trial / Group 2';

            % Create GridLayout56
            app.GridLayout56 = uigridlayout(app.GridLayout10);
            app.GridLayout56.RowHeight = {'1x'};
            app.GridLayout56.ColumnSpacing = 1;
            app.GridLayout56.Padding = [1 1 1 1];
            app.GridLayout56.Layout.Row = 3;
            app.GridLayout56.Layout.Column = 1;

            % Create subdirnamegroup1Label
            app.subdirnamegroup1Label = uilabel(app.GridLayout56);
            app.subdirnamegroup1Label.HorizontalAlignment = 'center';
            app.subdirnamegroup1Label.Layout.Row = 1;
            app.subdirnamegroup1Label.Layout.Column = 1;
            app.subdirnamegroup1Label.Text = {'subdir name'; '(group 1)'};

            % Create dataimportsubdirnameEditField_1
            app.dataimportsubdirnameEditField_1 = uieditfield(app.GridLayout56, 'text');
            app.dataimportsubdirnameEditField_1.HorizontalAlignment = 'center';
            app.dataimportsubdirnameEditField_1.Layout.Row = 1;
            app.dataimportsubdirnameEditField_1.Layout.Column = 2;
            app.dataimportsubdirnameEditField_1.Value = 'filter_rs6';

            % Create GridLayout57
            app.GridLayout57 = uigridlayout(app.GridLayout10);
            app.GridLayout57.RowHeight = {'1x'};
            app.GridLayout57.ColumnSpacing = 2;
            app.GridLayout57.Padding = [1 1 1 1];
            app.GridLayout57.Layout.Row = 3;
            app.GridLayout57.Layout.Column = 2;

            % Create subdirnamegroup2Label
            app.subdirnamegroup2Label = uilabel(app.GridLayout57);
            app.subdirnamegroup2Label.HorizontalAlignment = 'center';
            app.subdirnamegroup2Label.Layout.Row = 1;
            app.subdirnamegroup2Label.Layout.Column = 1;
            app.subdirnamegroup2Label.Text = {'subdir name'; '(group 2)'};

            % Create dataimportsubdirnameEditField_2
            app.dataimportsubdirnameEditField_2 = uieditfield(app.GridLayout57, 'text');
            app.dataimportsubdirnameEditField_2.HorizontalAlignment = 'center';
            app.dataimportsubdirnameEditField_2.Layout.Row = 1;
            app.dataimportsubdirnameEditField_2.Layout.Column = 2;
            app.dataimportsubdirnameEditField_2.Value = 'filter_rs6';

            % Create GridLayout55
            app.GridLayout55 = uigridlayout(app.GridLayout7);
            app.GridLayout55.RowHeight = {'1x'};
            app.GridLayout55.Layout.Row = 4;
            app.GridLayout55.Layout.Column = 1;

            % Create filefilterLabel
            app.filefilterLabel = uilabel(app.GridLayout55);
            app.filefilterLabel.HorizontalAlignment = 'center';
            app.filefilterLabel.Layout.Row = 1;
            app.filefilterLabel.Layout.Column = 1;
            app.filefilterLabel.Text = 'filefilter';

            % Create dataimportfilefilterEditField
            app.dataimportfilefilterEditField = uieditfield(app.GridLayout55, 'text');
            app.dataimportfilefilterEditField.HorizontalAlignment = 'center';
            app.dataimportfilefilterEditField.Layout.Row = 1;
            app.dataimportfilefilterEditField.Layout.Column = 2;
            app.dataimportfilefilterEditField.Value = 'ff*.nii';

            % Create GridLayout58
            app.GridLayout58 = uigridlayout(app.GridLayout7);
            app.GridLayout58.ColumnWidth = {'8x', '1x'};
            app.GridLayout58.RowHeight = {'1x'};
            app.GridLayout58.ColumnSpacing = 2;
            app.GridLayout58.Padding = [1 1 1 1];
            app.GridLayout58.Layout.Row = 2;
            app.GridLayout58.Layout.Column = 1;

            % Create g1dirdataimportEditField
            app.g1dirdataimportEditField = uieditfield(app.GridLayout58, 'text');
            app.g1dirdataimportEditField.Editable = 'off';
            app.g1dirdataimportEditField.FontSize = 10;
            app.g1dirdataimportEditField.Layout.Row = 1;
            app.g1dirdataimportEditField.Layout.Column = 1;
            app.g1dirdataimportEditField.Value = 'bitte den Ordner mit den gefilterten Datenauswaehlen';

            % Create g1dirdataimportButton
            app.g1dirdataimportButton = uibutton(app.GridLayout58, 'push');
            app.g1dirdataimportButton.ButtonPushedFcn = createCallbackFcn(app, @g1dirdataimportButtonPushed, true);
            app.g1dirdataimportButton.Layout.Row = 1;
            app.g1dirdataimportButton.Layout.Column = 2;
            app.g1dirdataimportButton.Text = '...';

            % Create GridLayout11
            app.GridLayout11 = uigridlayout(app.GridLayout6);
            app.GridLayout11.ColumnWidth = {'1x'};
            app.GridLayout11.RowHeight = {'0.2x', '0.5x', '5x', '1x', '0.3x'};
            app.GridLayout11.Layout.Row = 1;
            app.GridLayout11.Layout.Column = 2;

            % Create GOButton
            app.GOButton = uibutton(app.GridLayout11, 'push');
            app.GOButton.ButtonPushedFcn = createCallbackFcn(app, @GOButtonPushed, true);
            app.GOButton.Layout.Row = 5;
            app.GOButton.Layout.Column = 1;
            app.GOButton.Text = 'GO!';

            % Create DatapropertiesPanel
            app.DatapropertiesPanel = uipanel(app.GridLayout11);
            app.DatapropertiesPanel.Title = 'Data properties';
            app.DatapropertiesPanel.Layout.Row = 4;
            app.DatapropertiesPanel.Layout.Column = 1;

            % Create GridLayout12
            app.GridLayout12 = uigridlayout(app.DatapropertiesPanel);
            app.GridLayout12.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout12.RowSpacing = 3;
            app.GridLayout12.Padding = [1 1 1 1];

            % Create TRinsecEditFieldLabel
            app.TRinsecEditFieldLabel = uilabel(app.GridLayout12);
            app.TRinsecEditFieldLabel.HorizontalAlignment = 'center';
            app.TRinsecEditFieldLabel.Layout.Row = 1;
            app.TRinsecEditFieldLabel.Layout.Column = 1;
            app.TRinsecEditFieldLabel.Text = 'TR in sec';

            % Create TREditField
            app.TREditField = uieditfield(app.GridLayout12, 'numeric');
            app.TREditField.HorizontalAlignment = 'center';
            app.TREditField.Layout.Row = 1;
            app.TREditField.Layout.Column = 2;
            app.TREditField.Value = 1.9;

            % Create lpfEditFieldLabel
            app.lpfEditFieldLabel = uilabel(app.GridLayout12);
            app.lpfEditFieldLabel.HorizontalAlignment = 'center';
            app.lpfEditFieldLabel.Layout.Row = 2;
            app.lpfEditFieldLabel.Layout.Column = 1;
            app.lpfEditFieldLabel.Text = 'lpf';

            % Create lpfEditField
            app.lpfEditField = uieditfield(app.GridLayout12, 'numeric');
            app.lpfEditField.HorizontalAlignment = 'center';
            app.lpfEditField.Layout.Row = 2;
            app.lpfEditField.Layout.Column = 2;
            app.lpfEditField.Value = 0.1;

            % Create hpfEditFieldLabel
            app.hpfEditFieldLabel = uilabel(app.GridLayout12);
            app.hpfEditFieldLabel.HorizontalAlignment = 'center';
            app.hpfEditFieldLabel.Layout.Row = 3;
            app.hpfEditFieldLabel.Layout.Column = 1;
            app.hpfEditFieldLabel.Text = 'hpf';

            % Create hpfEditField
            app.hpfEditField = uieditfield(app.GridLayout12, 'numeric');
            app.hpfEditField.HorizontalAlignment = 'center';
            app.hpfEditField.Layout.Row = 3;
            app.hpfEditField.Layout.Column = 2;
            app.hpfEditField.Value = 0.01;

            % Create Panel
            app.Panel = uipanel(app.GridLayout11);
            app.Panel.Title = 'unconditional cluster extraction (all voxel given by the Clusterdefinition)';
            app.Panel.Layout.Row = 2;
            app.Panel.Layout.Column = 1;

            % Create GridLayout13
            app.GridLayout13 = uigridlayout(app.Panel);
            app.GridLayout13.ColumnWidth = {'1x'};
            app.GridLayout13.RowHeight = {'1x'};
            app.GridLayout13.Padding = [0 0 0 0];

            % Create extractallvoxelinClusterCheckBox
            app.extractallvoxelinClusterCheckBox = uicheckbox(app.GridLayout13);
            app.extractallvoxelinClusterCheckBox.Text = 'extract all voxel in Cluster saved as Cluster{i}.Y';
            app.extractallvoxelinClusterCheckBox.FontSize = 10;
            app.extractallvoxelinClusterCheckBox.Layout.Row = 1;
            app.extractallvoxelinClusterCheckBox.Layout.Column = 1;
            app.extractallvoxelinClusterCheckBox.Value = true;

            % Create Panel_2
            app.Panel_2 = uipanel(app.GridLayout11);
            app.Panel_2.Title = 'conditional cluster extraction (only voxel were extractat which meet the following individ. criteria)';
            app.Panel_2.Layout.Row = 3;
            app.Panel_2.Layout.Column = 1;
            app.Panel_2.FontSize = 9;

            % Create GridLayout14
            app.GridLayout14 = uigridlayout(app.Panel_2);
            app.GridLayout14.ColumnWidth = {'1x'};
            app.GridLayout14.Padding = [1 1 1 1];

            % Create GridLayout15
            app.GridLayout15 = uigridlayout(app.GridLayout14);
            app.GridLayout15.RowHeight = {'1x', '1x', '1x', '1x'};
            app.GridLayout15.Layout.Row = 2;
            app.GridLayout15.Layout.Column = 1;

            % Create testforfilepresenceButton
            app.testforfilepresenceButton = uibutton(app.GridLayout15, 'push');
            app.testforfilepresenceButton.ButtonPushedFcn = createCallbackFcn(app, @testforfilepresenceButtonPushed, true);
            app.testforfilepresenceButton.Layout.Row = 4;
            app.testforfilepresenceButton.Layout.Column = 2;
            app.testforfilepresenceButton.Text = 'test for file presence';

            % Create Lamp
            app.Lamp = uilamp(app.GridLayout15);
            app.Lamp.Layout.Row = 4;
            app.Lamp.Layout.Column = 1;
            app.Lamp.Color = [1 0 0];

            % Create graymatterfilenameEditFieldLabel
            app.graymatterfilenameEditFieldLabel = uilabel(app.GridLayout15);
            app.graymatterfilenameEditFieldLabel.HorizontalAlignment = 'center';
            app.graymatterfilenameEditFieldLabel.Layout.Row = 1;
            app.graymatterfilenameEditFieldLabel.Layout.Column = 1;
            app.graymatterfilenameEditFieldLabel.Text = 'gray matter file name';

            % Create graymatterfilenameEditField
            app.graymatterfilenameEditField = uieditfield(app.GridLayout15, 'text');
            app.graymatterfilenameEditField.HorizontalAlignment = 'center';
            app.graymatterfilenameEditField.Layout.Row = 1;
            app.graymatterfilenameEditField.Layout.Column = 2;
            app.graymatterfilenameEditField.Value = 'rw1s0.nii';

            % Create whitematterfilenameEditFieldLabel
            app.whitematterfilenameEditFieldLabel = uilabel(app.GridLayout15);
            app.whitematterfilenameEditFieldLabel.HorizontalAlignment = 'center';
            app.whitematterfilenameEditFieldLabel.Layout.Row = 2;
            app.whitematterfilenameEditFieldLabel.Layout.Column = 1;
            app.whitematterfilenameEditFieldLabel.Text = 'white matter file name';

            % Create whitematterfilenameEditField
            app.whitematterfilenameEditField = uieditfield(app.GridLayout15, 'text');
            app.whitematterfilenameEditField.HorizontalAlignment = 'center';
            app.whitematterfilenameEditField.Layout.Row = 2;
            app.whitematterfilenameEditField.Layout.Column = 2;
            app.whitematterfilenameEditField.Value = 'rw2s0.nii';

            % Create csffilenameEditFieldLabel
            app.csffilenameEditFieldLabel = uilabel(app.GridLayout15);
            app.csffilenameEditFieldLabel.HorizontalAlignment = 'center';
            app.csffilenameEditFieldLabel.Layout.Row = 3;
            app.csffilenameEditFieldLabel.Layout.Column = 1;
            app.csffilenameEditFieldLabel.Text = 'csf file name';

            % Create csffilenameEditField
            app.csffilenameEditField = uieditfield(app.GridLayout15, 'text');
            app.csffilenameEditField.HorizontalAlignment = 'center';
            app.csffilenameEditField.Layout.Row = 3;
            app.csffilenameEditField.Layout.Column = 2;
            app.csffilenameEditField.Value = 'rw3s0.nii';

            % Create GridLayout16
            app.GridLayout16 = uigridlayout(app.GridLayout14);
            app.GridLayout16.ColumnWidth = {'1x'};
            app.GridLayout16.RowHeight = {'1x', '3x'};
            app.GridLayout16.Padding = [0 0 0 0];
            app.GridLayout16.Layout.Row = 1;
            app.GridLayout16.Layout.Column = 1;

            % Create GridLayout17
            app.GridLayout17 = uigridlayout(app.GridLayout16);
            app.GridLayout17.RowHeight = {'1x'};
            app.GridLayout17.ColumnSpacing = 1;
            app.GridLayout17.Padding = [0 0 0 0];
            app.GridLayout17.Layout.Row = 1;
            app.GridLayout17.Layout.Column = 1;

            % Create extractconditionalvoxelCheckBox1
            app.extractconditionalvoxelCheckBox1 = uicheckbox(app.GridLayout17);
            app.extractconditionalvoxelCheckBox1.Text = {'extract conditional voxel'; 'saved as Cluster{i}.Yc1'};
            app.extractconditionalvoxelCheckBox1.FontSize = 10;
            app.extractconditionalvoxelCheckBox1.Layout.Row = 1;
            app.extractconditionalvoxelCheckBox1.Layout.Column = 1;
            app.extractconditionalvoxelCheckBox1.Value = true;

            % Create extractconditionalvoxelCheckBox2
            app.extractconditionalvoxelCheckBox2 = uicheckbox(app.GridLayout17);
            app.extractconditionalvoxelCheckBox2.Text = {'extract 2. conditional voxel'; 'saved as Clusster{i}.Yc2'};
            app.extractconditionalvoxelCheckBox2.FontSize = 10;
            app.extractconditionalvoxelCheckBox2.Layout.Row = 1;
            app.extractconditionalvoxelCheckBox2.Layout.Column = 2;
            app.extractconditionalvoxelCheckBox2.Value = true;

            % Create GridLayout18
            app.GridLayout18 = uigridlayout(app.GridLayout16);
            app.GridLayout18.ColumnWidth = {'1x', '2x', '1x'};
            app.GridLayout18.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout18.Padding = [1 1 1 1];
            app.GridLayout18.Layout.Row = 2;
            app.GridLayout18.Layout.Column = 1;

            % Create graymatterprobgreaterasEditFieldLabel
            app.graymatterprobgreaterasEditFieldLabel = uilabel(app.GridLayout18);
            app.graymatterprobgreaterasEditFieldLabel.HorizontalAlignment = 'center';
            app.graymatterprobgreaterasEditFieldLabel.FontSize = 9;
            app.graymatterprobgreaterasEditFieldLabel.Layout.Row = 1;
            app.graymatterprobgreaterasEditFieldLabel.Layout.Column = 2;
            app.graymatterprobgreaterasEditFieldLabel.Text = 'gray matter prob. greater as';

            % Create whitematterproblessthenEditFieldLabel
            app.whitematterproblessthenEditFieldLabel = uilabel(app.GridLayout18);
            app.whitematterproblessthenEditFieldLabel.HorizontalAlignment = 'center';
            app.whitematterproblessthenEditFieldLabel.FontSize = 9;
            app.whitematterproblessthenEditFieldLabel.Layout.Row = 2;
            app.whitematterproblessthenEditFieldLabel.Layout.Column = 2;
            app.whitematterproblessthenEditFieldLabel.Text = 'white matter prob. less then';

            % Create CSFproblessthenEditFieldLabel
            app.CSFproblessthenEditFieldLabel = uilabel(app.GridLayout18);
            app.CSFproblessthenEditFieldLabel.HorizontalAlignment = 'center';
            app.CSFproblessthenEditFieldLabel.FontSize = 9;
            app.CSFproblessthenEditFieldLabel.Layout.Row = 3;
            app.CSFproblessthenEditFieldLabel.Layout.Column = 2;
            app.CSFproblessthenEditFieldLabel.Text = 'CSF prob. less then';

            % Create graymatterprobgreaterasEditField
            app.graymatterprobgreaterasEditField = uieditfield(app.GridLayout18, 'numeric');
            app.graymatterprobgreaterasEditField.HorizontalAlignment = 'center';
            app.graymatterprobgreaterasEditField.Layout.Row = 1;
            app.graymatterprobgreaterasEditField.Layout.Column = 1;
            app.graymatterprobgreaterasEditField.Value = 0.1;

            % Create whitematterproblessthenEditField
            app.whitematterproblessthenEditField = uieditfield(app.GridLayout18, 'numeric');
            app.whitematterproblessthenEditField.HorizontalAlignment = 'center';
            app.whitematterproblessthenEditField.Layout.Row = 2;
            app.whitematterproblessthenEditField.Layout.Column = 1;
            app.whitematterproblessthenEditField.Value = 0.9;

            % Create CSFproblessthenEditField
            app.CSFproblessthenEditField = uieditfield(app.GridLayout18, 'numeric');
            app.CSFproblessthenEditField.HorizontalAlignment = 'center';
            app.CSFproblessthenEditField.Layout.Row = 3;
            app.CSFproblessthenEditField.Layout.Column = 1;
            app.CSFproblessthenEditField.Value = 0.9;

            % Create graymatterprobgreateras2EditField
            app.graymatterprobgreateras2EditField = uieditfield(app.GridLayout18, 'numeric');
            app.graymatterprobgreateras2EditField.HorizontalAlignment = 'center';
            app.graymatterprobgreateras2EditField.Layout.Row = 1;
            app.graymatterprobgreateras2EditField.Layout.Column = 3;
            app.graymatterprobgreateras2EditField.Value = 0.4;

            % Create whitematterproblessthen2EditField
            app.whitematterproblessthen2EditField = uieditfield(app.GridLayout18, 'numeric');
            app.whitematterproblessthen2EditField.HorizontalAlignment = 'center';
            app.whitematterproblessthen2EditField.Layout.Row = 2;
            app.whitematterproblessthen2EditField.Layout.Column = 3;
            app.whitematterproblessthen2EditField.Value = 0.2;

            % Create CSFproblessthen2EditField
            app.CSFproblessthen2EditField = uieditfield(app.GridLayout18, 'numeric');
            app.CSFproblessthen2EditField.HorizontalAlignment = 'center';
            app.CSFproblessthen2EditField.Layout.Row = 3;
            app.CSFproblessthen2EditField.Layout.Column = 3;
            app.CSFproblessthen2EditField.Value = 0.2;

            % Create OptionsforvoxelextractionLabel
            app.OptionsforvoxelextractionLabel = uilabel(app.GridLayout11);
            app.OptionsforvoxelextractionLabel.HorizontalAlignment = 'center';
            app.OptionsforvoxelextractionLabel.Layout.Row = 1;
            app.OptionsforvoxelextractionLabel.Layout.Column = 1;
            app.OptionsforvoxelextractionLabel.Text = 'Options for voxel extraction';

            % Create connectivityestimationTab
            app.connectivityestimationTab = uitab(app.TabGroup);
            app.connectivityestimationTab.Title = 'connectivity estimation';

            % Create GridLayout27
            app.GridLayout27 = uigridlayout(app.connectivityestimationTab);
            app.GridLayout27.ColumnWidth = {'1x'};
            app.GridLayout27.RowHeight = {'2.5x', '10x', '1x'};

            % Create estimateconnectivityButton
            app.estimateconnectivityButton = uibutton(app.GridLayout27, 'push');
            app.estimateconnectivityButton.ButtonPushedFcn = createCallbackFcn(app, @estimateconnectivityButtonPushed, true);
            app.estimateconnectivityButton.Layout.Row = 3;
            app.estimateconnectivityButton.Layout.Column = 1;
            app.estimateconnectivityButton.Text = 'estimate connectivity';

            % Create estimationoptionsPanel
            app.estimationoptionsPanel = uipanel(app.GridLayout27);
            app.estimationoptionsPanel.Title = 'estimation options';
            app.estimationoptionsPanel.Layout.Row = 1;
            app.estimationoptionsPanel.Layout.Column = 1;

            % Create GridLayout28
            app.GridLayout28 = uigridlayout(app.estimationoptionsPanel);
            app.GridLayout28.ColumnWidth = {'1x', '1x', '2x'};
            app.GridLayout28.RowHeight = {'1x'};
            app.GridLayout28.ColumnSpacing = 3;
            app.GridLayout28.RowSpacing = 3;
            app.GridLayout28.Padding = [1 1 1 1];

            % Create GridLayout36
            app.GridLayout36 = uigridlayout(app.GridLayout28);
            app.GridLayout36.ColumnWidth = {'1x'};
            app.GridLayout36.RowHeight = {'0.5x', '1x', '1x', '1x'};
            app.GridLayout36.RowSpacing = 2;
            app.GridLayout36.Padding = [2 2 2 2];
            app.GridLayout36.Layout.Row = 1;
            app.GridLayout36.Layout.Column = 1;

            % Create usedataLabel
            app.usedataLabel = uilabel(app.GridLayout36);
            app.usedataLabel.HorizontalAlignment = 'center';
            app.usedataLabel.Layout.Row = 1;
            app.usedataLabel.Layout.Column = 1;
            app.usedataLabel.Text = 'use data';

            % Create conuseYCheckBox
            app.conuseYCheckBox = uicheckbox(app.GridLayout36);
            app.conuseYCheckBox.Text = 'Y';
            app.conuseYCheckBox.Layout.Row = 2;
            app.conuseYCheckBox.Layout.Column = 1;
            app.conuseYCheckBox.Value = true;

            % Create conuseYc1CheckBox
            app.conuseYc1CheckBox = uicheckbox(app.GridLayout36);
            app.conuseYc1CheckBox.Text = 'Yc1';
            app.conuseYc1CheckBox.Layout.Row = 3;
            app.conuseYc1CheckBox.Layout.Column = 1;
            app.conuseYc1CheckBox.Value = true;

            % Create conuseYc2CheckBox
            app.conuseYc2CheckBox = uicheckbox(app.GridLayout36);
            app.conuseYc2CheckBox.Text = 'Yc2';
            app.conuseYc2CheckBox.Layout.Row = 4;
            app.conuseYc2CheckBox.Layout.Column = 1;
            app.conuseYc2CheckBox.Value = true;

            % Create GridLayout37
            app.GridLayout37 = uigridlayout(app.GridLayout28);
            app.GridLayout37.ColumnWidth = {'1x'};
            app.GridLayout37.RowHeight = {'0.5x', '1x', '1x', '1x'};
            app.GridLayout37.RowSpacing = 2;
            app.GridLayout37.Padding = [2 2 2 2];
            app.GridLayout37.Layout.Row = 1;
            app.GridLayout37.Layout.Column = 2;

            % Create Cluster2ClusterCheckBox
            app.Cluster2ClusterCheckBox = uicheckbox(app.GridLayout37);
            app.Cluster2ClusterCheckBox.Text = 'Cluster2Cluster';
            app.Cluster2ClusterCheckBox.Layout.Row = 2;
            app.Cluster2ClusterCheckBox.Layout.Column = 1;
            app.Cluster2ClusterCheckBox.Value = true;

            % Create Voxel2VoxelCheckBox
            app.Voxel2VoxelCheckBox = uicheckbox(app.GridLayout37);
            app.Voxel2VoxelCheckBox.Enable = 'off';
            app.Voxel2VoxelCheckBox.Text = 'Voxel2Voxel';
            app.Voxel2VoxelCheckBox.Layout.Row = 3;
            app.Voxel2VoxelCheckBox.Layout.Column = 1;

            % Create Cluster2VoxelCheckBox
            app.Cluster2VoxelCheckBox = uicheckbox(app.GridLayout37);
            app.Cluster2VoxelCheckBox.Enable = 'off';
            app.Cluster2VoxelCheckBox.Text = 'Cluster2Voxel';
            app.Cluster2VoxelCheckBox.Layout.Row = 4;
            app.Cluster2VoxelCheckBox.Layout.Column = 1;

            % Create ClustermethodLabel
            app.ClustermethodLabel = uilabel(app.GridLayout37);
            app.ClustermethodLabel.HorizontalAlignment = 'center';
            app.ClustermethodLabel.Layout.Row = 1;
            app.ClustermethodLabel.Layout.Column = 1;
            app.ClustermethodLabel.Text = 'Cluster method';

            % Create GridLayout38
            app.GridLayout38 = uigridlayout(app.GridLayout28);
            app.GridLayout38.ColumnWidth = {'1x'};
            app.GridLayout38.RowHeight = {'0.2x', '1x'};
            app.GridLayout38.Padding = [1 1 1 1];
            app.GridLayout38.Layout.Row = 1;
            app.GridLayout38.Layout.Column = 3;

            % Create GridLayout30
            app.GridLayout30 = uigridlayout(app.GridLayout38);
            app.GridLayout30.ColumnWidth = {'3x', '1x', '1x'};
            app.GridLayout30.RowSpacing = 2;
            app.GridLayout30.Padding = [2 2 2 2];
            app.GridLayout30.Layout.Row = 2;
            app.GridLayout30.Layout.Column = 1;

            % Create C1maskthresholdCheckBox
            app.C1maskthresholdCheckBox = uicheckbox(app.GridLayout30);
            app.C1maskthresholdCheckBox.Enable = 'off';
            app.C1maskthresholdCheckBox.Text = 'C1 mask threshold';
            app.C1maskthresholdCheckBox.Layout.Row = 1;
            app.C1maskthresholdCheckBox.Layout.Column = 1;

            % Create smoothingCheckBox
            app.smoothingCheckBox = uicheckbox(app.GridLayout30);
            app.smoothingCheckBox.Enable = 'off';
            app.smoothingCheckBox.Text = 'smoothing';
            app.smoothingCheckBox.Layout.Row = 2;
            app.smoothingCheckBox.Layout.Column = 1;

            % Create thresholdEditFieldLabel
            app.thresholdEditFieldLabel = uilabel(app.GridLayout30);
            app.thresholdEditFieldLabel.HorizontalAlignment = 'center';
            app.thresholdEditFieldLabel.Layout.Row = 1;
            app.thresholdEditFieldLabel.Layout.Column = 2;
            app.thresholdEditFieldLabel.Text = 'threshold';

            % Create thresholdEditField
            app.thresholdEditField = uieditfield(app.GridLayout30, 'numeric');
            app.thresholdEditField.HorizontalAlignment = 'center';
            app.thresholdEditField.Enable = 'off';
            app.thresholdEditField.Layout.Row = 1;
            app.thresholdEditField.Layout.Column = 3;
            app.thresholdEditField.Value = 0.1;

            % Create kernelEditFieldLabel
            app.kernelEditFieldLabel = uilabel(app.GridLayout30);
            app.kernelEditFieldLabel.HorizontalAlignment = 'center';
            app.kernelEditFieldLabel.Layout.Row = 2;
            app.kernelEditFieldLabel.Layout.Column = 2;
            app.kernelEditFieldLabel.Text = 'kernel';

            % Create kernelEditField
            app.kernelEditField = uieditfield(app.GridLayout30, 'text');
            app.kernelEditField.HorizontalAlignment = 'center';
            app.kernelEditField.Enable = 'off';
            app.kernelEditField.Layout.Row = 2;
            app.kernelEditField.Layout.Column = 3;
            app.kernelEditField.Value = '[6 6 6]';

            % Create Cluster2VoxeloptionsLabel
            app.Cluster2VoxeloptionsLabel = uilabel(app.GridLayout38);
            app.Cluster2VoxeloptionsLabel.HorizontalAlignment = 'center';
            app.Cluster2VoxeloptionsLabel.Layout.Row = 1;
            app.Cluster2VoxeloptionsLabel.Layout.Column = 1;
            app.Cluster2VoxeloptionsLabel.Text = 'Cluster2Voxel options';

            % Create GridLayout31
            app.GridLayout31 = uigridlayout(app.GridLayout27);
            app.GridLayout31.ColumnWidth = {'3x', '6x', '1x'};
            app.GridLayout31.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '3x'};
            app.GridLayout31.RowSpacing = 1;
            app.GridLayout31.Padding = [1 1 1 1];
            app.GridLayout31.Layout.Row = 2;
            app.GridLayout31.Layout.Column = 1;

            % Create readmecoherenceButton
            app.readmecoherenceButton = uibutton(app.GridLayout31, 'push');
            app.readmecoherenceButton.Layout.Row = 2;
            app.readmecoherenceButton.Layout.Column = 3;
            app.readmecoherenceButton.Text = 'readme';

            % Create readmepartialcoherenceButton
            app.readmepartialcoherenceButton = uibutton(app.GridLayout31, 'push');
            app.readmepartialcoherenceButton.Layout.Row = 3;
            app.readmepartialcoherenceButton.Layout.Column = 3;
            app.readmepartialcoherenceButton.Text = 'readme';

            % Create readmetransinformationButton
            app.readmetransinformationButton = uibutton(app.GridLayout31, 'push');
            app.readmetransinformationButton.Layout.Row = 4;
            app.readmetransinformationButton.Layout.Column = 3;
            app.readmetransinformationButton.Text = 'readme';

            % Create readmesynchronizationButton
            app.readmesynchronizationButton = uibutton(app.GridLayout31, 'push');
            app.readmesynchronizationButton.Layout.Row = 5;
            app.readmesynchronizationButton.Layout.Column = 3;
            app.readmesynchronizationButton.Text = 'readme';

            % Create readmecomplexityButton
            app.readmecomplexityButton = uibutton(app.GridLayout31, 'push');
            app.readmecomplexityButton.Layout.Row = 6;
            app.readmecomplexityButton.Layout.Column = 3;
            app.readmecomplexityButton.Text = 'readme';

            % Create GridLayout32
            app.GridLayout32 = uigridlayout(app.GridLayout31);
            app.GridLayout32.RowHeight = {'1x'};
            app.GridLayout32.Layout.Row = 7;
            app.GridLayout32.Layout.Column = 2;

            % Create triallengthimagesLabel
            app.triallengthimagesLabel = uilabel(app.GridLayout32);
            app.triallengthimagesLabel.HorizontalAlignment = 'center';
            app.triallengthimagesLabel.Layout.Row = 1;
            app.triallengthimagesLabel.Layout.Column = 1;
            app.triallengthimagesLabel.Text = 'trial length(images)';

            % Create sb_gc_TRIAL_LENGTH
            app.sb_gc_TRIAL_LENGTH = uieditfield(app.GridLayout32, 'numeric');
            app.sb_gc_TRIAL_LENGTH.Limits = [1 1000];
            app.sb_gc_TRIAL_LENGTH.HorizontalAlignment = 'center';
            app.sb_gc_TRIAL_LENGTH.Layout.Row = 1;
            app.sb_gc_TRIAL_LENGTH.Layout.Column = 2;
            app.sb_gc_TRIAL_LENGTH.Value = 60;

            % Create GridLayout33
            app.GridLayout33 = uigridlayout(app.GridLayout31);
            app.GridLayout33.RowSpacing = 0;
            app.GridLayout33.Padding = [2 2 10 2];
            app.GridLayout33.Layout.Row = 6;
            app.GridLayout33.Layout.Column = 2;

            % Create similaritymeasureEditFieldLabel
            app.similaritymeasureEditFieldLabel = uilabel(app.GridLayout33);
            app.similaritymeasureEditFieldLabel.HorizontalAlignment = 'center';
            app.similaritymeasureEditFieldLabel.Layout.Row = 2;
            app.similaritymeasureEditFieldLabel.Layout.Column = 1;
            app.similaritymeasureEditFieldLabel.Text = 'similarity measure';

            % Create similaritymeasurecomplexityEditField
            app.similaritymeasurecomplexityEditField = uieditfield(app.GridLayout33, 'numeric');
            app.similaritymeasurecomplexityEditField.HorizontalAlignment = 'center';
            app.similaritymeasurecomplexityEditField.Layout.Row = 2;
            app.similaritymeasurecomplexityEditField.Layout.Column = 2;
            app.similaritymeasurecomplexityEditField.Value = 0.15;

            % Create windowlengthEditFieldLabel
            app.windowlengthEditFieldLabel = uilabel(app.GridLayout33);
            app.windowlengthEditFieldLabel.HorizontalAlignment = 'center';
            app.windowlengthEditFieldLabel.Layout.Row = 1;
            app.windowlengthEditFieldLabel.Layout.Column = 1;
            app.windowlengthEditFieldLabel.Text = 'window length';

            % Create windowlengthcomplexityEditField
            app.windowlengthcomplexityEditField = uieditfield(app.GridLayout33, 'numeric');
            app.windowlengthcomplexityEditField.HorizontalAlignment = 'center';
            app.windowlengthcomplexityEditField.Layout.Row = 1;
            app.windowlengthcomplexityEditField.Layout.Column = 2;
            app.windowlengthcomplexityEditField.Value = 5;

            % Create GridLayout34
            app.GridLayout34 = uigridlayout(app.GridLayout31);
            app.GridLayout34.RowHeight = {'1x'};
            app.GridLayout34.Layout.Row = 5;
            app.GridLayout34.Layout.Column = 2;

            % Create histogramEditField_2Label
            app.histogramEditField_2Label = uilabel(app.GridLayout34);
            app.histogramEditField_2Label.HorizontalAlignment = 'center';
            app.histogramEditField_2Label.Layout.Row = 1;
            app.histogramEditField_2Label.Layout.Column = 1;
            app.histogramEditField_2Label.Text = 'histogram';

            % Create histogramsynchronizationEditField
            app.histogramsynchronizationEditField = uieditfield(app.GridLayout34, 'numeric');
            app.histogramsynchronizationEditField.HorizontalAlignment = 'center';
            app.histogramsynchronizationEditField.Layout.Row = 1;
            app.histogramsynchronizationEditField.Layout.Column = 2;
            app.histogramsynchronizationEditField.Value = 4;

            % Create GridLayout35
            app.GridLayout35 = uigridlayout(app.GridLayout31);
            app.GridLayout35.RowSpacing = 0;
            app.GridLayout35.Padding = [2 2 10 2];
            app.GridLayout35.Layout.Row = 4;
            app.GridLayout35.Layout.Column = 2;

            % Create timelagEditFieldLabel
            app.timelagEditFieldLabel = uilabel(app.GridLayout35);
            app.timelagEditFieldLabel.HorizontalAlignment = 'center';
            app.timelagEditFieldLabel.Layout.Row = 1;
            app.timelagEditFieldLabel.Layout.Column = 1;
            app.timelagEditFieldLabel.Text = 'time lag';

            % Create timelagEditField
            app.timelagEditField = uieditfield(app.GridLayout35, 'numeric');
            app.timelagEditField.HorizontalAlignment = 'center';
            app.timelagEditField.Layout.Row = 1;
            app.timelagEditField.Layout.Column = 2;
            app.timelagEditField.Value = 5;

            % Create histogramEditFieldLabel
            app.histogramEditFieldLabel = uilabel(app.GridLayout35);
            app.histogramEditFieldLabel.HorizontalAlignment = 'center';
            app.histogramEditFieldLabel.Layout.Row = 2;
            app.histogramEditFieldLabel.Layout.Column = 1;
            app.histogramEditFieldLabel.Text = 'histogram';

            % Create histogramEditField
            app.histogramEditField = uieditfield(app.GridLayout35, 'numeric');
            app.histogramEditField.HorizontalAlignment = 'center';
            app.histogramEditField.Layout.Row = 2;
            app.histogramEditField.Layout.Column = 2;
            app.histogramEditField.Value = 4;

            % Create GridLayout39
            app.GridLayout39 = uigridlayout(app.GridLayout31);
            app.GridLayout39.ColumnWidth = {'1x'};
            app.GridLayout39.RowHeight = {'1x', '10x'};
            app.GridLayout39.RowSpacing = 2;
            app.GridLayout39.Padding = [2 2 2 2];
            app.GridLayout39.Layout.Row = 9;
            app.GridLayout39.Layout.Column = 1;

            % Create selectedClusterListBoxLabel
            app.selectedClusterListBoxLabel = uilabel(app.GridLayout39);
            app.selectedClusterListBoxLabel.HorizontalAlignment = 'center';
            app.selectedClusterListBoxLabel.FontSize = 9;
            app.selectedClusterListBoxLabel.Layout.Row = 1;
            app.selectedClusterListBoxLabel.Layout.Column = 1;
            app.selectedClusterListBoxLabel.Text = 'selected Cluster';

            % Create grangerselectedClusterListBox
            app.grangerselectedClusterListBox = uilistbox(app.GridLayout39);
            app.grangerselectedClusterListBox.Items = {};
            app.grangerselectedClusterListBox.Enable = 'off';
            app.grangerselectedClusterListBox.Layout.Row = 2;
            app.grangerselectedClusterListBox.Layout.Column = 1;
            app.grangerselectedClusterListBox.Value = {};

            % Create readmegrangerpreprocessingButton
            app.readmegrangerpreprocessingButton = uibutton(app.GridLayout31, 'push');
            app.readmegrangerpreprocessingButton.Layout.Row = 8;
            app.readmegrangerpreprocessingButton.Layout.Column = 3;
            app.readmegrangerpreprocessingButton.Text = 'readme';

            % Create GridLayout40
            app.GridLayout40 = uigridlayout(app.GridLayout31);
            app.GridLayout40.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout40.RowSpacing = 1;
            app.GridLayout40.Padding = [0 0 0 0];
            app.GridLayout40.Layout.Row = 8;
            app.GridLayout40.Layout.Column = 2;

            % Create grangerdetrenddataCheckBox
            app.grangerdetrenddataCheckBox = uicheckbox(app.GridLayout40);
            app.grangerdetrenddataCheckBox.Enable = 'off';
            app.grangerdetrenddataCheckBox.Text = 'detrend data';
            app.grangerdetrenddataCheckBox.FontSize = 10;
            app.grangerdetrenddataCheckBox.Layout.Row = 1;
            app.grangerdetrenddataCheckBox.Layout.Column = 1;

            % Create grangerremovetemporalmeanCheckBox
            app.grangerremovetemporalmeanCheckBox = uicheckbox(app.GridLayout40);
            app.grangerremovetemporalmeanCheckBox.Text = 'remove temporal mean';
            app.grangerremovetemporalmeanCheckBox.FontSize = 10;
            app.grangerremovetemporalmeanCheckBox.Layout.Row = 1;
            app.grangerremovetemporalmeanCheckBox.Layout.Column = 2;

            % Create grangerremovetemporalmeananddividebystdCheckBox
            app.grangerremovetemporalmeananddividebystdCheckBox = uicheckbox(app.GridLayout40);
            app.grangerremovetemporalmeananddividebystdCheckBox.Enable = 'off';
            app.grangerremovetemporalmeananddividebystdCheckBox.Text = 'remove temporal mean and divide by std';
            app.grangerremovetemporalmeananddividebystdCheckBox.FontSize = 10;
            app.grangerremovetemporalmeananddividebystdCheckBox.Layout.Row = 2;
            app.grangerremovetemporalmeananddividebystdCheckBox.Layout.Column = 1;

            % Create grangerdifferencingtimeseriesCheckBox
            app.grangerdifferencingtimeseriesCheckBox = uicheckbox(app.GridLayout40);
            app.grangerdifferencingtimeseriesCheckBox.Text = 'differencing time series';
            app.grangerdifferencingtimeseriesCheckBox.FontSize = 10;
            app.grangerdifferencingtimeseriesCheckBox.Layout.Row = 2;
            app.grangerdifferencingtimeseriesCheckBox.Layout.Column = 2;

            % Create grangeriterationEditField
            app.grangeriterationEditField = uieditfield(app.GridLayout40, 'numeric');
            app.grangeriterationEditField.HorizontalAlignment = 'center';
            app.grangeriterationEditField.Layout.Row = 3;
            app.grangeriterationEditField.Layout.Column = 2;
            app.grangeriterationEditField.Value = 1;

            % Create iterationEditFieldLabel
            app.iterationEditFieldLabel = uilabel(app.GridLayout40);
            app.iterationEditFieldLabel.HorizontalAlignment = 'right';
            app.iterationEditFieldLabel.VerticalAlignment = 'top';
            app.iterationEditFieldLabel.FontSize = 10;
            app.iterationEditFieldLabel.Layout.Row = 3;
            app.iterationEditFieldLabel.Layout.Column = 1;
            app.iterationEditFieldLabel.Text = 'iteration';

            % Create GridLayout41
            app.GridLayout41 = uigridlayout(app.GridLayout31);
            app.GridLayout41.ColumnWidth = {'1x'};
            app.GridLayout41.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout41.RowSpacing = 1;
            app.GridLayout41.Padding = [2 2 2 2];
            app.GridLayout41.Layout.Row = 9;
            app.GridLayout41.Layout.Column = 2;

            % Create conditionalGCinthetimedomainCheckBox
            app.conditionalGCinthetimedomainCheckBox = uicheckbox(app.GridLayout41);
            app.conditionalGCinthetimedomainCheckBox.Enable = 'off';
            app.conditionalGCinthetimedomainCheckBox.Text = 'conditional GC in the time domain';
            app.conditionalGCinthetimedomainCheckBox.Layout.Row = 1;
            app.conditionalGCinthetimedomainCheckBox.Layout.Column = 1;

            % Create GridLayout42
            app.GridLayout42 = uigridlayout(app.GridLayout41);
            app.GridLayout42.RowHeight = {'1x'};
            app.GridLayout42.Padding = [0 0 0 0];
            app.GridLayout42.Layout.Row = 2;
            app.GridLayout42.Layout.Column = 1;

            % Create estimategrangerautonomyCheckBox
            app.estimategrangerautonomyCheckBox = uicheckbox(app.GridLayout42);
            app.estimategrangerautonomyCheckBox.Enable = 'off';
            app.estimategrangerautonomyCheckBox.Text = 'estimate granger autonomy';
            app.estimategrangerautonomyCheckBox.Layout.Row = 1;
            app.estimategrangerautonomyCheckBox.Layout.Column = 1;

            % Create GridLayout43
            app.GridLayout43 = uigridlayout(app.GridLayout42);
            app.GridLayout43.ColumnSpacing = 2;
            app.GridLayout43.RowSpacing = 1;
            app.GridLayout43.Padding = [1 1 1 1];
            app.GridLayout43.Layout.Row = 1;
            app.GridLayout43.Layout.Column = 2;

            % Create numberoflagsEditFieldLabel
            app.numberoflagsEditFieldLabel = uilabel(app.GridLayout43);
            app.numberoflagsEditFieldLabel.HorizontalAlignment = 'center';
            app.numberoflagsEditFieldLabel.FontSize = 10;
            app.numberoflagsEditFieldLabel.Layout.Row = 1;
            app.numberoflagsEditFieldLabel.Layout.Column = 1;
            app.numberoflagsEditFieldLabel.Text = 'number of lags';

            % Create grangernumberoflagsEditField
            app.grangernumberoflagsEditField = uieditfield(app.GridLayout43, 'numeric');
            app.grangernumberoflagsEditField.HorizontalAlignment = 'center';
            app.grangernumberoflagsEditField.Enable = 'off';
            app.grangernumberoflagsEditField.Layout.Row = 1;
            app.grangernumberoflagsEditField.Layout.Column = 2;
            app.grangernumberoflagsEditField.Value = 1;

            % Create pEditFieldLabel
            app.pEditFieldLabel = uilabel(app.GridLayout43);
            app.pEditFieldLabel.HorizontalAlignment = 'center';
            app.pEditFieldLabel.FontSize = 10;
            app.pEditFieldLabel.Layout.Row = 2;
            app.pEditFieldLabel.Layout.Column = 1;
            app.pEditFieldLabel.Text = 'p =';

            % Create grangerpEditField
            app.grangerpEditField = uieditfield(app.GridLayout43, 'numeric');
            app.grangerpEditField.HorizontalAlignment = 'center';
            app.grangerpEditField.Enable = 'off';
            app.grangerpEditField.Layout.Row = 2;
            app.grangerpEditField.Layout.Column = 2;
            app.grangerpEditField.Value = 0.05;

            % Create GridLayout44
            app.GridLayout44 = uigridlayout(app.GridLayout41);
            app.GridLayout44.RowHeight = {'1x'};
            app.GridLayout44.Padding = [0 0 0 0];
            app.GridLayout44.Layout.Row = 3;
            app.GridLayout44.Layout.Column = 1;

            % Create conditionalGCinfrequencydomainCheckBox
            app.conditionalGCinfrequencydomainCheckBox = uicheckbox(app.GridLayout44);
            app.conditionalGCinfrequencydomainCheckBox.Enable = 'off';
            app.conditionalGCinfrequencydomainCheckBox.Text = {'conditional GC in '; 'frequency domain'};
            app.conditionalGCinfrequencydomainCheckBox.Layout.Row = 1;
            app.conditionalGCinfrequencydomainCheckBox.Layout.Column = 1;

            % Create GridLayout45
            app.GridLayout45 = uigridlayout(app.GridLayout44);
            app.GridLayout45.ColumnSpacing = 2;
            app.GridLayout45.RowSpacing = 1;
            app.GridLayout45.Padding = [1 1 1 1];
            app.GridLayout45.Layout.Row = 1;
            app.GridLayout45.Layout.Column = 2;

            % Create frequencyiterationstepEditFieldLabel
            app.frequencyiterationstepEditFieldLabel = uilabel(app.GridLayout45);
            app.frequencyiterationstepEditFieldLabel.VerticalAlignment = 'top';
            app.frequencyiterationstepEditFieldLabel.FontSize = 10;
            app.frequencyiterationstepEditFieldLabel.Layout.Row = 1;
            app.frequencyiterationstepEditFieldLabel.Layout.Column = 1;
            app.frequencyiterationstepEditFieldLabel.Text = {'frequency iteration '; 'step'};

            % Create grangerfrequencyiterationstepEditField
            app.grangerfrequencyiterationstepEditField = uieditfield(app.GridLayout45, 'numeric');
            app.grangerfrequencyiterationstepEditField.HorizontalAlignment = 'center';
            app.grangerfrequencyiterationstepEditField.Enable = 'off';
            app.grangerfrequencyiterationstepEditField.Layout.Row = 1;
            app.grangerfrequencyiterationstepEditField.Layout.Column = 2;
            app.grangerfrequencyiterationstepEditField.Value = 0.01;

            % Create frequencyEditFieldLabel
            app.frequencyEditFieldLabel = uilabel(app.GridLayout45);
            app.frequencyEditFieldLabel.HorizontalAlignment = 'center';
            app.frequencyEditFieldLabel.FontSize = 10;
            app.frequencyEditFieldLabel.Layout.Row = 2;
            app.frequencyEditFieldLabel.Layout.Column = 1;
            app.frequencyEditFieldLabel.Text = 'frequency';

            % Create grangerfrequencyEditField
            app.grangerfrequencyEditField = uieditfield(app.GridLayout45, 'text');
            app.grangerfrequencyEditField.HorizontalAlignment = 'center';
            app.grangerfrequencyEditField.Enable = 'off';
            app.grangerfrequencyEditField.Layout.Row = 2;
            app.grangerfrequencyEditField.Layout.Column = 2;
            app.grangerfrequencyEditField.Value = '[0.01 0.1]';

            % Create readmegrangerpreprocessingButton_2
            app.readmegrangerpreprocessingButton_2 = uibutton(app.GridLayout31, 'push');
            app.readmegrangerpreprocessingButton_2.Layout.Row = 9;
            app.readmegrangerpreprocessingButton_2.Layout.Column = 3;
            app.readmegrangerpreprocessingButton_2.Text = 'readme';

            % Create correlationSwitch
            app.correlationSwitch = uibutton(app.GridLayout31, 'state');
            app.correlationSwitch.ValueChangedFcn = createCallbackFcn(app, @correlationSwitchValueChanged2, true);
            app.correlationSwitch.Text = 'correlation';
            app.correlationSwitch.Layout.Row = 1;
            app.correlationSwitch.Layout.Column = 1;

            % Create coherenceSwitch
            app.coherenceSwitch = uibutton(app.GridLayout31, 'state');
            app.coherenceSwitch.ValueChangedFcn = createCallbackFcn(app, @coherenceSwitchValueChanged2, true);
            app.coherenceSwitch.Text = 'coherence';
            app.coherenceSwitch.Layout.Row = 2;
            app.coherenceSwitch.Layout.Column = 1;

            % Create partialcoherenceSwitch
            app.partialcoherenceSwitch = uibutton(app.GridLayout31, 'state');
            app.partialcoherenceSwitch.ValueChangedFcn = createCallbackFcn(app, @partialcoherenceSwitchValueChanged2, true);
            app.partialcoherenceSwitch.Enable = 'off';
            app.partialcoherenceSwitch.Text = {'partial coherence'; ''};
            app.partialcoherenceSwitch.Layout.Row = 3;
            app.partialcoherenceSwitch.Layout.Column = 1;

            % Create grangerSwitch
            app.grangerSwitch = uibutton(app.GridLayout31, 'state');
            app.grangerSwitch.ValueChangedFcn = createCallbackFcn(app, @grangerSwitchValueChanged2, true);
            app.grangerSwitch.Enable = 'off';
            app.grangerSwitch.Text = 'Granger causality';
            app.grangerSwitch.Layout.Row = 8;
            app.grangerSwitch.Layout.Column = 1;

            % Create sb_gc_switch
            app.sb_gc_switch = uibutton(app.GridLayout31, 'state');
            app.sb_gc_switch.ValueChangedFcn = createCallbackFcn(app, @sb_gc_switchValueChanged2, true);
            app.sb_gc_switch.Text = {'sb granger causality'; ''};
            app.sb_gc_switch.Layout.Row = 7;
            app.sb_gc_switch.Layout.Column = 1;

            % Create complexitySwitch
            app.complexitySwitch = uibutton(app.GridLayout31, 'state');
            app.complexitySwitch.ValueChangedFcn = createCallbackFcn(app, @complexitySwitchValueChanged2, true);
            app.complexitySwitch.Text = 'complexity';
            app.complexitySwitch.Layout.Row = 6;
            app.complexitySwitch.Layout.Column = 1;

            % Create synchronizationSwitch
            app.synchronizationSwitch = uibutton(app.GridLayout31, 'state');
            app.synchronizationSwitch.ValueChangedFcn = createCallbackFcn(app, @synchronizationSwitchValueChanged2, true);
            app.synchronizationSwitch.Text = 'sychronization';
            app.synchronizationSwitch.Layout.Row = 5;
            app.synchronizationSwitch.Layout.Column = 1;

            % Create transinformationSwitch
            app.transinformationSwitch = uibutton(app.GridLayout31, 'state');
            app.transinformationSwitch.ValueChangedFcn = createCallbackFcn(app, @transinformationSwitchValueChanged2, true);
            app.transinformationSwitch.Text = 'transinformation';
            app.transinformationSwitch.Layout.Row = 4;
            app.transinformationSwitch.Layout.Column = 1;

            % Create DataexportTab
            app.DataexportTab = uitab(app.TabGroup);
            app.DataexportTab.Title = 'Data export';

            % Create GridLayout61
            app.GridLayout61 = uigridlayout(app.DataexportTab);
            app.GridLayout61.ColumnWidth = {'1x'};
            app.GridLayout61.RowHeight = {'1x', '1x', '10x', '1x'};

            % Create ExportLabel
            app.ExportLabel = uilabel(app.GridLayout61);
            app.ExportLabel.HorizontalAlignment = 'center';
            app.ExportLabel.FontSize = 14;
            app.ExportLabel.FontWeight = 'bold';
            app.ExportLabel.Layout.Row = 1;
            app.ExportLabel.Layout.Column = 1;
            app.ExportLabel.Text = 'Export';

            % Create Label_3
            app.Label_3 = uilabel(app.GridLayout61);
            app.Label_3.Layout.Row = 2;
            app.Label_3.Layout.Column = 1;
            app.Label_3.Text = 'exportiert die ausgewaehlten *Cluster.mat in das BIOMAG Export Format. Ausgabe wird im root dir gespeichert.';

            % Create ExportButton
            app.ExportButton = uibutton(app.GridLayout61, 'push');
            app.ExportButton.ButtonPushedFcn = createCallbackFcn(app, @ExportButtonPushed, true);
            app.ExportButton.Layout.Row = 4;
            app.ExportButton.Layout.Column = 1;
            app.ExportButton.Text = 'Export';

            % Create GridLayout62
            app.GridLayout62 = uigridlayout(app.GridLayout61);
            app.GridLayout62.ColumnWidth = {'1x'};
            app.GridLayout62.RowHeight = {'0.5x', '1x', '9x'};
            app.GridLayout62.Layout.Row = 3;
            app.GridLayout62.Layout.Column = 1;

            % Create OptionenLabel
            app.OptionenLabel = uilabel(app.GridLayout62);
            app.OptionenLabel.Layout.Row = 1;
            app.OptionenLabel.Layout.Column = 1;
            app.OptionenLabel.Text = 'Optionen';

            % Create GridLayout63
            app.GridLayout63 = uigridlayout(app.GridLayout62);
            app.GridLayout63.RowHeight = {'1x'};
            app.GridLayout63.ColumnSpacing = 20;
            app.GridLayout63.Padding = [0 0 0 0];
            app.GridLayout63.Layout.Row = 2;
            app.GridLayout63.Layout.Column = 1;

            % Create export_group_as_rep_measure
            app.export_group_as_rep_measure = uibutton(app.GridLayout63, 'state');
            app.export_group_as_rep_measure.ValueChangedFcn = createCallbackFcn(app, @export_group_as_rep_measureValueChanged, true);
            app.export_group_as_rep_measure.Text = 'Gruppen als repeated Measures exportieren';
            app.export_group_as_rep_measure.Layout.Row = 1;
            app.export_group_as_rep_measure.Layout.Column = 1;

            % Create export_group_as_trial
            app.export_group_as_trial = uibutton(app.GridLayout63, 'state');
            app.export_group_as_trial.ValueChangedFcn = createCallbackFcn(app, @export_group_as_trialValueChanged, true);
            app.export_group_as_trial.Text = {'Gruppen als Trials (pre & post) der gleichen Messung'; 'exportieren'};
            app.export_group_as_trial.Layout.Row = 1;
            app.export_group_as_trial.Layout.Column = 2;

            % Create datareductionTab
            app.datareductionTab = uitab(app.TabGroup);
            app.datareductionTab.Title = 'data reduction';

            % Create GridLayout22
            app.GridLayout22 = uigridlayout(app.datareductionTab);
            app.GridLayout22.ColumnWidth = {'1x'};
            app.GridLayout22.RowHeight = {'1x', '4x', '10x'};
            app.GridLayout22.Visible = 'off';

            % Create reduceClusterdataButton
            app.reduceClusterdataButton = uibutton(app.GridLayout22, 'push');
            app.reduceClusterdataButton.ButtonPushedFcn = createCallbackFcn(app, @reduceClusterdataButtonPushed, true);
            app.reduceClusterdataButton.Layout.Row = 1;
            app.reduceClusterdataButton.Layout.Column = 1;
            app.reduceClusterdataButton.Text = 'reduce Cluster data';

            % Create GridLayout23
            app.GridLayout23 = uigridlayout(app.GridLayout22);
            app.GridLayout23.ColumnWidth = {'1x'};
            app.GridLayout23.RowHeight = {'1x', '10x'};
            app.GridLayout23.Layout.Row = 3;
            app.GridLayout23.Layout.Column = 1;

            % Create ExplanationTextAreaLabel
            app.ExplanationTextAreaLabel = uilabel(app.GridLayout23);
            app.ExplanationTextAreaLabel.HorizontalAlignment = 'center';
            app.ExplanationTextAreaLabel.Layout.Row = 1;
            app.ExplanationTextAreaLabel.Layout.Column = 1;
            app.ExplanationTextAreaLabel.Text = 'Explanation';

            % Create ExplanationTextArea
            app.ExplanationTextArea = uitextarea(app.GridLayout23);
            app.ExplanationTextArea.Layout.Row = 2;
            app.ExplanationTextArea.Layout.Column = 1;
            app.ExplanationTextArea.Value = {'Much of the estimation time is consumed by loading the Cluster.mat files. The major amount of memory size is consumed by the original data from the included voxel. However, only the mean values for every Cluster will be used further. Therefore, if Clustersize is large it might be reasonable to delete the original data and save only the Y_mean values. This is performed by the current function - reduce Cluster structure.'; ''};

            % Create deleteifpossiblePanel
            app.deleteifpossiblePanel = uipanel(app.GridLayout22);
            app.deleteifpossiblePanel.Title = 'delete if possible';
            app.deleteifpossiblePanel.Layout.Row = 2;
            app.deleteifpossiblePanel.Layout.Column = 1;

            % Create GridLayout24
            app.GridLayout24 = uigridlayout(app.deleteifpossiblePanel);
            app.GridLayout24.ColumnWidth = {'1x'};

            % Create GridLayout25
            app.GridLayout25 = uigridlayout(app.GridLayout24);
            app.GridLayout25.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout25.RowHeight = {'1x'};
            app.GridLayout25.Layout.Row = 1;
            app.GridLayout25.Layout.Column = 1;

            % Create YCheckBox
            app.YCheckBox = uicheckbox(app.GridLayout25);
            app.YCheckBox.Text = 'Y';
            app.YCheckBox.Layout.Row = 1;
            app.YCheckBox.Layout.Column = 1;

            % Create Yc1CheckBox
            app.Yc1CheckBox = uicheckbox(app.GridLayout25);
            app.Yc1CheckBox.Text = 'Yc1';
            app.Yc1CheckBox.Layout.Row = 1;
            app.Yc1CheckBox.Layout.Column = 2;

            % Create Yc2CheckBox
            app.Yc2CheckBox = uicheckbox(app.GridLayout25);
            app.Yc2CheckBox.Text = 'Yc2';
            app.Yc2CheckBox.Layout.Row = 1;
            app.Yc2CheckBox.Layout.Column = 3;

            % Create GridLayout26
            app.GridLayout26 = uigridlayout(app.GridLayout24);
            app.GridLayout26.RowHeight = {'1x'};
            app.GridLayout26.Layout.Row = 2;
            app.GridLayout26.Layout.Column = 1;

            % Create newprefixforClustermatfilesLabel
            app.newprefixforClustermatfilesLabel = uilabel(app.GridLayout26);
            app.newprefixforClustermatfilesLabel.HorizontalAlignment = 'center';
            app.newprefixforClustermatfilesLabel.Layout.Row = 1;
            app.newprefixforClustermatfilesLabel.Layout.Column = 1;
            app.newprefixforClustermatfilesLabel.Text = 'new prefix for Cluster.mat files';

            % Create newprefixforClustermatfilesEditField
            app.newprefixforClustermatfilesEditField = uieditfield(app.GridLayout26, 'text');
            app.newprefixforClustermatfilesEditField.HorizontalAlignment = 'center';
            app.newprefixforClustermatfilesEditField.Layout.Row = 1;
            app.newprefixforClustermatfilesEditField.Layout.Column = 2;
            app.newprefixforClustermatfilesEditField.Value = 'red_';

            % Create visualizationTab
            app.visualizationTab = uitab(app.TabGroup);
            app.visualizationTab.Title = 'visualization';

            % Create GridLayout59
            app.GridLayout59 = uigridlayout(app.visualizationTab);
            app.GridLayout59.ColumnWidth = {'3x', '1x'};
            app.GridLayout59.RowHeight = {'1x'};
            app.GridLayout59.Padding = [0 0 0 0];
            app.GridLayout59.Visible = 'off';

            % Create GridLayout47
            app.GridLayout47 = uigridlayout(app.GridLayout59);
            app.GridLayout47.ColumnWidth = {'1x'};
            app.GridLayout47.RowHeight = {'3x', '7x', '1x'};
            app.GridLayout47.Layout.Row = 1;
            app.GridLayout47.Layout.Column = 1;

            % Create GridLayout48
            app.GridLayout48 = uigridlayout(app.GridLayout47);
            app.GridLayout48.ColumnWidth = {'1x', '1x', '1x', '1x'};
            app.GridLayout48.RowHeight = {'1x'};
            app.GridLayout48.Layout.Row = 3;
            app.GridLayout48.Layout.Column = 1;

            % Create C2CestimateClusterstatisticButton_2
            app.C2CestimateClusterstatisticButton_2 = uibutton(app.GridLayout48, 'push');
            app.C2CestimateClusterstatisticButton_2.ButtonPushedFcn = createCallbackFcn(app, @C2CestimateClusterstatisticButton_2Pushed, true);
            app.C2CestimateClusterstatisticButton_2.BackgroundColor = [1 0 0];
            app.C2CestimateClusterstatisticButton_2.Layout.Row = 1;
            app.C2CestimateClusterstatisticButton_2.Layout.Column = 1;
            app.C2CestimateClusterstatisticButton_2.Text = 'estimate Cluster statistic';

            % Create C2CestimateClusterstatisticButton
            app.C2CestimateClusterstatisticButton = uibutton(app.GridLayout48, 'push');
            app.C2CestimateClusterstatisticButton.ButtonPushedFcn = createCallbackFcn(app, @C2CestimateClusterstatisticButtonPushed, true);
            app.C2CestimateClusterstatisticButton.Layout.Row = 1;
            app.C2CestimateClusterstatisticButton.Layout.Column = 2;
            app.C2CestimateClusterstatisticButton.Text = 'estimate Cluster statistic';

            % Create C2CnormalizeCheckBox
            app.C2CnormalizeCheckBox = uicheckbox(app.GridLayout48);
            app.C2CnormalizeCheckBox.Text = 'normalize';
            app.C2CnormalizeCheckBox.Layout.Row = 1;
            app.C2CnormalizeCheckBox.Layout.Column = 3;

            % Create C2CestimatedataLamp
            app.C2CestimatedataLamp = uilamp(app.GridLayout48);
            app.C2CestimatedataLamp.Layout.Row = 1;
            app.C2CestimatedataLamp.Layout.Column = 4;
            app.C2CestimatedataLamp.Color = [1 0 0];

            % Create GridLayout49
            app.GridLayout49 = uigridlayout(app.GridLayout47);
            app.GridLayout49.RowHeight = {'1x', '10x'};
            app.GridLayout49.Layout.Row = 2;
            app.GridLayout49.Layout.Column = 1;

            % Create group1ListBoxLabel
            app.group1ListBoxLabel = uilabel(app.GridLayout49);
            app.group1ListBoxLabel.HorizontalAlignment = 'center';
            app.group1ListBoxLabel.Layout.Row = 1;
            app.group1ListBoxLabel.Layout.Column = 1;
            app.group1ListBoxLabel.Text = 'group 1';

            % Create C2Cgroup1ListBox
            app.C2Cgroup1ListBox = uilistbox(app.GridLayout49);
            app.C2Cgroup1ListBox.Multiselect = 'on';
            app.C2Cgroup1ListBox.Layout.Row = 2;
            app.C2Cgroup1ListBox.Layout.Column = 1;
            app.C2Cgroup1ListBox.Value = {'Item 1'};

            % Create group2ListBoxLabel
            app.group2ListBoxLabel = uilabel(app.GridLayout49);
            app.group2ListBoxLabel.HorizontalAlignment = 'center';
            app.group2ListBoxLabel.Layout.Row = 1;
            app.group2ListBoxLabel.Layout.Column = 2;
            app.group2ListBoxLabel.Text = 'group 2';

            % Create C2Cgroup2ListBox
            app.C2Cgroup2ListBox = uilistbox(app.GridLayout49);
            app.C2Cgroup2ListBox.Multiselect = 'on';
            app.C2Cgroup2ListBox.Layout.Row = 2;
            app.C2Cgroup2ListBox.Layout.Column = 2;
            app.C2Cgroup2ListBox.Value = {'Item 1'};

            % Create GridLayout50
            app.GridLayout50 = uigridlayout(app.GridLayout47);
            app.GridLayout50.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout50.RowHeight = {'0.4x', '2x'};
            app.GridLayout50.Layout.Row = 1;
            app.GridLayout50.Layout.Column = 1;

            % Create DatatouseLabel
            app.DatatouseLabel = uilabel(app.GridLayout50);
            app.DatatouseLabel.HorizontalAlignment = 'center';
            app.DatatouseLabel.Layout.Row = 1;
            app.DatatouseLabel.Layout.Column = 1;
            app.DatatouseLabel.Text = 'Data to use';

            % Create C2CDatatouseButtonGroup
            app.C2CDatatouseButtonGroup = uibuttongroup(app.GridLayout50);
            app.C2CDatatouseButtonGroup.Layout.Row = 2;
            app.C2CDatatouseButtonGroup.Layout.Column = 1;

            % Create C2CYButton
            app.C2CYButton = uiradiobutton(app.C2CDatatouseButtonGroup);
            app.C2CYButton.Text = 'Y';
            app.C2CYButton.Position = [12 100 30 15];
            app.C2CYButton.Value = true;

            % Create C2CYc1Button
            app.C2CYc1Button = uiradiobutton(app.C2CDatatouseButtonGroup);
            app.C2CYc1Button.Text = 'Yc1';
            app.C2CYc1Button.Position = [11 72 43 15];

            % Create C2CYc2Button
            app.C2CYc2Button = uiradiobutton(app.C2CDatatouseButtonGroup);
            app.C2CYc2Button.Text = 'Yc2';
            app.C2CYc2Button.Position = [11 38 43 15];

            % Create StatisticsLabel
            app.StatisticsLabel = uilabel(app.GridLayout50);
            app.StatisticsLabel.HorizontalAlignment = 'center';
            app.StatisticsLabel.Layout.Row = 1;
            app.StatisticsLabel.Layout.Column = 2;
            app.StatisticsLabel.Text = 'Statistics';

            % Create C2CstatisticButtonGroup
            app.C2CstatisticButtonGroup = uibuttongroup(app.GridLayout50);
            app.C2CstatisticButtonGroup.Layout.Row = 2;
            app.C2CstatisticButtonGroup.Layout.Column = 2;

            % Create C2CtwosampleButton
            app.C2CtwosampleButton = uitogglebutton(app.C2CstatisticButtonGroup);
            app.C2CtwosampleButton.Text = 'two-sample';
            app.C2CtwosampleButton.Position = [11 101 100 22];
            app.C2CtwosampleButton.Value = true;

            % Create C2CpairedButton
            app.C2CpairedButton = uitogglebutton(app.C2CstatisticButtonGroup);
            app.C2CpairedButton.Text = 'paired';
            app.C2CpairedButton.Position = [11 75 100 22];

            % Create C2CloaddataLamp
            app.C2CloaddataLamp = uilamp(app.GridLayout50);
            app.C2CloaddataLamp.Layout.Row = 1;
            app.C2CloaddataLamp.Layout.Column = 3;
            app.C2CloaddataLamp.Color = [1 0 0];

            % Create GridLayout60
            app.GridLayout60 = uigridlayout(app.GridLayout50);
            app.GridLayout60.ColumnWidth = {'1x'};
            app.GridLayout60.Layout.Row = 2;
            app.GridLayout60.Layout.Column = 3;

            % Create C2CloaddataButton
            app.C2CloaddataButton = uibutton(app.GridLayout60, 'push');
            app.C2CloaddataButton.ButtonPushedFcn = createCallbackFcn(app, @C2CloaddataButtonPushed, true);
            app.C2CloaddataButton.Layout.Row = 2;
            app.C2CloaddataButton.Layout.Column = 1;
            app.C2CloaddataButton.Text = 'load data';

            % Create C2CloaddataButton_2
            app.C2CloaddataButton_2 = uibutton(app.GridLayout60, 'push');
            app.C2CloaddataButton_2.ButtonPushedFcn = createCallbackFcn(app, @C2CloaddataButton_2Pushed, true);
            app.C2CloaddataButton_2.BackgroundColor = [1 0 0];
            app.C2CloaddataButton_2.Layout.Row = 1;
            app.C2CloaddataButton_2.Layout.Column = 1;
            app.C2CloaddataButton_2.Text = 'load data';

            % Create GridLayout51
            app.GridLayout51 = uigridlayout(app.GridLayout59);
            app.GridLayout51.ColumnWidth = {'1x'};
            app.GridLayout51.RowHeight = {'1x', '10x', '1x'};
            app.GridLayout51.Visible = 'off';
            app.GridLayout51.Layout.Row = 1;
            app.GridLayout51.Layout.Column = 2;

            % Create C2CshownetworksButton
            app.C2CshownetworksButton = uibutton(app.GridLayout51, 'push');
            app.C2CshownetworksButton.ButtonPushedFcn = createCallbackFcn(app, @C2CshownetworksButtonPushed, true);
            app.C2CshownetworksButton.Layout.Row = 3;
            app.C2CshownetworksButton.Layout.Column = 1;
            app.C2CshownetworksButton.Text = 'show networks';

            % Create BehaviorvsBrainconnectivitywithEXELdataPanel
            app.BehaviorvsBrainconnectivitywithEXELdataPanel = uipanel(app.GridLayout51);
            app.BehaviorvsBrainconnectivitywithEXELdataPanel.Title = 'Behavior vs. Brain connectivity with EXEL data';
            app.BehaviorvsBrainconnectivitywithEXELdataPanel.Layout.Row = 2;
            app.BehaviorvsBrainconnectivitywithEXELdataPanel.Layout.Column = 1;

            % Create GridLayout53
            app.GridLayout53 = uigridlayout(app.BehaviorvsBrainconnectivitywithEXELdataPanel);
            app.GridLayout53.ColumnWidth = {'1x'};
            app.GridLayout53.RowHeight = {'3x', '1x', '1x', '0.5x', '8x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout53.RowSpacing = 4;
            app.GridLayout53.Padding = [1 1 1 1];

            % Create loadexelfileButton
            app.loadexelfileButton = uibutton(app.GridLayout53, 'push');
            app.loadexelfileButton.ButtonPushedFcn = createCallbackFcn(app, @loadexelfileButtonPushed, true);
            app.loadexelfileButton.Layout.Row = 2;
            app.loadexelfileButton.Layout.Column = 1;
            app.loadexelfileButton.Text = 'load exel file';

            % Create C2CexelreadmeButton
            app.C2CexelreadmeButton = uibutton(app.GridLayout53, 'push');
            app.C2CexelreadmeButton.ButtonPushedFcn = createCallbackFcn(app, @C2CexelreadmeButtonPushed, true);
            app.C2CexelreadmeButton.Layout.Row = 3;
            app.C2CexelreadmeButton.Layout.Column = 1;
            app.C2CexelreadmeButton.Text = 'readme';

            % Create ExelvariablesListBoxLabel
            app.ExelvariablesListBoxLabel = uilabel(app.GridLayout53);
            app.ExelvariablesListBoxLabel.HorizontalAlignment = 'center';
            app.ExelvariablesListBoxLabel.Layout.Row = 4;
            app.ExelvariablesListBoxLabel.Layout.Column = 1;
            app.ExelvariablesListBoxLabel.Text = 'Exel variables';

            % Create ExelvariablesListBox
            app.ExelvariablesListBox = uilistbox(app.GridLayout53);
            app.ExelvariablesListBox.Multiselect = 'on';
            app.ExelvariablesListBox.Layout.Row = 5;
            app.ExelvariablesListBox.Layout.Column = 1;
            app.ExelvariablesListBox.Value = {'Item 1'};

            % Create C2CestimatenetworkcorrelationButton
            app.C2CestimatenetworkcorrelationButton = uibutton(app.GridLayout53, 'push');
            app.C2CestimatenetworkcorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @C2CestimatenetworkcorrelationButtonPushed, true);
            app.C2CestimatenetworkcorrelationButton.Layout.Row = 6;
            app.C2CestimatenetworkcorrelationButton.Layout.Column = 1;
            app.C2CestimatenetworkcorrelationButton.Text = 'estimate network correlation';

            % Create C2CestimatecorrelationButton
            app.C2CestimatecorrelationButton = uibutton(app.GridLayout53, 'push');
            app.C2CestimatecorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @C2CestimatecorrelationButtonPushed, true);
            app.C2CestimatecorrelationButton.Layout.Row = 7;
            app.C2CestimatecorrelationButton.Layout.Column = 1;
            app.C2CestimatecorrelationButton.Text = 'estimate correlation';

            % Create visualizecorrelationButton
            app.visualizecorrelationButton = uibutton(app.GridLayout53, 'push');
            app.visualizecorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @visualizecorrelationButtonPushed, true);
            app.visualizecorrelationButton.Layout.Row = 8;
            app.visualizecorrelationButton.Layout.Column = 1;
            app.visualizecorrelationButton.Text = 'visualize correlation';

            % Create C2CvisualizenetworkcorrelationButton
            app.C2CvisualizenetworkcorrelationButton = uibutton(app.GridLayout53, 'push');
            app.C2CvisualizenetworkcorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @C2CvisualizenetworkcorrelationButtonPushed, true);
            app.C2CvisualizenetworkcorrelationButton.BackgroundColor = [1 0 0];
            app.C2CvisualizenetworkcorrelationButton.Layout.Row = 9;
            app.C2CvisualizenetworkcorrelationButton.Layout.Column = 1;
            app.C2CvisualizenetworkcorrelationButton.Text = 'visualize network correlation';

            % Create C2CestimateexelcorrelationLamp
            app.C2CestimateexelcorrelationLamp = uilamp(app.GridLayout53);
            app.C2CestimateexelcorrelationLamp.Layout.Row = 10;
            app.C2CestimateexelcorrelationLamp.Layout.Column = 1;
            app.C2CestimateexelcorrelationLamp.Color = [1 0 0];

            % Create GridLayout54
            app.GridLayout54 = uigridlayout(app.GridLayout53);
            app.GridLayout54.ColumnSpacing = 1;
            app.GridLayout54.RowSpacing = 1;
            app.GridLayout54.Padding = [0 0 0 0];
            app.GridLayout54.Layout.Row = 1;
            app.GridLayout54.Layout.Column = 1;

            % Create C2CchooseexelfileButton
            app.C2CchooseexelfileButton = uibutton(app.GridLayout54, 'push');
            app.C2CchooseexelfileButton.ButtonPushedFcn = createCallbackFcn(app, @C2CchooseexelfileButtonPushed, true);
            app.C2CchooseexelfileButton.Layout.Row = 2;
            app.C2CchooseexelfileButton.Layout.Column = 2;
            app.C2CchooseexelfileButton.Text = '...';

            % Create xlscsvFileEditFieldLabel
            app.xlscsvFileEditFieldLabel = uilabel(app.GridLayout54);
            app.xlscsvFileEditFieldLabel.HorizontalAlignment = 'center';
            app.xlscsvFileEditFieldLabel.Layout.Row = 1;
            app.xlscsvFileEditFieldLabel.Layout.Column = 1;
            app.xlscsvFileEditFieldLabel.Text = 'xls/csv File';

            % Create xlscsvFileEditField
            app.xlscsvFileEditField = uieditfield(app.GridLayout54, 'text');
            app.xlscsvFileEditField.HorizontalAlignment = 'center';
            app.xlscsvFileEditField.FontSize = 8;
            app.xlscsvFileEditField.Layout.Row = 1;
            app.xlscsvFileEditField.Layout.Column = 2;
            app.xlscsvFileEditField.Value = 'G:\Google Drive\paper\02_Vesti_bilateral\Vertigo_Behavioral20180321.xlsx';

            % Create BrainconnectivityPanel
            app.BrainconnectivityPanel = uipanel(app.GridLayout51);
            app.BrainconnectivityPanel.Title = 'Brain connectivity';
            app.BrainconnectivityPanel.Layout.Row = 1;
            app.BrainconnectivityPanel.Layout.Column = 1;

            % Create GridLayout52
            app.GridLayout52 = uigridlayout(app.BrainconnectivityPanel);
            app.GridLayout52.ColumnWidth = {'1x'};
            app.GridLayout52.RowSpacing = 0;
            app.GridLayout52.Padding = [0 0 0 0];

            % Create C2CmeanZdiffButton
            app.C2CmeanZdiffButton = uibutton(app.GridLayout52, 'push');
            app.C2CmeanZdiffButton.ButtonPushedFcn = createCallbackFcn(app, @C2CmeanZdiffButtonPushed, true);
            app.C2CmeanZdiffButton.Layout.Row = 1;
            app.C2CmeanZdiffButton.Layout.Column = 1;
            app.C2CmeanZdiffButton.Text = 'mean Z diff';

            % Create C2CBCsigdiffButton
            app.C2CBCsigdiffButton = uibutton(app.GridLayout52, 'push');
            app.C2CBCsigdiffButton.ButtonPushedFcn = createCallbackFcn(app, @C2CBCsigdiffButtonPushed, true);
            app.C2CBCsigdiffButton.Layout.Row = 2;
            app.C2CBCsigdiffButton.Layout.Column = 1;
            app.C2CBCsigdiffButton.Text = 'sig diff';

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.GridLayout);
            app.GridLayout2.ColumnWidth = {'1x'};
            app.GridLayout2.RowHeight = {'1x', '4x'};
            app.GridLayout2.Layout.Row = 1;
            app.GridLayout2.Layout.Column = 1;

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.GridLayout2);
            app.GridLayout3.ColumnWidth = {'1x'};
            app.GridLayout3.RowHeight = {'1x', '10x', '1x'};
            app.GridLayout3.Padding = [1 1 1 1];
            app.GridLayout3.Layout.Row = 2;
            app.GridLayout3.Layout.Column = 1;

            % Create updateButton
            app.updateButton = uibutton(app.GridLayout3, 'push');
            app.updateButton.ButtonPushedFcn = createCallbackFcn(app, @updateButtonPushed, true);
            app.updateButton.Layout.Row = 3;
            app.updateButton.Layout.Column = 1;
            app.updateButton.Text = 'update';

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.GridLayout3);
            app.GridLayout4.RowHeight = {'1x', '10x'};
            app.GridLayout4.Layout.Row = 2;
            app.GridLayout4.Layout.Column = 1;

            % Create trialgroup1Label
            app.trialgroup1Label = uilabel(app.GridLayout4);
            app.trialgroup1Label.HorizontalAlignment = 'center';
            app.trialgroup1Label.Layout.Row = 1;
            app.trialgroup1Label.Layout.Column = 1;
            app.trialgroup1Label.Text = 'trial/group 1';

            % Create g1ListBox
            app.g1ListBox = uilistbox(app.GridLayout4);
            app.g1ListBox.Items = {};
            app.g1ListBox.Multiselect = 'on';
            app.g1ListBox.Layout.Row = 2;
            app.g1ListBox.Layout.Column = 1;
            app.g1ListBox.Value = {};

            % Create g2ListBox
            app.g2ListBox = uilistbox(app.GridLayout4);
            app.g2ListBox.Items = {};
            app.g2ListBox.Multiselect = 'on';
            app.g2ListBox.Layout.Row = 2;
            app.g2ListBox.Layout.Column = 2;
            app.g2ListBox.Value = {};

            % Create trialgroup2Label
            app.trialgroup2Label = uilabel(app.GridLayout4);
            app.trialgroup2Label.HorizontalAlignment = 'center';
            app.trialgroup2Label.Layout.Row = 1;
            app.trialgroup2Label.Layout.Column = 2;
            app.trialgroup2Label.Text = 'trial/group 2';

            % Create OutputDirectoryimportedClusterdatawillbestoredhereLabel
            app.OutputDirectoryimportedClusterdatawillbestoredhereLabel = uilabel(app.GridLayout3);
            app.OutputDirectoryimportedClusterdatawillbestoredhereLabel.HorizontalAlignment = 'center';
            app.OutputDirectoryimportedClusterdatawillbestoredhereLabel.FontWeight = 'bold';
            app.OutputDirectoryimportedClusterdatawillbestoredhereLabel.Layout.Row = 1;
            app.OutputDirectoryimportedClusterdatawillbestoredhereLabel.Layout.Column = 1;
            app.OutputDirectoryimportedClusterdatawillbestoredhereLabel.Text = {'Output Directory'; '(imported Clusterdata will be stored here)'};

            % Create GridLayout19
            app.GridLayout19 = uigridlayout(app.GridLayout2);
            app.GridLayout19.ColumnWidth = {'1x'};
            app.GridLayout19.RowHeight = {'1x', '5x'};
            app.GridLayout19.ColumnSpacing = 1;
            app.GridLayout19.RowSpacing = 2;
            app.GridLayout19.Padding = [1 1 1 1];
            app.GridLayout19.Layout.Row = 1;
            app.GridLayout19.Layout.Column = 1;

            % Create GridLayout20
            app.GridLayout20 = uigridlayout(app.GridLayout19);
            app.GridLayout20.ColumnWidth = {'2x', '1x', '1x'};
            app.GridLayout20.RowHeight = {'1x'};
            app.GridLayout20.ColumnSpacing = 5;
            app.GridLayout20.RowSpacing = 1;
            app.GridLayout20.Padding = [1 1 1 1];
            app.GridLayout20.Layout.Row = 1;
            app.GridLayout20.Layout.Column = 1;

            % Create initnewButton
            app.initnewButton = uibutton(app.GridLayout20, 'push');
            app.initnewButton.ButtonPushedFcn = createCallbackFcn(app, @initnewButtonPushed, true);
            app.initnewButton.Layout.Row = 1;
            app.initnewButton.Layout.Column = 1;
            app.initnewButton.Text = 'init/new';

            % Create loadButton
            app.loadButton = uibutton(app.GridLayout20, 'push');
            app.loadButton.ButtonPushedFcn = createCallbackFcn(app, @loadButtonPushed2, true);
            app.loadButton.Layout.Row = 1;
            app.loadButton.Layout.Column = 2;
            app.loadButton.Text = 'load';

            % Create saveButton
            app.saveButton = uibutton(app.GridLayout20, 'push');
            app.saveButton.ButtonPushedFcn = createCallbackFcn(app, @saveButtonPushed2, true);
            app.saveButton.Layout.Row = 1;
            app.saveButton.Layout.Column = 3;
            app.saveButton.Text = 'save';

            % Create GridLayout21
            app.GridLayout21 = uigridlayout(app.GridLayout19);
            app.GridLayout21.ColumnWidth = {'1.2x', '3x'};
            app.GridLayout21.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout21.ColumnSpacing = 4;
            app.GridLayout21.RowSpacing = 4;
            app.GridLayout21.Padding = [1 1 1 1];
            app.GridLayout21.Layout.Row = 2;
            app.GridLayout21.Layout.Column = 1;

            % Create resultsrootdirEditFieldLabel
            app.resultsrootdirEditFieldLabel = uilabel(app.GridLayout21);
            app.resultsrootdirEditFieldLabel.HorizontalAlignment = 'center';
            app.resultsrootdirEditFieldLabel.Layout.Row = 1;
            app.resultsrootdirEditFieldLabel.Layout.Column = 1;
            app.resultsrootdirEditFieldLabel.Text = 'results root dir';

            % Create group1dirEditFieldLabel
            app.group1dirEditFieldLabel = uilabel(app.GridLayout21);
            app.group1dirEditFieldLabel.HorizontalAlignment = 'center';
            app.group1dirEditFieldLabel.Layout.Row = 2;
            app.group1dirEditFieldLabel.Layout.Column = 1;
            app.group1dirEditFieldLabel.Text = 'group 1 dir';

            % Create group2dirEditFieldLabel
            app.group2dirEditFieldLabel = uilabel(app.GridLayout21);
            app.group2dirEditFieldLabel.HorizontalAlignment = 'center';
            app.group2dirEditFieldLabel.Layout.Row = 3;
            app.group2dirEditFieldLabel.Layout.Column = 1;
            app.group2dirEditFieldLabel.Text = 'group 2 dir';

            % Create g1dirEditField
            app.g1dirEditField = uieditfield(app.GridLayout21, 'text');
            app.g1dirEditField.Editable = 'off';
            app.g1dirEditField.FontSize = 9;
            app.g1dirEditField.Enable = 'off';
            app.g1dirEditField.Layout.Row = 2;
            app.g1dirEditField.Layout.Column = 2;
            app.g1dirEditField.Value = 'leer';

            % Create g2dirEditField
            app.g2dirEditField = uieditfield(app.GridLayout21, 'text');
            app.g2dirEditField.Editable = 'off';
            app.g2dirEditField.FontSize = 9;
            app.g2dirEditField.Enable = 'off';
            app.g2dirEditField.Layout.Row = 3;
            app.g2dirEditField.Layout.Column = 2;
            app.g2dirEditField.Value = 'leer';

            % Create GridLayout64
            app.GridLayout64 = uigridlayout(app.GridLayout21);
            app.GridLayout64.ColumnWidth = {'3x', '1x'};
            app.GridLayout64.RowHeight = {'1x'};
            app.GridLayout64.Padding = [1 1 1 1];
            app.GridLayout64.Layout.Row = 1;
            app.GridLayout64.Layout.Column = 2;

            % Create resultsdirEditField
            app.resultsdirEditField = uieditfield(app.GridLayout64, 'text');
            app.resultsdirEditField.Editable = 'off';
            app.resultsdirEditField.FontSize = 10;
            app.resultsdirEditField.Layout.Row = 1;
            app.resultsdirEditField.Layout.Column = 1;
            app.resultsdirEditField.Value = 'bitte ein Verzeichnis auswaehlen';

            % Create Buttonchooseresultsdir
            app.Buttonchooseresultsdir = uibutton(app.GridLayout64, 'push');
            app.Buttonchooseresultsdir.ButtonPushedFcn = createCallbackFcn(app, @ButtonchooseresultsdirPushed, true);
            app.Buttonchooseresultsdir.Layout.Row = 1;
            app.Buttonchooseresultsdir.Layout.Column = 2;
            app.Buttonchooseresultsdir.Text = '...';

            % Create Label_2
            app.Label_2 = uilabel(app.ck_rc3_uiUIFigure);
            app.Label_2.VerticalAlignment = 'top';
            app.Label_2.Position = [1133 385 137 22];
            app.Label_2.Text = '';

            % Show the figure after all components are created
            app.ck_rc3_uiUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ck_rc3_GUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ck_rc3_uiUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ck_rc3_uiUIFigure)
        end
    end
end