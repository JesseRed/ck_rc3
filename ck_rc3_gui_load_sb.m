function ck_rc3_gui_load_sb(app)
    fprintf('ck_rc3_gui_load_sb\n')
    working_dir = app.resultsdirEditField.Value;
    fprintf('- reading: %s ', working_dir);
    
    fn_settings = fullfile(working_dir, 'ck_rc3_settings.json');


    if ~exist(working_dir)
        fprintf('\n\tnot found!\n\n');

        disp('please select file manually ...')
        [fn, pn] = uigetfile(fn_settings, 'select ck_rc3_settings.json');
        if isempty(pn); return; end
        fn_settings = fullfile(pn, fn);
        if ~exist(fn_settings);return;end
    end
    
    if ~exist(fn_settings)
        fprintf('\n\tsettings not found!\n\n');
        return;
    end
    
    fprintf('\n\treading: %s', fn_settings)
    % now read the json file
    fid = fopen(fn_settings); 
    raw = fread(fid,inf); 
    str = char(raw'); 
    fclose(fid); 
    val = jsondecode(str);

    fieldstr = fieldnames(val);

    for i = 1:numel(fieldstr)
        fstr = fieldstr{i};

        if isprop(app, fstr)
            value = val.(fstr);
            
            valuestr = fieldnames(value);

            for ii = 1:numel(valuestr)
                vstr = valuestr{ii};
                if isprop(app.(fstr), vstr)
                    try
                        app.(fstr).(vstr) = value.(vstr);
                    catch
                        
                    end

                end

            end

        end


    end
    
    fprintf('\ndone\n\n');