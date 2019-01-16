CREATE OR REPLACE VIEW YWS_HOS_MEDI_CLASS AS
       SELECT T.CLASS_CODE CLASS_CODE   ,--药理分类代码  nvarchar(50)
              T.CLASS_NAME CLASS_NAME   ,--药理分类名称  nvarchar(50)
              SUBSTR(T.INPUT_CODE,0,1) CLASS_SP     ,--名称的首拼  nvarchar(50)
              null CLASS_SORT   ,--排序顺序值  smallint
              T.PARENT_CODE PARENT_CODE  ,--父代码  nvarchar(50)
              null ROOT_CODE    ,--根代码  nvarchar(50)
              null HOS_CODE     --医院代码	nvarchar(100)	区域项目使用
              FROM DRUG_CLASS_DICT T;