CREATE OR REPLACE VIEW YWS_HOS_MEDI_CLASS AS
SELECT NULL         IS_OP_IP, --            门诊、住院标记  int  1门诊，2住院，3全院
       T.DRUG_CODE  MEDI_CODE, --            药品代码  nvarchar(50)
       T.DRUG_CLASS CLASS_CODE, --              药理分类代码  nvarchar(50)
       NULL         HOS_CODE --            医院代码 nvarchar(100) 区域项目使用
  FROM DRUG_LIST T