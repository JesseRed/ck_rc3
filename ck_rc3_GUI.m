classdef ck_rc3_GUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        ClusterDefinitionTab            matlab.ui.container.Tab
        exemplarydatafileLabel          matlab.ui.control.Label
        exemplarydatafileEditField      matlab.ui.control.EditField
        exemplarydatadirButton          matlab.ui.control.Button
        DefineClusterButton             matlab.ui.control.Button
        DefineNetworkButton             matlab.ui.control.Button
        deletenetworkdefinitionsfromClusterstructButton  matlab.ui.control.Button
        DataimportTab                   matlab.ui.container.Tab
        g1dirdataimportButton           matlab.ui.control.Button
        g2dirdataimportButton           matlab.ui.control.Button
        g1dirdataimportListBox          matlab.ui.control.ListBox
        g2dirdataimportListBox          matlab.ui.control.ListBox
        rootdirgroup1EditField_2Label   matlab.ui.control.Label
        g1dirdataimportEditField        matlab.ui.control.EditField
        rootdirgroup2EditField_2Label   matlab.ui.control.Label
        g2dirdataimportEditField        matlab.ui.control.EditField
        subdirnameEditField_2Label      matlab.ui.control.Label
        dataimportsubdirnameEditField   matlab.ui.control.EditField
        OptionsforvoxelextractionLabel  matlab.ui.control.Label
        Panel                           matlab.ui.container.Panel
        extractallvoxelinClusterCheckBox  matlab.ui.control.CheckBox
        savedasClussteriYLabel          matlab.ui.control.Label
        Panel_2                         matlab.ui.container.Panel
        extractconditionalvoxelCheckBox  matlab.ui.control.CheckBox
        savedasClussteriYc1Label        matlab.ui.control.Label
        graymatterprobgreaterasEditFieldLabel  matlab.ui.control.Label
        graymatterprobgreaterasEditField  matlab.ui.control.NumericEditField
        whitematterproblessthenEditFieldLabel  matlab.ui.control.Label
        whitematterproblessthenEditField  matlab.ui.control.NumericEditField
        CSFproblessthenEditFieldLabel   matlab.ui.control.Label
        CSFproblessthenEditField        matlab.ui.control.NumericEditField
        graymatterfilenameEditFieldLabel  matlab.ui.control.Label
        graymatterfilenameEditField     matlab.ui.control.EditField
        whitematterfilenameEditFieldLabel  matlab.ui.control.Label
        whitematterfilenameEditField    matlab.ui.control.EditField
        csffilenameEditFieldLabel       matlab.ui.control.Label
        csffilenameEditField            matlab.ui.control.EditField
        Lamp                            matlab.ui.control.Lamp
        testforfilepresenceButton       matlab.ui.control.Button
        extract2conditionalvoxelCheckBox  matlab.ui.control.CheckBox
        graymatterprobgreaterasEditField_2Label  matlab.ui.control.Label
        graymatterprobgreateras2EditField  matlab.ui.control.NumericEditField
        whitematterproblessthenEditField_2Label  matlab.ui.control.Label
        whitematterproblessthen2EditField  matlab.ui.control.NumericEditField
        CSFproblessthenEditField_2Label  matlab.ui.control.Label
        CSFproblessthen2EditField       matlab.ui.control.NumericEditField
        savedasClussteriYc2Label        matlab.ui.control.Label
        GOButton                        matlab.ui.control.Button
        updatedataimportButton          matlab.ui.control.Button
        filefilterLabel                 matlab.ui.control.Label
        dataimportfilefilterEditField   matlab.ui.control.EditField
        DatapropertiesPanel             matlab.ui.container.Panel
        TRinsecEditFieldLabel           matlab.ui.control.Label
        TREditField                     matlab.ui.control.NumericEditField
        lpfEditFieldLabel               matlab.ui.control.Label
        lpfEditField                    matlab.ui.control.NumericEditField
        hpfEditFieldLabel               matlab.ui.control.Label
        hpfEditField                    matlab.ui.control.NumericEditField
        connectivityestimationTab       matlab.ui.container.Tab
        estimateconnectivityButton      matlab.ui.control.Button
        estimationoptionsPanel          matlab.ui.container.Panel
        Cluster2VoxelCheckBox           matlab.ui.control.CheckBox
        Cluster2ClusterCheckBox         matlab.ui.control.CheckBox
        Voxel2VoxelCheckBox             matlab.ui.control.CheckBox
        C1maskthresholdCheckBox         matlab.ui.control.CheckBox
        thresholdEditFieldLabel         matlab.ui.control.Label
        thresholdEditField              matlab.ui.control.NumericEditField
        smoothingCheckBox               matlab.ui.control.CheckBox
        kernelEditFieldLabel            matlab.ui.control.Label
        kernelEditField                 matlab.ui.control.EditField
        MethodsPanel                    matlab.ui.container.Panel
        synchronizationPanel            matlab.ui.container.Panel
        readmesynchronizationButton     matlab.ui.control.Button
        histogramEditField_2Label       matlab.ui.control.Label
        histogramsynchronizationEditField  matlab.ui.control.NumericEditField
        complexityPanel                 matlab.ui.container.Panel
        windowlengthEditFieldLabel      matlab.ui.control.Label
        windowlengthcomplexityEditField  matlab.ui.control.NumericEditField
        similaritymeasureEditFieldLabel  matlab.ui.control.Label
        similaritymeasurecomplexityEditField  matlab.ui.control.NumericEditField
        readmecomplexityButton          matlab.ui.control.Button
        transinformationPanel           matlab.ui.container.Panel
        readmetransinformationButton    matlab.ui.control.Button
        histogramEditFieldLabel         matlab.ui.control.Label
        histogramEditField              matlab.ui.control.NumericEditField
        timelagEditFieldLabel           matlab.ui.control.Label
        timelagEditField                matlab.ui.control.NumericEditField
        complexitySwitch                matlab.ui.control.ToggleSwitch
        correlationsPanel               matlab.ui.container.Panel
        coherencePanel                  matlab.ui.container.Panel
        readmecoherenceButton           matlab.ui.control.Button
        partialcoherencePanel           matlab.ui.container.Panel
        readmepartialcoherenceButton    matlab.ui.control.Button
        synchronizationSwitch           matlab.ui.control.ToggleSwitch
        transinformationSwitch          matlab.ui.control.ToggleSwitch
        partialcoherenceSwitch          matlab.ui.control.ToggleSwitch
        coherenceSwitch                 matlab.ui.control.ToggleSwitch
        correlationSwitch               matlab.ui.control.ToggleSwitch
        grangerSwitch                   matlab.ui.control.ToggleSwitch
        GrangercausalitybigPanel        matlab.ui.container.Panel
        GrangercausalityPanel           matlab.ui.container.Panel
        conditionalGCinthetimedomainCheckBox  matlab.ui.control.CheckBox
        additionalpreprocessingPanel    matlab.ui.container.Panel
        grangerdetrenddataCheckBox      matlab.ui.control.CheckBox
        grangerremovetemporalmeanCheckBox  matlab.ui.control.CheckBox
        grangerremovetemporalmeananddividebystdCheckBox  matlab.ui.control.CheckBox
        grangerdifferencingtimeseriesCheckBox  matlab.ui.control.CheckBox
        iterationEditFieldLabel         matlab.ui.control.Label
        grangeriterationEditField       matlab.ui.control.NumericEditField
        readmegrangerpreprocessingButton  matlab.ui.control.Button
        estimategrangerautonomyCheckBox  matlab.ui.control.CheckBox
        conditionalGCinfrequencydomainCheckBox  matlab.ui.control.CheckBox
        readmegrangerpreprocessingButton_2  matlab.ui.control.Button
        CGCtimeparameterPanel           matlab.ui.container.Panel
        numberoflagsEditFieldLabel      matlab.ui.control.Label
        grangernumberoflagsEditField    matlab.ui.control.NumericEditField
        pEditFieldLabel                 matlab.ui.control.Label
        grangerpEditField               matlab.ui.control.NumericEditField
        frequencyparameterPanel         matlab.ui.container.Panel
        frequencyiterationstepEditFieldLabel  matlab.ui.control.Label
        grangerfrequencyiterationstepEditField  matlab.ui.control.NumericEditField
        frequencyEditFieldLabel         matlab.ui.control.Label
        grangerfrequencyEditField       matlab.ui.control.EditField
        selectedClusterListBoxLabel     matlab.ui.control.Label
        grangerselectedClusterListBox   matlab.ui.control.ListBox
        usedataPanel                    matlab.ui.container.Panel
        conuseYCheckBox                 matlab.ui.control.CheckBox
        conuseYc1CheckBox               matlab.ui.control.CheckBox
        conuseYc2CheckBox               matlab.ui.control.CheckBox
        sbgrangercausalityPanel         matlab.ui.container.Panel
        triallengthimagesLabel          matlab.ui.control.Label
        sb_gc_TRIAL_LENGTH              matlab.ui.control.NumericEditField
        sb_gc_switch                    matlab.ui.control.ToggleSwitch
        datareductionTab                matlab.ui.container.Tab
        deleteifpossiblePanel           matlab.ui.container.Panel
        YCheckBox                       matlab.ui.control.CheckBox
        Yc1CheckBox                     matlab.ui.control.CheckBox
        Yc2CheckBox                     matlab.ui.control.CheckBox
        newprefixforClustermatfilesEditFieldLabel  matlab.ui.control.Label
        newprefixforClustermatfilesEditField  matlab.ui.control.EditField
        reduceClusterdataButton         matlab.ui.control.Button
        ExplanationTextAreaLabel        matlab.ui.control.Label
        ExplanationTextArea             matlab.ui.control.TextArea
        visualizationTab                matlab.ui.container.Tab
        TabGroup2                       matlab.ui.container.TabGroup
        Cluster2Cluster                 matlab.ui.container.Tab
        loadeddataPanel                 matlab.ui.container.Panel
        C2CloaddataButton               matlab.ui.control.Button
        C2CloaddataLamp                 matlab.ui.control.Lamp
        group1ListBoxLabel              matlab.ui.control.Label
        C2Cgroup1ListBox                matlab.ui.control.ListBox
        group2ListBoxLabel              matlab.ui.control.Label
        C2Cgroup2ListBox                matlab.ui.control.ListBox
        C2CnormalizeCheckBox            matlab.ui.control.CheckBox
        C2CestimateClusterstatisticButton  matlab.ui.control.Button
        C2CstatisticButtonGroup         matlab.ui.container.ButtonGroup
        C2CtwosampleButton              matlab.ui.control.ToggleButton
        C2CpairedButton                 matlab.ui.control.ToggleButton
        C2CestimatedataLamp             matlab.ui.control.Lamp
        C2CDatatouseButtonGroup         matlab.ui.container.ButtonGroup
        C2CYButton                      matlab.ui.control.RadioButton
        C2CYc1Button                    matlab.ui.control.RadioButton
        C2CYc2Button                    matlab.ui.control.RadioButton
        C2CestimateClusterstatisticButton_2  matlab.ui.control.Button
        C2CloaddataButton_2             matlab.ui.control.Button
        C2CshownetworksButton           matlab.ui.control.Button
        BrainconnectivityPanel          matlab.ui.container.Panel
        C2CmeanZdiffButton              matlab.ui.control.Button
        C2CBCsigdiffButton              matlab.ui.control.Button
        BehaviorvsBrainconnectivitywithEXELdataPanel  matlab.ui.container.Panel
        xlscsvFileEditFieldLabel        matlab.ui.control.Label
        xlscsvFileEditField             matlab.ui.control.EditField
        C2CchooseexelfileButton         matlab.ui.control.Button
        C2CexelreadmeButton             matlab.ui.control.Button
        loadexelfileButton              matlab.ui.control.Button
        ExelvariablesListBoxLabel       matlab.ui.control.Label
        ExelvariablesListBox            matlab.ui.control.ListBox
        C2CestimatecorrelationButton    matlab.ui.control.Button
        visualizecorrelationButton      matlab.ui.control.Button
        C2CestimateexelcorrelationLamp  matlab.ui.control.Lamp
        C2CvisualizenetworkcorrelationButton  matlab.ui.control.Button
        C2CestimatenetworkcorrelationButton  matlab.ui.control.Button
        Cluster2Voxel                   matlab.ui.container.Tab
        Voxel2Voxel                     matlab.ui.container.Tab
        Cluster2Cluster_Granger         matlab.ui.container.Tab
        GlobalParameterPanel            matlab.ui.container.Panel
        resultsrootdirEditFieldLabel    matlab.ui.control.Label
        resultsdirEditField             matlab.ui.control.EditField
        Buttonchooseresultsdir          matlab.ui.control.Button
        Buttonchooseg1dir               matlab.ui.control.Button
        group1dirEditFieldLabel         matlab.ui.control.Label
        g1dirEditField                  matlab.ui.control.EditField
        chooseg2dir                     matlab.ui.control.Button
        group2dirEditFieldLabel         matlab.ui.control.Label
        g2dirEditField                  matlab.ui.control.EditField
        loadlastButton                  matlab.ui.control.Button
        loadButton                      matlab.ui.control.Button
        saveButton                      matlab.ui.control.Button
        MultiprocessoroptionsCheckBox   matlab.ui.control.CheckBox
        initnewButton                   matlab.ui.control.Button
        idleGaugeLabel                  matlab.ui.control.Label
        idleGauge                       matlab.ui.control.LinearGauge
        loadnewsbButton                 matlab.ui.control.Button
        savenewsbButton                 matlab.ui.control.Button
        g1ListBox                       matlab.ui.control.ListBox
        g2ListBox                       matlab.ui.control.ListBox
        group1directoryLabel            matlab.ui.control.Label
        group2directoryLabel            matlab.ui.control.Label
        updateButton                    matlab.ui.control.Button
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
        
       
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Buttonchooseg1dir
        function Buttonchooseg1dirPushed(app, event)
            p = uigetdir('Select  dir for Clusterdata of group 1');
            app.g1dirEditField.Value = p;
        end

        % Button pushed function: Buttonchooseresultsdir
        function ButtonchooseresultsdirPushed(app, event)
            p = uigetdir('Select root dir for results and Cluster struct');
            app.resultsdirEditField.Value = p;
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

        % Button pushed function: chooseg2dir
        function chooseg2dirButtonPushed(app, event)
            ck_rc3('chooseg2dir', app);
        end

        % Value changed function: coherenceSwitch
        function coherenceSwitchValueChanged(app, event)
            value = str2num(app.coherenceSwitch.Value);
            if value
                app.coherencePanel.BackgroundColor = 'green';
            else
                app.coherencePanel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Value changed function: complexitySwitch
        function complexitySwitchValueChanged(app, event)
            value = str2num(app.complexitySwitch.Value);
            if value
                app.complexityPanel.BackgroundColor = 'green';
            else
                app.complexityPanel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Value changed function: correlationSwitch
        function correlationSwitchValueChanged(app, event)
            value = str2num(app.correlationSwitch.Value);
            if value
                app.correlationsPanel.BackgroundColor = 'green';
            else
                app.correlationsPanel.BackgroundColor = [0.94 0.94 0.94];
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
            app.exemplarydatafileEditField.Value = fullfile(p,f);
        end

        % Button pushed function: g1dirdataimportButton
        function g1dirdataimportButtonPushed(app, event)
            p = uigetdir('Select root dir for data of group 2');
            app.g1dirdataimportEditField.Value = p; 
        end

        % Button pushed function: g2dirdataimportButton
        function g2dirdataimportButtonPushed(app, event)
            p = uigetdir('Select root dir for data of group 2');
            app.g2dirdataimportEditField.Value = p; 
        end

        % Value changed function: grangerSwitch
        function grangerSwitchValueChanged(app, event)
            value = str2num(app.grangerSwitch.Value);
            if value
                app.GrangercausalitybigPanel.BackgroundColor = 'green';
                app.GrangercausalityPanel.BackgroundColor = 'green';
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
                app.GrangercausalityPanel.BackgroundColor = [0.94 0.94 0.94];
                app.GrangercausalitybigPanel.BackgroundColor = [0.94 0.94 0.94];
            end            
        end

        % Button pushed function: initnewButton
        function initnewButtonPushed(app, event)
            ck_rc3('initnew', app);
                
            
        end

        % Button pushed function: loadButton
        function loadButtonPushed(app, event)
            ck_rc3('loadButton', app);
        end

        % Button pushed function: loadexelfileButton
        function loadexelfileButtonPushed(app, event)
            ck_rc3('loadexelfile', app);
