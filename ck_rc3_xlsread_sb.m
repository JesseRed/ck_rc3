function  [Lnum,Ltxt,L] = ck_rc3_xlsread_sb(fname)
    Lnum = [];
    Ltxt = [];
    L = [];
    fprintf('ck_rc3_xlsread_sb\n')
    fprintf('\t-reading: %s\n', fname);

    [pn fn ext] = fileparts(fname);

    switch ext
        case '.csv'
            fprintf('\t-found: CSV')
            Tbl = readtable(fname);
            % now parse and bring to a similiar format as xlsread would have done
            [Lnum Ltxt L] = parseCSV(Tbl);
            disp('.. done')
        case {'.xls', '.xlsx'}
            fprintf('\t-found: EXCEL')
            [Lnum,Ltxt,L] = xlsread(fname);
            disp('.. done')
        otherwise
            fprintf('\t-fileformat not supported: %s\n', ext)
            return;
    end

end

    
function [Lnum Ltxt L] = parseCSV(Tbl)
    Lnum = [];
    Ltxt = [];

    fstr = Tbl.Properties.VariableNames;
    L = {};

    for i = 1:numel(fstr)
        TMP = {fstr{i}};
        switch class(Tbl.(fstr{i}))
            case {'double', 'int'}
                TMP = [TMP; num2cell(Tbl.(fstr{i}))];
            otherwise
            TMP = [TMP; Tbl.(fstr{i})];
        end

        L = [L TMP];
    end

    assignin('base', 'L', L)

end