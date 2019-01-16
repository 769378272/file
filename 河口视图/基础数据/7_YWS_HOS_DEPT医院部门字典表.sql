CREATE OR REPLACE VIEW YWS_HOS_DEPT AS
SELECT NULL IS_OP_IP ,--  门诊住院标识 int 1门诊，2住院，3全院
       T.DEPT_CODE DEPT_CODE  ,--  部门编码 nvarchar(50)  
       T.DEPT_NAME DEPT_NAME  ,--  部门名称 nvarchar(50)  
       SUBSTR(T.INPUT_CODE,0,1) DEPT_SP    ,--  名称的首拼  nvarchar(50)  
       T2.DEPT_PROPERTY_NAME DEPT_TYPE  ,--  部门类型 nvarchar(50)  
       T.STATUS IS_DEL   ,--  数据状态 int 
       NULL HOS_CODE --  医院代码  nvarchar(100) 区域项目使用
       FROM DEPT_LIST T LEFT JOIN DEPT_PROPERTY_REL T1 ON T.DEPT_CODE = T1.DEPT_CODE
       LEFT JOIN DEPT_PROPERTY_DICT T2 ON T1.DEPT_PROPERTY_CODE = T2.DEPT_PROPERTY_CODE