%            
        end

        % Button pushed function: loadlastButton
        function loadlastButtonPushed(app, event)
            %ie: ck_rc3('loadlastButton', app);
        end

        % Value changed function: partialcoherenceSwitch
        function partialcoherenceSwitchValueChanged(app, event)
            value = str2num(app.partialcoherenceSwitch.Value);
            if value
                app.partialcoherencePanel.BackgroundColor = 'green';
            else
                app.partialcoherencePanel.BackgroundColor = [0.94 0.94 0.94];
            end
            
        end

        % Button pushed function: reduceClusterdataButton
        function reduceClusterdataButtonPushed(app, event)
            ck_rc3('reduceClusterdata', app);
            
            
        end

        % Button pushed function: saveButton
        function saveButtonPushed(app, event)
            ck_rc3('saveButton', app);
            
            
        end

        % Value changed function: synchronizationSwitch
        function synchronizationSwitchValueChanged(app, event)
            value = str2num(app.synchronizationSwitch.Value);
            if value
                app.synchronizationPanel.BackgroundColor = 'green';
            else
                app.synchronizationPanel.BackgroundColor = [0.94 0.94 0.94];
            end
        end

        % Button pushed function: testforfilepresenceButton
        function testforfilepresenceButtonPushed(app, event)
            ck_rc3('testforfilepresence', app);
        end

        % Value changed function: transinformationSwitch
        function transinformationSwitchValueChanged(app, event)
            value = str2num(app.transinformationSwitch.Value);
            
            if value
                app.transinformationPanel.BackgroundColor = 'green';
            else
                app.transinformationPanel.BackgroundColor = [0.94 0.94 0.94];
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

        % Button pushed function: loadnewsbButton
        function loadnewsbButtonPushed(app, event)
            ck_rc3('load_new', app);
        end

        % Button pushed function: savenewsbButton
        function savenewsbButtonPushed(app, event)
            ck_rc3('save_new', app);
        end

        % Value changed function: sb_gc_switch
        function sb_gc_switchValueChanged(app, event)
            value = str2num(app.sb_gc_switch.Value);
            if value
                app.sbgrangercausalityPanel.BackgroundColor = 'green';
            else
                app.sbgrangercausalityPanel.BackgroundColor = [0.94 0.94 0.94];
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1658 1106];
            app.UIFigure.Name = 'UI Figure';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [518 40 1055 1053];

            % Create ClusterDefinitionTab
            app.ClusterDefinitionTab = uitab(app.TabGroup);
            app.ClusterDefinitionTab.Title = 'Cluster Definition';

            % Create exemplarydatafileLabel
            app.exemplarydatafileLabel = uilabel(app.ClusterDefinitionTab);
            app.exemplarydatafileLabel.HorizontalAlignment = 'right';
            app.exemplarydatafileLabel.VerticalAlignment = 'top';
            app.exemplarydatafileLabel.Position = [34 959 108 15];
            app.exemplarydatafileLabel.Text = 'exemplary data file';

            % Create exemplarydatafileEditField
            app.exemplarydatafileEditField = uieditfield(app.ClusterDefinitionTab, 'text');
            app.exemplarydatafileEditField.HorizontalAlignment = 'right';
            app.exemplarydatafileEditField.Position = [157 955 746 22];
            app.exemplarydatafileEditField.Value = 'H:\data_ck\Vesti\data\H_41W_HD_ID0072\filter_rs6\ffswuaf0010318407-0007-00250-000250-01.nii';

            % Create exemplarydatadirButton
            app.exemplarydatadirButton = uibutton(app.ClusterDefinitionTab, 'push');
            app.exemplarydatadirButton.ButtonPushedFcn = createCallbackFcn(app, @exemplarydatadirButtonPushed, true);
            app.exemplarydatadirButton.Position = [935 955 89 22];
            app.exemplarydatadirButton.Text = '...';

            % Create DefineClusterButton
            app.DefineClusterButton = uibutton(app.ClusterDefinitionTab, 'push');
            app.DefineClusterButton.ButtonPushedFcn = createCallbackFcn(app, @DefineClusterButtonPushed, true);
            app.DefineClusterButton.Position = [279 829 100 22];
            app.DefineClusterButton.Text = 'Define Cluster';

            % Create DefineNetworkButton
            app.DefineNetworkButton = uibutton(app.ClusterDefinitionTab, 'push');
            app.DefineNetworkButton.ButtonPushedFcn = createCallbackFcn(app, @DefineNetworkButtonPushed, true);
            app.DefineNetworkButton.Position = [368 670 100 22];
            app.DefineNetworkButton.Text = 'Define Network';

            % Create deletenetworkdefinitionsfromClusterstructButton
            app.deletenetworkdefinitionsfromClusterstructButton = uibutton(app.ClusterDefinitionTab, 'push');
            app.deletenetworkdefinitionsfromClusterstructButton.ButtonPushedFcn = createCallbackFcn(app, @deletenetworkdefinitionsfromClusterstructButtonPushed, true);
            app.deletenetworkdefinitionsfromClusterstructButton.Position = [439 829 258 22];
            app.deletenetworkdefinitionsfromClusterstructButton.Text = 'delete network definitions from Cluster struct';

            % Create DataimportTab
            app.DataimportTab = uitab(app.TabGroup);
            app.DataimportTab.Title = 'Data import';

            % Create g1dirdataimportButton
            app.g1dirdataimportButton = uibutton(app.DataimportTab, 'push');
            app.g1dirdataimportButton.ButtonPushedFcn = createCallbackFcn(app, @g1dirdataimportButtonPushed, true);
            app.g1dirdataimportButton.Position = [218 964 32 22];
            app.g1dirdataimportButton.Text = '...';

            % Create g2dirdataimportButton
            app.g2dirdataimportButton = uibutton(app.DataimportTab, 'push');
            app.g2dirdataimportButton.ButtonPushedFcn = createCallbackFcn(app, @g2dirdataimportButtonPushed, true);
            app.g2dirdataimportButton.Position = [454 964 32 22];
            app.g2dirdataimportButton.Text = '...';

            % Create g1dirdataimportListBox
            app.g1dirdataimportListBox = uilistbox(app.DataimportTab);
            app.g1dirdataimportListBox.Multiselect = 'on';
            app.g1dirdataimportListBox.Position = [29 381 221 569];
            app.g1dirdataimportListBox.Value = {'Item 1'};

            % Create g2dirdataimportListBox
            app.g2dirdataimportListBox = uilistbox(app.DataimportTab);
            app.g2dirdataimportListBox.Multiselect = 'on';
            app.g2dirdataimportListBox.Position = [267 381 219 569];
            app.g2dirdataimportListBox.Value = {'Item 1'};

            % Create rootdirgroup1EditField_2Label
            app.rootdirgroup1EditField_2Label = uilabel(app.DataimportTab);
            app.rootdirgroup1EditField_2Label.HorizontalAlignment = 'right';
            app.rootdirgroup1EditField_2Label.VerticalAlignment = 'top';
            app.rootdirgroup1EditField_2Label.Position = [92 992 88 15];
            app.rootdirgroup1EditField_2Label.Text = 'root dir group 1';

            % Create g1dirdataimportEditField
            app.g1dirdataimportEditField = uieditfield(app.DataimportTab, 'text');
            app.g1dirdataimportEditField.Position = [29 964 183 22];
            app.g1dirdataimportEditField.Value = 'H:\data_ck\Vesti\data';

            % Create rootdirgroup2EditField_2Label
            app.rootdirgroup2EditField_2Label = uilabel(app.DataimportTab);
            app.rootdirgroup2EditField_2Label.HorizontalAlignment = 'right';
            app.rootdirgroup2EditField_2Label.VerticalAlignment = 'top';
            app.rootdirgroup2EditField_2Label.Position = [316 993 88 15];
            app.rootdirgroup2EditField_2Label.Text = 'root dir group 2';

            % Create g2dirdataimportEditField
            app.g2dirdataimportEditField = uieditfield(app.DataimportTab, 'text');
            app.g2dirdataimportEditField.Position = [276 964 167 22];
            app.g2dirdataimportEditField.Value = 'H:\data_ck\Vesti\data';

            % Create subdirnameEditField_2Label
            app.subdirnameEditField_2Label = uilabel(app.DataimportTab);
            app.subdirnameEditField_2Label.HorizontalAlignment = 'right';
            app.subdirnameEditField_2Label.VerticalAlignment = 'top';
            app.subdirnameEditField_2Label.Position = [127 341 73 15];
            app.subdirnameEditField_2Label.Text = 'subdir name';

            % Create dataimportsubdirnameEditField
            app.dataimportsubdirnameEditField = uieditfield(app.DataimportTab, 'text');
            app.dataimportsubdirnameEditField.Position = [207 337 175 22];
            app.dataimportsubdirnameEditField.Value = 'filter_rs6';

            % Create OptionsforvoxelextractionLabel
            app.OptionsforvoxelextractionLabel = uilabel(app.DataimportTab);
            app.OptionsforvoxelextractionLabel.VerticalAlignment = 'top';
            app.OptionsforvoxelextractionLabel.FontSize = 24;
            app.OptionsforvoxelextractionLabel.Position = [567 915 300 31];
            app.OptionsforvoxelextractionLabel.Text = 'Options for voxel extraction';

            % Create Panel
            app.Panel = uipanel(app.DataimportTab);
            app.Panel.Title = 'unconditional cluster extraction (all voxel given by the Clusterdefinition)';
            app.Panel.Position = [500 837 539 60];

            % Create extractallvoxelinClusterCheckBox
            app.extractallvoxelinClusterCheckBox = uicheckbox(app.Panel);
            app.extractallvoxelinClusterCheckBox.Text = 'extract all voxel in Cluster';
            app.extractallvoxelinClusterCheckBox.Position = [35 11 161 15];
            app.extractallvoxelinClusterCheckBox.Value = true;

            % Create savedasClussteriYLabel
            app.savedasClussteriYLabel = uilabel(app.Panel);
            app.savedasClussteriYLabel.VerticalAlignment = 'top';
            app.savedasClussteriYLabel.Position = [266 11 124 15];
            app.savedasClussteriYLabel.Text = 'saved as Clusster{i}.Y';

            % Create Panel_2
            app.Panel_2 = uipanel(app.DataimportTab);
            app.Panel_2.Title = 'conditional cluster extraction (only voxel were extractat which meet the following individ. criteria)';
            app.Panel_2.Position = [500 451 539 363];

            % Create extractconditionalvoxelCheckBox
            app.extractconditionalvoxelCheckBox = uicheckbox(app.Panel_2);
            app.extractconditionalvoxelCheckBox.Text = 'extract conditional voxel';
            app.extractconditionalvoxelCheckBox.Position = [18 297 153 15];
            app.extractconditionalvoxelCheckBox.Value = true;

            % Create savedasClussteriYc1Label
            app.savedasClussteriYc1Label = uilabel(app.Panel_2);
            app.savedasClussteriYc1Label.VerticalAlignment = 'top';
            app.savedasClussteriYc1Label.Position = [41 266 137 15];
            app.savedasClussteriYc1Label.Text = 'saved as Clusster{i}.Yc1';

            % Create graymatterprobgreaterasEditFieldLabel
            app.graymatterprobgreaterasEditFieldLabel = uilabel(app.Panel_2);
            app.graymatterprobgreaterasEditFieldLabel.HorizontalAlignment = 'right';
            app.graymatterprobgreaterasEditFieldLabel.VerticalAlignment = 'top';
            app.graymatterprobgreaterasEditFieldLabel.Position = [18 232 155 15];
            app.graymatterprobgreaterasEditFieldLabel.Text = 'gray matter prob. greater as';

            % Create graymatterprobgreaterasEditField
            app.graymatterprobgreaterasEditField = uieditfield(app.Panel_2, 'numeric');
            app.graymatterprobgreaterasEditField.Position = [182 228 40 22];
            app.graymatterprobgreaterasEditField.Value = 0.1;

            % Create whitematterproblessthenEditFieldLabel
            app.whitematterproblessthenEditFieldLabel = uilabel(app.Panel_2);
            app.whitematterproblessthenEditFieldLabel.HorizontalAlignment = 'right';
            app.whitematterproblessthenEditFieldLabel.VerticalAlignment = 'top';
            app.whitematterproblessthenEditFieldLabel.Position = [19 194 154 15];
            app.whitematterproblessthenEditFieldLabel.Text = 'white matter prob. less then';

            % Create whitematterproblessthenEditField
            app.whitematterproblessthenEditField = uieditfield(app.Panel_2, 'numeric');
            app.whitematterproblessthenEditField.Position = [182 190 40 22];
            app.whitematterproblessthenEditField.Value = 0.9;

            % Create CSFproblessthenEditFieldLabel
            app.CSFproblessthenEditFieldLabel = uilabel(app.Panel_2);
            app.CSFproblessthenEditFieldLabel.HorizontalAlignment = 'right';
            app.CSFproblessthenEditFieldLabel.VerticalAlignment = 'top';
            app.CSFproblessthenEditFieldLabel.Position = [61 157 112 15];
            app.CSFproblessthenEditFieldLabel.Text = 'CSF prob. less then';

            % Create CSFproblessthenEditField
            app.CSFproblessthenEditField = uieditfield(app.Panel_2, 'numeric');
            app.CSFproblessthenEditField.Position = [182 153 40 22];
            app.CSFproblessthenEditField.Value = 0.9;

            % Create graymatterfilenameEditFieldLabel
            app.graymatterfilenameEditFieldLabel = uilabel(app.Panel_2);
            app.graymatterfilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.graymatterfilenameEditFieldLabel.VerticalAlignment = 'top';
            app.graymatterfilenameEditFieldLabel.Position = [164 117 119 15];
            app.graymatterfilenameEditFieldLabel.Text = 'gray matter file name';

            % Create graymatterfilenameEditField
            app.graymatterfilenameEditField = uieditfield(app.Panel_2, 'text');
            app.graymatterfilenameEditField.Position = [298 113 100 22];
            app.graymatterfilenameEditField.Value = 'rc1_file.nii';

            % Create whitematterfilenameEditFieldLabel
            app.whitematterfilenameEditFieldLabel = uilabel(app.Panel_2);
            app.whitematterfilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.whitematterfilenameEditFieldLabel.VerticalAlignment = 'top';
            app.whitematterfilenameEditFieldLabel.Position = [159 79 124 15];
            app.whitematterfilenameEditFieldLabel.Text = 'white matter file name';

            % Create whitematterfilenameEditField
            app.whitematterfilenameEditField = uieditfield(app.Panel_2, 'text');
            app.whitematterfilenameEditField.Position = [298 75 100 22];
            app.whitematterfilenameEditField.Value = 'rc2_file.nii';

            % Create csffilenameEditFieldLabel
            app.csffilenameEditFieldLabel = uilabel(app.Panel_2);
            app.csffilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.csffilenameEditFieldLabel.VerticalAlignment = 'top';
            app.csffilenameEditFieldLabel.Position = [210 42 73 15];
            app.csffilenameEditFieldLabel.Text = 'csf file name';

            % Create csffilenameEditField
            app.csffilenameEditField = uieditfield(app.Panel_2, 'text');
            app.csffilenameEditField.Position = [298 38 100 22];
            app.csffilenameEditField.Value = 'rc3_file.nii';

            % Create Lamp
            app.Lamp = uilamp(app.Panel_2);
            app.Lamp.Position = [503 12 15 15];
            app.Lamp.Color = [1 0 0];

            % Create testforfilepresenceButton
            app.testforfilepresenceButton = uibutton(app.Panel_2, 'push');
            app.testforfilepresenceButton.ButtonPushedFcn = createCallbackFcn(app, @testforfilepresenceButtonPushed, true);
            app.testforfilepresenceButton.Position = [367 9 124 22];
            app.testforfilepresenceButton.Text = 'test for file presence';

            % Create extract2conditionalvoxelCheckBox
            app.extract2conditionalvoxelCheckBox = uicheckbox(app.Panel_2);
            app.extract2conditionalvoxelCheckBox.Text = 'extract 2. conditional voxel';
            app.extract2conditionalvoxelCheckBox.Position = [288 294 166 15];
            app.extract2conditionalvoxelCheckBox.Value = true;

            % Create graymatterprobgreaterasEditField_2Label
            app.graymatterprobgreaterasEditField_2Label = uilabel(app.Panel_2);
            app.graymatterprobgreaterasEditField_2Label.HorizontalAlignment = 'right';
            app.graymatterprobgreaterasEditField_2Label.VerticalAlignment = 'top';
            app.graymatterprobgreaterasEditField_2Label.Position = [287 232 155 15];
            app.graymatterprobgreaterasEditField_2Label.Text = 'gray matter prob. greater as';

            % Create graymatterprobgreateras2EditField
            app.graymatterprobgreateras2EditField = uieditfield(app.Panel_2, 'numeric');
            app.graymatterprobgreateras2EditField.Position = [451 228 40 22];
            app.graymatterprobgreateras2EditField.Value = 0.4;

            % Create whitematterproblessthenEditField_2Label
            app.whitematterproblessthenEditField_2Label = uilabel(app.Panel_2);
            app.whitematterproblessthenEditField_2Label.HorizontalAlignment = 'right';
            app.whitematterproblessthenEditField_2Label.VerticalAlignment = 'top';
            app.whitematterproblessthenEditField_2Label.Position = [288 194 154 15];
            app.whitematterproblessthenEditField_2Label.Text = 'white matter prob. less then';

            % Create whitematterproblessthen2EditField
            app.whitematterproblessthen2EditField = uieditfield(app.Panel_2, 'numeric');
            app.whitematterproblessthen2EditField.Position = [451 190 40 22];
            app.whitematterproblessthen2EditField.Value = 0.2;

            % Create CSFproblessthenEditField_2Label
            app.CSFproblessthenEditField_2Label = uilabel(app.Panel_2);
            app.CSFproblessthenEditField_2Label.HorizontalAlignment = 'right';
            app.CSFproblessthenEditField_2Label.VerticalAlignment = 'top';
            app.CSFproblessthenEditField_2Label.Position = [330 157 112 15];
            app.CSFproblessthenEditField_2Label.Text = 'CSF prob. less then';

            % Create CSFproblessthen2EditField
            app.CSFproblessthen2EditField = uieditfield(app.Panel_2, 'numeric');
            app.CSFproblessthen2EditField.Position = [451 153 40 22];
            app.CSFproblessthen2EditField.Value = 0.2;

            % Create savedasClussteriYc2Label
            app.savedasClussteriYc2Label = uilabel(app.Panel_2);
            app.savedasClussteriYc2Label.VerticalAlignment = 'top';
            app.savedasClussteriYc2Label.Position = [315 266 137 15];
            app.savedasClussteriYc2Label.Text = 'saved as Clusster{i}.Yc2';

            % Create GOButton
            app.GOButton = uibutton(app.DataimportTab, 'push');
            app.GOButton.ButtonPushedFcn = createCallbackFcn(app, @GOButtonPushed, true);
            app.GOButton.Position = [897 40 100 22];
            app.GOButton.Text = 'GO!';

            % Create updatedataimportButton
            app.updatedataimportButton = uibutton(app.DataimportTab, 'push');
            app.updatedataimportButton.ButtonPushedFcn = createCallbackFcn(app, @updatedataimportButtonPushed, true);
            app.updatedataimportButton.Position = [207 230 100 22];
            app.updatedataimportButton.Text = 'update';

            % Create filefilterLabel
            app.filefilterLabel = uilabel(app.DataimportTab);
            app.filefilterLabel.HorizontalAlignment = 'right';
            app.filefilterLabel.VerticalAlignment = 'top';
            app.filefilterLabel.Position = [158 305 44 15];
            app.filefilterLabel.Text = 'filefilter';

            % Create dataimportfilefilterEditField
            app.dataimportfilefilterEditField = uieditfield(app.DataimportTab, 'text');
            app.dataimportfilefilterEditField.Position = [209 301 175 22];
            app.dataimportfilefilterEditField.Value = 'ff*.nii';

            % Create DatapropertiesPanel
            app.DatapropertiesPanel = uipanel(app.DataimportTab);
            app.DatapropertiesPanel.Title = 'Data properties';
            app.DatapropertiesPanel.Position = [658 97 380 134];

            % Create TRinsecEditFieldLabel
            app.TRinsecEditFieldLabel = uilabel(app.DatapropertiesPanel);
            app.TRinsecEditFieldLabel.HorizontalAlignment = 'right';
            app.TRinsecEditFieldLabel.VerticalAlignment = 'top';
            app.TRinsecEditFieldLabel.Position = [33 81 56 15];
            app.TRinsecEditFieldLabel.Text = 'TR in sec';

            % Create TREditField
            app.TREditField = uieditfield(app.DatapropertiesPanel, 'numeric');
            app.TREditField.Position = [135 77 69 22];
            app.TREditField.Value = 1.9;

            % Create lpfEditFieldLabel
            app.lpfEditFieldLabel = uilabel(app.DatapropertiesPanel);
            app.lpfEditFieldLabel.HorizontalAlignment = 'right';
            app.lpfEditFieldLabel.VerticalAlignment = 'top';
            app.lpfEditFieldLabel.Position = [66 50 25 15];
            app.lpfEditFieldLabel.Text = 'lpf';

            % Create lpfEditField
            app.lpfEditField = uieditfield(app.DatapropertiesPanel, 'numeric');
            app.lpfEditField.Position = [137 46 69 22];
            app.lpfEditField.Value = 0.1;

            % Create hpfEditFieldLabel
            app.hpfEditFieldLabel = uilabel(app.DatapropertiesPanel);
            app.hpfEditFieldLabel.HorizontalAlignment = 'right';
            app.hpfEditFieldLabel.VerticalAlignment = 'top';
            app.hpfEditFieldLabel.Position = [66 19 25 15];
            app.hpfEditFieldLabel.Text = 'hpf';

            % Create hpfEditField
            app.hpfEditField = uieditfield(app.DatapropertiesPanel, 'numeric');
            app.hpfEditField.Position = [137 15 69 22];
            app.hpfEditField.Value = 0.01;

            % Create connectivityestimationTab
            app.connectivityestimationTab = uitab(app.TabGroup);
            app.connectivityestimationTab.Title = 'connectivity estimation';

            % Create estimateconnectivityButton
            app.estimateconnectivityButton = uibutton(app.connectivityestimationTab, 'push');
            app.estimateconnectivityButton.ButtonPushedFcn = createCallbackFcn(app, @estimateconnectivityButtonPushed, true);
            app.estimateconnectivityButton.Position = [906 35 128 22];
            app.estimateconnectivityButton.Text = 'estimate connectivity';

            % Create estimationoptionsPanel
            app.estimationoptionsPanel = uipanel(app.connectivityestimationTab);
            app.estimationoptionsPanel.Title = 'estimation options';
            app.estimationoptionsPanel.Position = [13 779 347 221];

            % Create Cluster2VoxelCheckBox
            app.Cluster2VoxelCheckBox = uicheckbox(app.estimationoptionsPanel);
            app.Cluster2VoxelCheckBox.Text = 'Cluster2Voxel';
            app.Cluster2VoxelCheckBox.Position = [42 156 98.34375 15];

            % Create Cluster2ClusterCheckBox
            app.Cluster2ClusterCheckBox = uicheckbox(app.estimationoptionsPanel);
            app.Cluster2ClusterCheckBox.Text = 'Cluster2Cluster';
            app.Cluster2ClusterCheckBox.Position = [42 55 107 15];
            app.Cluster2ClusterCheckBox.Value = true;

            % Create Voxel2VoxelCheckBox
            app.Voxel2VoxelCheckBox = uicheckbox(app.estimationoptionsPanel);
            app.Voxel2VoxelCheckBox.Text = 'Voxel2Voxel';
            app.Voxel2VoxelCheckBox.Position = [42 22 89.6875 15];

            % Create C1maskthresholdCheckBox
            app.C1maskthresholdCheckBox = uicheckbox(app.estimationoptionsPanel);
            app.C1maskthresholdCheckBox.Text = 'C1 mask threshold';
            app.C1maskthresholdCheckBox.Position = [63 128 124 15];

            % Create thresholdEditFieldLabel
            app.thresholdEditFieldLabel = uilabel(app.estimationoptionsPanel);
            app.thresholdEditFieldLabel.HorizontalAlignment = 'right';
            app.thresholdEditFieldLabel.VerticalAlignment = 'top';
            app.thresholdEditFieldLabel.Position = [211 128 56 15];
            app.thresholdEditFieldLabel.Text = 'threshold';

            % Create thresholdEditField
            app.thresholdEditField = uieditfield(app.estimationoptionsPanel, 'numeric');
            app.thresholdEditField.Position = [282 124 46 22];
            app.thresholdEditField.Value = 0.1;

            % Create smoothingCheckBox
            app.smoothingCheckBox = uicheckbox(app.estimationoptionsPanel);
            app.smoothingCheckBox.Text = 'smoothing';
            app.smoothingCheckBox.Position = [64 99 79 15];

            % Create kernelEditFieldLabel
            app.kernelEditFieldLabel = uilabel(app.estimationoptionsPanel);
            app.kernelEditFieldLabel.HorizontalAlignment = 'right';
            app.kernelEditFieldLabel.VerticalAlignment = 'top';
            app.kernelEditFieldLabel.Position = [174 98 39 15];
            app.kernelEditFieldLabel.Text = 'kernel';

            % Create kernelEditField
            app.kernelEditField = uieditfield(app.estimationoptionsPanel, 'text');
            app.kernelEditField.Position = [228 94 100 22];
            app.kernelEditField.Value = '[6 6 6]';

            % Create MethodsPanel
            app.MethodsPanel = uipanel(app.connectivityestimationTab);
            app.MethodsPanel.Title = 'Methods';
            app.MethodsPanel.Position = [405 507 629 493];

            % Create synchronizationPanel
            app.synchronizationPanel = uipanel(app.MethodsPanel);
            app.synchronizationPanel.Title = 'synchronization';
            app.synchronizationPanel.Position = [47 121 515 59];

            % Create readmesynchronizationButton
            app.readmesynchronizationButton = uibutton(app.synchronizationPanel, 'push');
            app.readmesynchronizationButton.Position = [448 6 56 22];
            app.readmesynchronizationButton.Text = 'readme';

            % Create histogramEditField_2Label
            app.histogramEditField_2Label = uilabel(app.synchronizationPanel);
            app.histogramEditField_2Label.HorizontalAlignment = 'right';
            app.histogramEditField_2Label.VerticalAlignment = 'top';
            app.histogramEditField_2Label.Position = [179 10 59 15];
            app.histogramEditField_2Label.Text = 'histogram';

            % Create histogramsynchronizationEditField
            app.histogramsynchronizationEditField = uieditfield(app.synchronizationPanel, 'numeric');
            app.histogramsynchronizationEditField.Position = [253 6 36 22];
            app.histogramsynchronizationEditField.Value = 4;

            % Create complexityPanel
            app.complexityPanel = uipanel(app.MethodsPanel);
            app.complexityPanel.Title = 'complexity';
            app.complexityPanel.Position = [47 7 515 100];

            % Create windowlengthEditFieldLabel
            app.windowlengthEditFieldLabel = uilabel(app.complexityPanel);
            app.windowlengthEditFieldLabel.HorizontalAlignment = 'right';
            app.windowlengthEditFieldLabel.VerticalAlignment = 'top';
            app.windowlengthEditFieldLabel.Position = [19 15 84 15];
            app.windowlengthEditFieldLabel.Text = 'window length';

            % Create windowlengthcomplexityEditField
            app.windowlengthcomplexityEditField = uieditfield(app.complexityPanel, 'numeric');
            app.windowlengthcomplexityEditField.Position = [118 11 44 22];
            app.windowlengthcomplexityEditField.Value = 5;

            % Create similaritymeasureEditFieldLabel
            app.similaritymeasureEditFieldLabel = uilabel(app.complexityPanel);
            app.similaritymeasureEditFieldLabel.HorizontalAlignment = 'right';
            app.similaritymeasureEditFieldLabel.VerticalAlignment = 'top';
            app.similaritymeasureEditFieldLabel.Position = [199 19 104 15];
            app.similaritymeasureEditFieldLabel.Text = 'similarity measure';

            % Create similaritymeasurecomplexityEditField
            app.similaritymeasurecomplexityEditField = uieditfield(app.complexityPanel, 'numeric');
            app.similaritymeasurecomplexityEditField.Position = [321 15 39 22];
            app.similaritymeasurecomplexityEditField.Value = 0.15;

            % Create readmecomplexityButton
            app.readmecomplexityButton = uibutton(app.complexityPanel, 'push');
            app.readmecomplexityButton.Position = [403 12 64 22];
            app.readmecomplexityButton.Text = 'readme';

            % Create transinformationPanel
            app.transinformationPanel = uipanel(app.MethodsPanel);
            app.transinformationPanel.Title = 'transinformation';
            app.transinformationPanel.Position = [47 193 515 80];

            % Create readmetransinformationButton
            app.readmetransinformationButton = uibutton(app.transinformationPanel, 'push');
            app.readmetransinformationButton.Position = [448 26 53 22];
            app.readmetransinformationButton.Text = 'readme';

            % Create histogramEditFieldLabel
            app.histogramEditFieldLabel = uilabel(app.transinformationPanel);
            app.histogramEditFieldLabel.HorizontalAlignment = 'right';
            app.histogramEditFieldLabel.VerticalAlignment = 'top';
            app.histogramEditFieldLabel.Position = [314 26 59 15];
            app.histogramEditFieldLabel.Text = 'histogram';

            % Create histogramEditField
            app.histogramEditField = uieditfield(app.transinformationPanel, 'numeric');
            app.histogramEditField.Position = [388 22 40 22];
            app.histogramEditField.Value = 4;

            % Create timelagEditFieldLabel
            app.timelagEditFieldLabel = uilabel(app.transinformationPanel);
            app.timelagEditFieldLabel.HorizontalAlignment = 'right';
            app.timelagEditFieldLabel.VerticalAlignment = 'top';
            app.timelagEditFieldLabel.Position = [184 26 48 15];
            app.timelagEditFieldLabel.Text = 'time lag';

            % Create timelagEditField
            app.timelagEditField = uieditfield(app.transinformationPanel, 'numeric');
            app.timelagEditField.Position = [247 22 44 22];
            app.timelagEditField.Value = 5;

            % Create complexitySwitch
            app.complexitySwitch = uiswitch(app.MethodsPanel, 'toggle');
            app.complexitySwitch.Items = {'0', '1'};
            app.complexitySwitch.ValueChangedFcn = createCallbackFcn(app, @complexitySwitchValueChanged, true);
            app.complexitySwitch.FontSize = 8;
            app.complexitySwitch.FontColor = [0.9412 0.9412 0.9412];
            app.complexitySwitch.Position = [14 32 20 45];
            app.complexitySwitch.Value = '0';

            % Create correlationsPanel
            app.correlationsPanel = uipanel(app.MethodsPanel);
            app.correlationsPanel.Title = 'correlations';
            app.correlationsPanel.Position = [47 411 515 48];

            % Create coherencePanel
            app.coherencePanel = uipanel(app.MethodsPanel);
            app.coherencePanel.Title = 'coherence';
            app.coherencePanel.Position = [47 343 515 63];

            % Create readmecoherenceButton
            app.readmecoherenceButton = uibutton(app.coherencePanel, 'push');
            app.readmecoherenceButton.Position = [171 14 53 22];
            app.readmecoherenceButton.Text = 'readme';

            % Create partialcoherencePanel
            app.partialcoherencePanel = uipanel(app.MethodsPanel);
            app.partialcoherencePanel.Title = 'partial coherence';
            app.partialcoherencePanel.Position = [47 291 515 45];

            % Create readmepartialcoherenceButton
            app.readmepartialcoherenceButton = uibutton(app.partialcoherencePanel, 'push');
            app.readmepartialcoherenceButton.Position = [327 3 53 22];
            app.readmepartialcoherenceButton.Text = 'readme';

            % Create synchronizationSwitch
            app.synchronizationSwitch = uiswitch(app.MethodsPanel, 'toggle');
            app.synchronizationSwitch.Items = {'0', '1'};
            app.synchronizationSwitch.ValueChangedFcn = createCallbackFcn(app, @synchronizationSwitchValueChanged, true);
            app.synchronizationSwitch.FontSize = 8;
            app.synchronizationSwitch.FontColor = [0.9412 0.9412 0.9412];
            app.synchronizationSwitch.Position = [14 128 20 45];
            app.synchronizationSwitch.Value = '0';

            % Create transinformationSwitch
            app.transinformationSwitch = uiswitch(app.MethodsPanel, 'toggle');
            app.transinformationSwitch.Items = {'0', '1'};
            app.transinformationSwitch.ValueChangedFcn = createCallbackFcn(app, @transinformationSwitchValueChanged, true);
            app.transinformationSwitch.FontSize = 8;
            app.transinformationSwitch.FontColor = [0.9412 0.9412 0.9412];
            app.transinformationSwitch.Position = [14 209 20 45];
            app.transinformationSwitch.Value = '0';

            % Create partialcoherenceSwitch
            app.partialcoherenceSwitch = uiswitch(app.MethodsPanel, 'toggle');
            app.partialcoherenceSwitch.Items = {'0', '1'};
            app.partialcoherenceSwitch.ValueChangedFcn = createCallbackFcn(app, @partialcoherenceSwitchValueChanged, true);
            app.partialcoherenceSwitch.Enable = 'off';
            app.partialcoherenceSwitch.FontSize = 8;
            app.partialcoherenceSwitch.FontColor = [0.9412 0.9412 0.9412];
            app.partialcoherenceSwitch.Position = [14 289 20 45];
            app.partialcoherenceSwitch.Value = '0';

            % Create coherenceSwitch
            app.coherenceSwitch = uiswitch(app.MethodsPanel, 'toggle');
            app.coherenceSwitch.Items = {'0', '1'};
            app.coherenceSwitch.ValueChangedFcn = createCallbackFcn(app, @coherenceSwitchValueChanged, true);
            app.coherenceSwitch.FontSize = 8;
            app.coherenceSwitch.FontColor = [0.9412 0.9412 0.9412];
            app.coherenceSwitch.Position = [14 348 20 45];
            app.coherenceSwitch.Value = '0';

            % Create correlationSwitch
            app.correlationSwitch = uiswitch(app.MethodsPanel, 'toggle');
            app.correlationSwitch.Items = {'0', '1'};
            app.correlationSwitch.ValueChangedFcn = createCallbackFcn(app, @correlationSwitchValueChanged, true);
            app.correlationSwitch.FontSize = 8;
            app.correlationSwitch.FontColor = [0.9412 0.9412 0.9412];
            app.correlationSwitch.Position = [14 413 20 45];
            app.correlationSwitch.Value = '0';

            % Create grangerSwitch
            app.grangerSwitch = uiswitch(app.connectivityestimationTab, 'toggle');
            app.grangerSwitch.Items = {'0', '1'};
            app.grangerSwitch.ValueChangedFcn = createCallbackFcn(app, @grangerSwitchValueChanged, true);
            app.grangerSwitch.Enable = 'off';
            app.grangerSwitch.FontSize = 8;
            app.grangerSwitch.FontColor = [0.9412 0.9412 0.9412];
            app.grangerSwitch.Position = [25 391 20 45];
            app.grangerSwitch.Value = '0';

            % Create GrangercausalitybigPanel
            app.GrangercausalitybigPanel = uipanel(app.connectivityestimationTab);
            app.GrangercausalitybigPanel.Title = 'Granger causality';
            app.GrangercausalitybigPanel.Position = [75 85 892 386];

            % Create GrangercausalityPanel
            app.GrangercausalityPanel = uipanel(app.GrangercausalitybigPanel);
            app.GrangercausalityPanel.Title = 'Granger causality';
            app.GrangercausalityPanel.Position = [234 21 644 319];

            % Create conditionalGCinthetimedomainCheckBox
            app.conditionalGCinthetimedomainCheckBox = uicheckbox(app.GrangercausalityPanel);
            app.conditionalGCinthetimedomainCheckBox.Text = 'conditional GC in the time domain';
            app.conditionalGCinthetimedomainCheckBox.Position = [26 156 207 15];

            % Create additionalpreprocessingPanel
            app.additionalpreprocessingPanel = uipanel(app.GrangercausalityPanel);
            app.additionalpreprocessingPanel.Title = 'additional preprocessing';
            app.additionalpreprocessingPanel.Position = [12 190 615 102];

            % Create grangerdetrenddataCheckBox
            app.grangerdetrenddataCheckBox = uicheckbox(app.additionalpreprocessingPanel);
            app.grangerdetrenddataCheckBox.Text = 'detrend data';
            app.grangerdetrenddataCheckBox.Position = [17 54 91 15];

            % Create grangerremovetemporalmeanCheckBox
            app.grangerremovetemporalmeanCheckBox = uicheckbox(app.additionalpreprocessingPanel);
            app.grangerremovetemporalmeanCheckBox.Text = 'remove temporal mean';
            app.grangerremovetemporalmeanCheckBox.Position = [17 25 148 15];

            % Create grangerremovetemporalmeananddividebystdCheckBox
            app.grangerremovetemporalmeananddividebystdCheckBox = uicheckbox(app.additionalpreprocessingPanel);
            app.grangerremovetemporalmeananddividebystdCheckBox.Text = 'remove temporal mean and divide by std';
            app.grangerremovetemporalmeananddividebystdCheckBox.Position = [259 54 245 15];

            % Create grangerdifferencingtimeseriesCheckBox
            app.grangerdifferencingtimeseriesCheckBox = uicheckbox(app.additionalpreprocessingPanel);
            app.grangerdifferencingtimeseriesCheckBox.Text = 'differencing time series';
            app.grangerdifferencingtimeseriesCheckBox.Position = [259 25 147.796875 15];

            % Create iterationEditFieldLabel
            app.iterationEditFieldLabel = uilabel(app.additionalpreprocessingPanel);
            app.iterationEditFieldLabel.HorizontalAlignment = 'right';
            app.iterationEditFieldLabel.VerticalAlignment = 'top';
            app.iterationEditFieldLabel.Position = [484 22 49 15];
            app.iterationEditFieldLabel.Text = 'iteration';

            % Create grangeriterationEditField
            app.grangeriterationEditField = uieditfield(app.additionalpreprocessingPanel, 'numeric');
            app.grangeriterationEditField.Position = [548 18 32 22];
            app.grangeriterationEditField.Value = 1;

            % Create readmegrangerpreprocessingButton
            app.readmegrangerpreprocessingButton = uibutton(app.additionalpreprocessingPanel, 'push');
            app.readmegrangerpreprocessingButton.Position = [527 50 71 22];
            app.readmegrangerpreprocessingButton.Text = 'readme';

            % Create estimategrangerautonomyCheckBox
            app.estimategrangerautonomyCheckBox = uicheckbox(app.GrangercausalityPanel);
            app.estimategrangerautonomyCheckBox.Text = 'estimate granger autonomy';
            app.estimategrangerautonomyCheckBox.Position = [27 131 171 15];

            % Create conditionalGCinfrequencydomainCheckBox
            app.conditionalGCinfrequencydomainCheckBox = uicheckbox(app.GrangercausalityPanel);
            app.conditionalGCinfrequencydomainCheckBox.Text = 'conditional GC in frequency domain';
            app.conditionalGCinfrequencydomainCheckBox.Position = [340 131 218 15];

            % Create readmegrangerpreprocessingButton_2
            app.readmegrangerpreprocessingButton_2 = uibutton(app.GrangercausalityPanel, 'push');
            app.readmegrangerpreprocessingButton_2.Position = [399 12 100 22];
            app.readmegrangerpreprocessingButton_2.Text = 'readme';

            % Create CGCtimeparameterPanel
            app.CGCtimeparameterPanel = uipanel(app.GrangercausalityPanel);
            app.CGCtimeparameterPanel.Title = 'CGC time parameter';
            app.CGCtimeparameterPanel.Position = [34 42 264 82];

            % Create numberoflagsEditFieldLabel
            app.numberoflagsEditFieldLabel = uilabel(app.CGCtimeparameterPanel);
            app.numberoflagsEditFieldLabel.HorizontalAlignment = 'right';
            app.numberoflagsEditFieldLabel.VerticalAlignment = 'top';
            app.numberoflagsEditFieldLabel.Position = [24 38 86 15];
            app.numberoflagsEditFieldLabel.Text = 'number of lags';

            % Create grangernumberoflagsEditField
            app.grangernumberoflagsEditField = uieditfield(app.CGCtimeparameterPanel, 'numeric');
            app.grangernumberoflagsEditField.Position = [127 34 37 22];
            app.grangernumberoflagsEditField.Value = 1;

            % Create pEditFieldLabel
            app.pEditFieldLabel = uilabel(app.CGCtimeparameterPanel);
            app.pEditFieldLabel.HorizontalAlignment = 'right';
            app.pEditFieldLabel.VerticalAlignment = 'top';
            app.pEditFieldLabel.Position = [86 10 25 15];
            app.pEditFieldLabel.Text = 'p =';

            % Create grangerpEditField
            app.grangerpEditField = uieditfield(app.CGCtimeparameterPanel, 'numeric');
            app.grangerpEditField.Position = [128 6 37 22];
            app.grangerpEditField.Value = 0.05;

            % Create frequencyparameterPanel
            app.frequencyparameterPanel = uipanel(app.GrangercausalityPanel);
            app.frequencyparameterPanel.Title = 'frequency parameter';
            app.frequencyparameterPanel.Position = [327 42 231 82];

            % Create frequencyiterationstepEditFieldLabel
            app.frequencyiterationstepEditFieldLabel = uilabel(app.frequencyparameterPanel);
            app.frequencyiterationstepEditFieldLabel.HorizontalAlignment = 'right';
            app.frequencyiterationstepEditFieldLabel.VerticalAlignment = 'top';
            app.frequencyiterationstepEditFieldLabel.Position = [11 38 132 15];
            app.frequencyiterationstepEditFieldLabel.Text = 'frequency iteration step';

            % Create grangerfrequencyiterationstepEditField
            app.grangerfrequencyiterationstepEditField = uieditfield(app.frequencyparameterPanel, 'numeric');
            app.grangerfrequencyiterationstepEditField.Position = [155 34 44 22];
            app.grangerfrequencyiterationstepEditField.Value = 0.01;

            % Create frequencyEditFieldLabel
            app.frequencyEditFieldLabel = uilabel(app.frequencyparameterPanel);
            app.frequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.frequencyEditFieldLabel.VerticalAlignment = 'top';
            app.frequencyEditFieldLabel.Position = [47 10 59 15];
            app.frequencyEditFieldLabel.Text = 'frequency';

            % Create grangerfrequencyEditField
            app.grangerfrequencyEditField = uieditfield(app.frequencyparameterPanel, 'text');
            app.grangerfrequencyEditField.Position = [131 6 68 22];
            app.grangerfrequencyEditField.Value = '[0.01 0.1]';

            % Create selectedClusterListBoxLabel
            app.selectedClusterListBoxLabel = uilabel(app.GrangercausalitybigPanel);
            app.selectedClusterListBoxLabel.HorizontalAlignment = 'right';
            app.selectedClusterListBoxLabel.VerticalAlignment = 'top';
            app.selectedClusterListBoxLabel.Position = [71 342 93 15];
            app.selectedClusterListBoxLabel.Text = 'selected Cluster';

            % Create grangerselectedClusterListBox
            app.grangerselectedClusterListBox = uilistbox(app.GrangercausalitybigPanel);
            app.grangerselectedClusterListBox.Position = [30 24 175 315];

            % Create usedataPanel
            app.usedataPanel = uipanel(app.connectivityestimationTab);
            app.usedataPanel.Title = 'use data';
            app.usedataPanel.Position = [13 613 347 147];

            % Create conuseYCheckBox
            app.conuseYCheckBox = uicheckbox(app.usedataPanel);
            app.conuseYCheckBox.Text = 'Y';
            app.conuseYCheckBox.Position = [23 99 30 15];
            app.conuseYCheckBox.Value = true;

            % Create conuseYc1CheckBox
            app.conuseYc1CheckBox = uicheckbox(app.usedataPanel);
            app.conuseYc1CheckBox.Text = 'Yc1';
            app.conuseYc1CheckBox.Position = [22 59 43 15];
            app.conuseYc1CheckBox.Value = true;

            % Create conuseYc2CheckBox
            app.conuseYc2CheckBox = uicheckbox(app.usedataPanel);
            app.conuseYc2CheckBox.Text = 'Yc2';
            app.conuseYc2CheckBox.Position = [22 25 43 15];
            app.conuseYc2CheckBox.Value = true;

            % Create sbgrangercausalityPanel
            app.sbgrangercausalityPanel = uipanel(app.connectivityestimationTab);
            app.sbgrangercausalityPanel.Title = 'sb granger causality';
            app.sbgrangercausalityPanel.Position = [34 500 274 91];

            % Create triallengthimagesLabel
            app.triallengthimagesLabel = uilabel(app.sbgrangercausalityPanel);
            app.triallengthimagesLabel.HorizontalAlignment = 'right';
            app.triallengthimagesLabel.VerticalAlignment = 'top';
            app.triallengthimagesLabel.Position = [75 36 108 22];
            app.triallengthimagesLabel.Text = 'trial length(images)';

            % Create sb_gc_TRIAL_LENGTH
            app.sb_gc_TRIAL_LENGTH = uieditfield(app.sbgrangercausalityPanel, 'numeric');
            app.sb_gc_TRIAL_LENGTH.Limits = [1 1000];
            app.sb_gc_TRIAL_LENGTH.Position = [198 39 44 22];
            app.sb_gc_TRIAL_LENGTH.Value = 60;

            % Create sb_gc_switch
            app.sb_gc_switch = uiswitch(app.sbgrangercausalityPanel, 'toggle');
            app.sb_gc_switch.Items = {'0', '1'};
            app.sb_gc_switch.ValueChangedFcn = createCallbackFcn(app, @sb_gc_switchValueChanged, true);
            app.sb_gc_switch.FontSize = 8;
            app.sb_gc_switch.FontColor = [0.9412 0.9412 0.9412];
            app.sb_gc_switch.Position = [37 16 20 45];
            app.sb_gc_switch.Value = '0';

            % Create datareductionTab
            app.datareductionTab = uitab(app.TabGroup);
            app.datareductionTab.Title = 'data reduction';

            % Create deleteifpossiblePanel
            app.deleteifpossiblePanel = uipanel(app.datareductionTab);
            app.deleteifpossiblePanel.Title = 'delete if possible';
            app.deleteifpossiblePanel.Position = [33 771 316 179];

            % Create YCheckBox
            app.YCheckBox = uicheckbox(app.deleteifpossiblePanel);
            app.YCheckBox.Text = 'Y';
            app.YCheckBox.Position = [28 124 30 15];

            % Create Yc1CheckBox
            app.Yc1CheckBox = uicheckbox(app.deleteifpossiblePanel);
            app.Yc1CheckBox.Text = 'Yc1';
            app.Yc1CheckBox.Position = [88 124 43 15];

            % Create Yc2CheckBox
            app.Yc2CheckBox = uicheckbox(app.deleteifpossiblePanel);
            app.Yc2CheckBox.Text = 'Yc2';
            app.Yc2CheckBox.Position = [150 124 43 15];

            % Create newprefixforClustermatfilesEditFieldLabel
            app.newprefixforClustermatfilesEditFieldLabel = uilabel(app.deleteifpossiblePanel);
            app.newprefixforClustermatfilesEditFieldLabel.HorizontalAlignment = 'right';
            app.newprefixforClustermatfilesEditFieldLabel.VerticalAlignment = 'top';
            app.newprefixforClustermatfilesEditFieldLabel.Position = [18 37 168 15];
            app.newprefixforClustermatfilesEditFieldLabel.Text = 'new prefix for Cluster.mat files';

            % Create newprefixforClustermatfilesEditField
            app.newprefixforClustermatfilesEditField = uieditfield(app.deleteifpossiblePanel, 'text');
            app.newprefixforClustermatfilesEditField.Position = [197 30 100 22];
            app.newprefixforClustermatfilesEditField.Value = 'red_';

            % Create reduceClusterdataButton
            app.reduceClusterdataButton = uibutton(app.datareductionTab, 'push');
            app.reduceClusterdataButton.ButtonPushedFcn = createCallbackFcn(app, @reduceClusterdataButtonPushed, true);
            app.reduceClusterdataButton.Position = [98 654 122 22];
            app.reduceClusterdataButton.Text = 'reduce Cluster data';

            % Create ExplanationTextAreaLabel
            app.ExplanationTextAreaLabel = uilabel(app.datareductionTab);
            app.ExplanationTextAreaLabel.HorizontalAlignment = 'right';
            app.ExplanationTextAreaLabel.VerticalAlignment = 'top';
            app.ExplanationTextAreaLabel.Position = [532 938 70 15];
            app.ExplanationTextAreaLabel.Text = 'Explanation';

            % Create ExplanationTextArea
            app.ExplanationTextArea = uitextarea(app.datareductionTab);
            app.ExplanationTextArea.Position = [650 801 339 153];
            app.ExplanationTextArea.Value = {'Much of the estimation time is consumed by loading the Cluster.mat files. The major amount of memory size is consumed by the original data from the included voxel. However, only the mean values for every Cluster will be used further. Therefore, if Clustersize is large it might be reasonable to delete the original data and save only the Y_mean values. This is performed by the current function - reduce Cluster structure.'; ''};

            % Create visualizationTab
            app.visualizationTab = uitab(app.TabGroup);
            app.visualizationTab.Title = 'visualization';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.visualizationTab);
            app.TabGroup2.Position = [1 1 1054 1029];

            % Create Cluster2Cluster
            app.Cluster2Cluster = uitab(app.TabGroup2);
            app.Cluster2Cluster.Title = 'Cluster2Cluster';

            % Create loadeddataPanel
            app.loadeddataPanel = uipanel(app.Cluster2Cluster);
            app.loadeddataPanel.Title = 'loaded data';
            app.loadeddataPanel.Position = [12 141 490 826];

            % Create C2CloaddataButton
            app.C2CloaddataButton = uibutton(app.loadeddataPanel, 'push');
            app.C2CloaddataButton.ButtonPushedFcn = createCallbackFcn(app, @C2CloaddataButtonPushed, true);
            app.C2CloaddataButton.Position = [157 772 100 22];
            app.C2CloaddataButton.Text = 'load data';

            % Create C2CloaddataLamp
            app.C2CloaddataLamp = uilamp(app.loadeddataPanel);
            app.C2CloaddataLamp.Position = [268 748 20 20];
            app.C2CloaddataLamp.Color = [1 0 0];

            % Create group1ListBoxLabel
            app.group1ListBoxLabel = uilabel(app.loadeddataPanel);
            app.group1ListBoxLabel.HorizontalAlignment = 'right';
            app.group1ListBoxLabel.VerticalAlignment = 'top';
            app.group1ListBoxLabel.Position = [157 713 47 15];
            app.group1ListBoxLabel.Text = 'group 1';

            % Create C2Cgroup1ListBox
            app.C2Cgroup1ListBox = uilistbox(app.loadeddataPanel);
            app.C2Cgroup1ListBox.Multiselect = 'on';
            app.C2Cgroup1ListBox.Position = [14 97 220 613];
            app.C2Cgroup1ListBox.Value = {'Item 1'};

            % Create group2ListBoxLabel
            app.group2ListBoxLabel = uilabel(app.loadeddataPanel);
            app.group2ListBoxLabel.HorizontalAlignment = 'right';
            app.group2ListBoxLabel.VerticalAlignment = 'top';
            app.group2ListBoxLabel.Position = [287 714 47 15];
            app.group2ListBoxLabel.Text = 'group 2';

            % Create C2Cgroup2ListBox
            app.C2Cgroup2ListBox = uilistbox(app.loadeddataPanel);
            app.C2Cgroup2ListBox.Multiselect = 'on';
            app.C2Cgroup2ListBox.Position = [250 97 220 613];
            app.C2Cgroup2ListBox.Value = {'Item 1'};

            % Create C2CnormalizeCheckBox
            app.C2CnormalizeCheckBox = uicheckbox(app.loadeddataPanel);
            app.C2CnormalizeCheckBox.Text = 'normalize';
            app.C2CnormalizeCheckBox.Position = [263 61 76 15];

            % Create C2CestimateClusterstatisticButton
            app.C2CestimateClusterstatisticButton = uibutton(app.loadeddataPanel, 'push');
            app.C2CestimateClusterstatisticButton.ButtonPushedFcn = createCallbackFcn(app, @C2CestimateClusterstatisticButtonPushed, true);
            app.C2CestimateClusterstatisticButton.Position = [226 29 146 22];
            app.C2CestimateClusterstatisticButton.Text = 'estimate Cluster statistic';

            % Create C2CstatisticButtonGroup
            app.C2CstatisticButtonGroup = uibuttongroup(app.loadeddataPanel);
            app.C2CstatisticButtonGroup.Title = 'statistic';
            app.C2CstatisticButtonGroup.Position = [15 719 123 77];

            % Create C2CtwosampleButton
            app.C2CtwosampleButton = uitogglebutton(app.C2CstatisticButtonGroup);
            app.C2CtwosampleButton.Text = 'two-sample';
            app.C2CtwosampleButton.Position = [11 24 100 22];
            app.C2CtwosampleButton.Value = true;

            % Create C2CpairedButton
            app.C2CpairedButton = uitogglebutton(app.C2CstatisticButtonGroup);
            app.C2CpairedButton.Text = 'paired';
            app.C2CpairedButton.Position = [11 3 100 22];

            % Create C2CestimatedataLamp
            app.C2CestimatedataLamp = uilamp(app.loadeddataPanel);
            app.C2CestimatedataLamp.Position = [403 53 20 20];
            app.C2CestimatedataLamp.Color = [1 0 0];

            % Create C2CDatatouseButtonGroup
            app.C2CDatatouseButtonGroup = uibuttongroup(app.loadeddataPanel);
            app.C2CDatatouseButtonGroup.Title = 'Data to use';
            app.C2CDatatouseButtonGroup.Position = [294 730 178 57];

            % Create C2CYButton
            app.C2CYButton = uiradiobutton(app.C2CDatatouseButtonGroup);
            app.C2CYButton.Text = 'Y';
            app.C2CYButton.Position = [11 11 30 15];
            app.C2CYButton.Value = true;

            % Create C2CYc1Button
            app.C2CYc1Button = uiradiobutton(app.C2CDatatouseButtonGroup);
            app.C2CYc1Button.Text = 'Yc1';
            app.C2CYc1Button.Position = [57 11 43 15];

            % Create C2CYc2Button
            app.C2CYc2Button = uiradiobutton(app.C2CDatatouseButtonGroup);
            app.C2CYc2Button.Text = 'Yc2';
            app.C2CYc2Button.Position = [111 11 43 15];

            % Create C2CestimateClusterstatisticButton_2
            app.C2CestimateClusterstatisticButton_2 = uibutton(app.loadeddataPanel, 'push');
            app.C2CestimateClusterstatisticButton_2.ButtonPushedFcn = createCallbackFcn(app, @C2CestimateClusterstatisticButton_2Pushed, true);
            app.C2CestimateClusterstatisticButton_2.BackgroundColor = [1 0 0];
            app.C2CestimateClusterstatisticButton_2.Position = [51 29 146 22];
            app.C2CestimateClusterstatisticButton_2.Text = 'estimate Cluster statistic';

            % Create C2CloaddataButton_2
            app.C2CloaddataButton_2 = uibutton(app.loadeddataPanel, 'push');
            app.C2CloaddataButton_2.ButtonPushedFcn = createCallbackFcn(app, @C2CloaddataButton_2Pushed, true);
            app.C2CloaddataButton_2.BackgroundColor = [1 0 0];
            app.C2CloaddataButton_2.Position = [157 737 100 22];
            app.C2CloaddataButton_2.Text = 'load data';

            % Create C2CshownetworksButton
            app.C2CshownetworksButton = uibutton(app.Cluster2Cluster, 'push');
            app.C2CshownetworksButton.ButtonPushedFcn = createCallbackFcn(app, @C2CshownetworksButtonPushed, true);
            app.C2CshownetworksButton.Position = [184 49 100 22];
            app.C2CshownetworksButton.Text = 'show networks';

            % Create BrainconnectivityPanel
            app.BrainconnectivityPanel = uipanel(app.Cluster2Cluster);
            app.BrainconnectivityPanel.Title = 'Brain connectivity';
            app.BrainconnectivityPanel.Position = [526 745 511 222];

            % Create C2CmeanZdiffButton
            app.C2CmeanZdiffButton = uibutton(app.BrainconnectivityPanel, 'push');
            app.C2CmeanZdiffButton.ButtonPushedFcn = createCallbackFcn(app, @C2CmeanZdiffButtonPushed, true);
            app.C2CmeanZdiffButton.Position = [18 168 100 22];
            app.C2CmeanZdiffButton.Text = 'mean Z diff';

            % Create C2CBCsigdiffButton
            app.C2CBCsigdiffButton = uibutton(app.BrainconnectivityPanel, 'push');
            app.C2CBCsigdiffButton.ButtonPushedFcn = createCallbackFcn(app, @C2CBCsigdiffButtonPushed, true);
            app.C2CBCsigdiffButton.Position = [136 168 64 22];
            app.C2CBCsigdiffButton.Text = 'sig diff';

            % Create BehaviorvsBrainconnectivitywithEXELdataPanel
            app.BehaviorvsBrainconnectivitywithEXELdataPanel = uipanel(app.Cluster2Cluster);
            app.BehaviorvsBrainconnectivitywithEXELdataPanel.Title = 'Behavior vs. Brain connectivity with EXEL data';
            app.BehaviorvsBrainconnectivitywithEXELdataPanel.Position = [526 60 511 658];

            % Create xlscsvFileEditFieldLabel
            app.xlscsvFileEditFieldLabel = uilabel(app.BehaviorvsBrainconnectivitywithEXELdataPanel);
            app.xlscsvFileEditFieldLabel.HorizontalAlignment = 'right';
            app.xlscsvFileEditFieldLabel.VerticalAlignment = 'top';
            app.xlscsvFileEditFieldLabel.Position = [8 596 64 22];
            app.xlscsvFileEditFieldLabel.Text = 'xls/csv File';

            % Create xlscsvFileEditField
            app.xlscsvFileEditField = uieditfield(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'text');
            app.xlscsvFileEditField.Position = [87 599 373 22];
            app.xlscsvFileEditField.Value = 'G:\Google Drive\paper\02_Vesti_bilateral\Vertigo_Behavioral20180321.xlsx';

            % Create C2CchooseexelfileButton
            app.C2CchooseexelfileButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.C2CchooseexelfileButton.ButtonPushedFcn = createCallbackFcn(app, @C2CchooseexelfileButtonPushed, true);
            app.C2CchooseexelfileButton.Position = [471 599 30 22];
            app.C2CchooseexelfileButton.Text = '...';

            % Create C2CexelreadmeButton
            app.C2CexelreadmeButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.C2CexelreadmeButton.ButtonPushedFcn = createCallbackFcn(app, @C2CexelreadmeButtonPushed, true);
            app.C2CexelreadmeButton.Position = [410 573 100 22];
            app.C2CexelreadmeButton.Text = 'readme';

            % Create loadexelfileButton
            app.loadexelfileButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.loadexelfileButton.ButtonPushedFcn = createCallbackFcn(app, @loadexelfileButtonPushed, true);
            app.loadexelfileButton.Position = [224 562 100 22];
            app.loadexelfileButton.Text = 'load exel file';

            % Create ExelvariablesListBoxLabel
            app.ExelvariablesListBoxLabel = uilabel(app.BehaviorvsBrainconnectivitywithEXELdataPanel);
            app.ExelvariablesListBoxLabel.HorizontalAlignment = 'right';
            app.ExelvariablesListBoxLabel.VerticalAlignment = 'top';
            app.ExelvariablesListBoxLabel.Position = [20 528 82 15];
            app.ExelvariablesListBoxLabel.Text = 'Exel variables';

            % Create ExelvariablesListBox
            app.ExelvariablesListBox = uilistbox(app.BehaviorvsBrainconnectivitywithEXELdataPanel);
            app.ExelvariablesListBox.Multiselect = 'on';
            app.ExelvariablesListBox.Position = [117 110 355 435];
            app.ExelvariablesListBox.Value = {'Item 1'};

            % Create C2CestimatecorrelationButton
            app.C2CestimatecorrelationButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.C2CestimatecorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @C2CestimatecorrelationButtonPushed, true);
            app.C2CestimatecorrelationButton.Position = [234 72 122 22];
            app.C2CestimatecorrelationButton.Text = 'estimate correlation';

            % Create visualizecorrelationButton
            app.visualizecorrelationButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.visualizecorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @visualizecorrelationButtonPushed, true);
            app.visualizecorrelationButton.Position = [233 38 124 22];
            app.visualizecorrelationButton.Text = 'visualize correlation';

            % Create C2CestimateexelcorrelationLamp
            app.C2CestimateexelcorrelationLamp = uilamp(app.BehaviorvsBrainconnectivitywithEXELdataPanel);
            app.C2CestimateexelcorrelationLamp.Position = [374 73 20 20];
            app.C2CestimateexelcorrelationLamp.Color = [1 0 0];

            % Create C2CvisualizenetworkcorrelationButton
            app.C2CvisualizenetworkcorrelationButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.C2CvisualizenetworkcorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @C2CvisualizenetworkcorrelationButtonPushed, true);
            app.C2CvisualizenetworkcorrelationButton.BackgroundColor = [1 0 0];
            app.C2CvisualizenetworkcorrelationButton.Position = [55 38 170 22];
            app.C2CvisualizenetworkcorrelationButton.Text = 'visualize network correlation';

            % Create C2CestimatenetworkcorrelationButton
            app.C2CestimatenetworkcorrelationButton = uibutton(app.BehaviorvsBrainconnectivitywithEXELdataPanel, 'push');
            app.C2CestimatenetworkcorrelationButton.ButtonPushedFcn = createCallbackFcn(app, @C2CestimatenetworkcorrelationButtonPushed, true);
            app.C2CestimatenetworkcorrelationButton.Position = [56 72 168 22];
            app.C2CestimatenetworkcorrelationButton.Text = 'estimate network correlation';

            % Create Cluster2Voxel
            app.Cluster2Voxel = uitab(app.TabGroup2);
            app.Cluster2Voxel.Title = 'Cluster2Voxel';

            % Create Voxel2Voxel
            app.Voxel2Voxel = uitab(app.TabGroup2);
            app.Voxel2Voxel.Title = 'Voxel2Voxel';

            % Create Cluster2Cluster_Granger
            app.Cluster2Cluster_Granger = uitab(app.TabGroup2);
            app.Cluster2Cluster_Granger.Title = 'Cluster2Cluster_Granger';

            % Create GlobalParameterPanel
            app.GlobalParameterPanel = uipanel(app.UIFigure);
            app.GlobalParameterPanel.Title = 'Global Parameter';
            app.GlobalParameterPanel.Position = [9 715 481 378];

            % Create resultsrootdirEditFieldLabel
            app.resultsrootdirEditFieldLabel = uilabel(app.GlobalParameterPanel);
            app.resultsrootdirEditFieldLabel.HorizontalAlignment = 'right';
            app.resultsrootdirEditFieldLabel.VerticalAlignment = 'top';
            app.resultsrootdirEditFieldLabel.Position = [7 278 82 15];
            app.resultsrootdirEditFieldLabel.Text = 'results root dir';

            % Create resultsdirEditField
            app.resultsdirEditField = uieditfield(app.GlobalParameterPanel, 'text');
            app.resultsdirEditField.Position = [104 274 284 22];
            app.resultsdirEditField.Value = 'H:\data_ck\Vesti\analyse\out3';

            % Create Buttonchooseresultsdir
            app.Buttonchooseresultsdir = uibutton(app.GlobalParameterPanel, 'push');
            app.Buttonchooseresultsdir.ButtonPushedFcn = createCallbackFcn(app, @ButtonchooseresultsdirPushed, true);
            app.Buttonchooseresultsdir.Position = [410 271 35 22];
            app.Buttonchooseresultsdir.Text = '...';

            % Create Buttonchooseg1dir
            app.Buttonchooseg1dir = uibutton(app.GlobalParameterPanel, 'push');
            app.Buttonchooseg1dir.ButtonPushedFcn = createCallbackFcn(app, @Buttonchooseg1dirPushed, true);
            app.Buttonchooseg1dir.Position = [410 235 35 22];
            app.Buttonchooseg1dir.Text = '...';

            % Create group1dirEditFieldLabel
            app.group1dirEditFieldLabel = uilabel(app.GlobalParameterPanel);
            app.group1dirEditFieldLabel.HorizontalAlignment = 'right';
            app.group1dirEditFieldLabel.VerticalAlignment = 'top';
            app.group1dirEditFieldLabel.Position = [25 239 64 15];
            app.group1dirEditFieldLabel.Text = 'group 1 dir';

            % Create g1dirEditField
            app.g1dirEditField = uieditfield(app.GlobalParameterPanel, 'text');
            app.g1dirEditField.Position = [106 235 282 22];
            app.g1dirEditField.Value = 'H:\data_ck\Vesti\analyse\out3\VB';

            % Create chooseg2dir
            app.chooseg2dir = uibutton(app.GlobalParameterPanel, 'push');
            app.chooseg2dir.ButtonPushedFcn = createCallbackFcn(app, @chooseg2dirButtonPushed, true);
            app.chooseg2dir.Position = [410 195 35 22];
            app.chooseg2dir.Text = '...';

            % Create group2dirEditFieldLabel
            app.group2dirEditFieldLabel = uilabel(app.GlobalParameterPanel);
            app.group2dirEditFieldLabel.HorizontalAlignment = 'right';
            app.group2dirEditFieldLabel.VerticalAlignment = 'top';
            app.group2dirEditFieldLabel.Position = [27 199 64 15];
            app.group2dirEditFieldLabel.Text = 'group 2 dir';

            % Create g2dirEditField
            app.g2dirEditField = uieditfield(app.GlobalParameterPanel, 'text');
            app.g2dirEditField.Position = [106 195 282 22];
            app.g2dirEditField.Value = 'H:\data_ck\Vesti\analyse\out3\H';

            % Create loadlastButton
            app.loadlastButton = uibutton(app.GlobalParameterPanel, 'push');
            app.loadlastButton.ButtonPushedFcn = createCallbackFcn(app, @loadlastButtonPushed, true);
            app.loadlastButton.Position = [27 320 80 22];
            app.loadlastButton.Text = 'load last';

            % Create loadButton
            app.loadButton = uibutton(app.GlobalParameterPanel, 'push');
            app.loadButton.ButtonPushedFcn = createCallbackFcn(app, @loadButtonPushed, true);
            app.loadButton.Position = [129 320 80 22];
            app.loadButton.Text = 'load';

            % Create saveButton
            app.saveButton = uibutton(app.GlobalParameterPanel, 'push');
            app.saveButton.ButtonPushedFcn = createCallbackFcn(app, @saveButtonPushed, true);
            app.saveButton.Position = [237 320 80 22];
            app.saveButton.Text = 'save';

            % Create MultiprocessoroptionsCheckBox
            app.MultiprocessoroptionsCheckBox = uicheckbox(app.GlobalParameterPanel);
            app.MultiprocessoroptionsCheckBox.Text = 'Multiprocessor options';
            app.MultiprocessoroptionsCheckBox.Position = [300 8 145 15];

            % Create initnewButton
            app.initnewButton = uibutton(app.GlobalParameterPanel, 'push');
            app.initnewButton.ButtonPushedFcn = createCallbackFcn(app, @initnewButtonPushed, true);
            app.initnewButton.Position = [348 320 80 22];
            app.initnewButton.Text = 'init/new';

            % Create idleGaugeLabel
            app.idleGaugeLabel = uilabel(app.GlobalParameterPanel);
            app.idleGaugeLabel.HorizontalAlignment = 'center';
            app.idleGaugeLabel.VerticalAlignment = 'top';
            app.idleGaugeLabel.Position = [49.5 78 379 15];
            app.idleGaugeLabel.Text = 'idle';

            % Create idleGauge
            app.idleGauge = uigauge(app.GlobalParameterPanel, 'linear');
            app.idleGauge.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.idleGauge.MinorTicks = [];
            app.idleGauge.Position = [40 108 405 40];

            % Create loadnewsbButton
            app.loadnewsbButton = uibutton(app.GlobalParameterPanel, 'push');
            app.loadnewsbButton.ButtonPushedFcn = createCallbackFcn(app, @loadnewsbButtonPushed, true);
            app.loadnewsbButton.Position = [13 26 88 22];
            app.loadnewsbButton.Text = 'load (new sb)';

            % Create savenewsbButton
            app.savenewsbButton = uibutton(app.GlobalParameterPanel, 'push');
            app.savenewsbButton.ButtonPushedFcn = createCallbackFcn(app, @savenewsbButtonPushed, true);
            app.savenewsbButton.Position = [120 26 90 22];
            app.savenewsbButton.Text = 'save (new sb)';

            % Create g1ListBox
            app.g1ListBox = uilistbox(app.UIFigure);
            app.g1ListBox.Multiselect = 'on';
            app.g1ListBox.Position = [9 40 230 635];
            app.g1ListBox.Value = {'Item 1'};

            % Create g2ListBox
            app.g2ListBox = uilistbox(app.UIFigure);
            app.g2ListBox.Multiselect = 'on';
            app.g2ListBox.Position = [260 40 230 635];
            app.g2ListBox.Value = {'Item 1'};

            % Create group1directoryLabel
            app.group1directoryLabel = uilabel(app.UIFigure);
            app.group1directoryLabel.VerticalAlignment = 'top';
            app.group1directoryLabel.FontSize = 14;
            app.group1directoryLabel.Position = [59 685 113 18];
            app.group1directoryLabel.Text = 'group 1 directory';

            % Create group2directoryLabel
            app.group2directoryLabel = uilabel(app.UIFigure);
            app.group2directoryLabel.VerticalAlignment = 'top';
            app.group2directoryLabel.FontSize = 14;
            app.group2directoryLabel.Position = [309 685 113 18];
            app.group2directoryLabel.Text = 'group 2 directory';

            % Create updateButton
            app.updateButton = uibutton(app.UIFigure, 'push');
            app.updateButton.ButtonPushedFcn = createCallbackFcn(app, @updateButtonPushed, true);
            app.updateButton.Position = [197 8 100 22];
            app.updateButton.Text = 'update';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ck_rc3_GUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end