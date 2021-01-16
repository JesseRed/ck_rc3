function ck_rc3_gui_save_sb(app)
fprintf('ck_rc3_gui_save_sb\n')
    working_dir = app.resultsdirEditField.Value;
    fprintf('- writing to: %s ', working_dir);
    
    if ~exist(working_dir)
        fprintf('\n\tnot found!\n\n');
        return;
    end
    
    fn_settings = fullfile(working_dir, 'ck_rc3_settings.json');

    
    fprintf('\ndone\n\n');
    
    fields2save = {'resultsdirEditField', 'g1dirEditField', 'g2dirEditField', 'exemplarydatafileEditField',  'g1ListBox', 'g2ListBox', 'g1dirdataimportEditField', 'g1dirdataimportListBox', 'g2dirdataimportListBox', 'dataimportsubdirnameEditField_1', 'dataimportsubdirnameEditField_2', 'dataimportfilefilterEditField', 'TREditField', 'lpfEditField', 'hpfEditField', 'graymatterfilenameEditField', 'whitematterfilenameEditField', 'csffilenameEditField', 'newprefixforClustermatfilesEditField', 'C2Cgroup1ListBox', 'C2Cgroup2ListBox', 'xlscsvFileEditField', 'ExelvariablesListBox', 'TREditField', 'lpfEditField', 'hpfEditField'};
    
    OUT = struct();
    for i = 1:numel(fields2save)
        fstr = fields2save{i};
        if isprop(app, fstr)
            if isprop(app.(fstr), 'Value')
                OUT.(fstr).Value = app.(fstr).Value
            end

            if isprop(app.(fstr), 'Items')
                OUT.(fstr).Items = app.(fstr).Items
            end
        end

    end

    % assignin('base', 'OUT', OUT)

    % WRITE TO FILE
    fid = fopen(fn_settings, 'w');
    if fid == -1, error('Cannot create JSON file'); end
    fwrite(fid, jsonencode(OUT), 'char');
    fclose(fid);

    fprintf('\n\twriting to: %s', fn_settings);
    fprintf('\ndone\n');