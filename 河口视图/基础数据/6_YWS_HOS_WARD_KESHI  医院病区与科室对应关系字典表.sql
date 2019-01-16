CREATE OR REPLACE VIEW YWS_HOS_WARD_KESHI AS
SELECT T.AREA_CODE WARD_CODE,--病区编码 nvarchar(50)  
       T.DEPT_CODE KESHI_CODE,--科室编码  nvarchar(100) 
       NULL IS_DEL,--数据状态 int 
       NULL HOS_CODE--医院代码 nvarchar(100) 区域项目使用 
       FROM AREA_DEPT_REL T 