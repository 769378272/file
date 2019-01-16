               CREATE OR REPLACE VIEW YWS_HOS_KESHI AS
                         SELECT 
                         NULL IS_OP_IP  , --门诊住院标识 int 1门诊，2住院，3全院
                        T.DEPT_CODE KESHI_CODE,  --科室编码  nvarchar(50)  
                        T.DEPT_NAME KESHI_NAME,  --科室名称  nvarchar(50)  
                        SUBSTR(T.INPUT_CODE,0,1) KESHI_SP  , --名称的首拼  nvarchar(50)  
                        NULL KESHI_TYPE,  --科室类型  nvarchar(50)  
                        T.STATUS IS_DEL    , --数据状态   int 是否已删除数据，0否1是
                        NULL HOS_CODE   --医院代码  nvarchar(100) 区域项目使用
                        FROM DEPT_LIST T