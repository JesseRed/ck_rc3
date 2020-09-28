% Shortcut summary goes here
addpath('G:\Google Drive\SPM\sb_sonstiges\sb_preprocesser');
addpath(genpath('G:\Google Drive\SPM\sb_batch_display'));
%addpath('G:\spm12\toolbox\Anatomy');
addpath('G:\spm12');
addpath(genpath('G:\Google Drive\SPM\ck_rc3'));
addpath(genpath('G:\Google Drive\SPM\sb_sonstiges\sb_roi_cluster_manager'));
cd('H:\data_ck\ck_rc2_testdata');

spm fmri
ck_rc3();
