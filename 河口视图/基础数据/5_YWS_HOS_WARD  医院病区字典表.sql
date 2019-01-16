               CREATE OR REPLACE VIEW YWS_HOS_KESHI AS
                         SELECT 
                         T.DEPT_CODE WARD_CODE,--  病区编码 nvarchar(50)  
                         T.DEPT_NAME WARD_NAME,--  病区名称 nvarchar(100) 
                         SUBSTR(T.INPUT_CODE,0,1) WARD_SP   ,--  名称的首拼 nvarchar(100) 
                         T.STATUS IS_DEL  ,--  数据状态  int 
                         NULL HOS_CODE--  医院代码  nvarchar(100) 区域项目使用
                        FROM DEPT_LIST T
                        LEFT JOIN DEPT_PROPERTY_REL T1 ON T.DEPT_CODE = T1.DEPT_CODE
                        WHERE T1.DEPT_PROPERTY_CODE = '43'