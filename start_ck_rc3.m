% Shortcut summary goes here
SPM_DIR="/opt/spm12";
SB_TOOLS="/opt/sb_tools";
CK_DIR="/opt/ck_rc3";

addpath(fullfile(SB_TOOLS, 'sb_preprocesser'));
addpath(fullfile(SB_TOOLS, 'sb_roi_cluster_manager'));
addpath(SPM_DIR);
addpath(CK_DIR);

spm fmri
ck_rc3();
