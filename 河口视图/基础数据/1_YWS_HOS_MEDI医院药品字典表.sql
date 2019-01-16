CREATE OR REPLACE VIEW YWS_HOS_MEDI AS
       SELECT NULL IS_OP_IP,--门诊、住院标记  1门诊， 2住院， 3全院
              T.DRUG_CODE MEDI_CODE,--药品代码
              T.DRUG_SPEC MEDI_SPEC,--药品规格
              NULL PACKING_SPEC,--包装规格
              T.PACK_UNIT PACKING_UNIT,--包装单位
              NULL PACKING_MIN_QTY, --最小包装数量 在包装单位下的小包装数量，比如包装单位是盒，1盒是20片，那么这里就是20
              NULL PACKING_MIN_UNIT,--最小包装单位
              NULL MEDI_QTY,--剂量数 在最小包装单位下的剂量数，比如最小包装单位是片，1片是0.5g，那么这里就是0.5
              (SELECT VALUE_NAME FROM PUBLIC_DICT WHERE DICT_NAME ='UNIT_DICT' AND VALUE_ID =T1.DOSE_UNIT ) MEDI_UNIT,--剂量单位
              T.MANUFACT_NAME MEDI_MANUF,--生产厂商
              T.COMM_NAME MEDI_PRODUCT_NAME,--药品商品名
              NULL MEDI_NAME,--医院显示的药品名称
              SUBSTR(T1.INPUT_CODE,'0','1') MEDI_SP,--药品名称首拼
              T1.DRUG_NAME MEDI_TY_NAME,--药品通用名称
              (SELECT VALUE_NAME FROM PUBLIC_DICT WHERE DICT_NAME ='DRUG_DOSE_DICT' AND VALUE_ID = T1.DRUG_DOSE)MEDI_JX_NAME,--药品剂型名称
              T1.IS_ANTIBIOTIC IS_KSS,--是否抗生素标记 0否，1是
              NULL IS_KZL,--是否抗肿瘤药品标记 0否，1是
              DECODE(T.DRUG_CATEGORY,'01','1','02','2','03','3',NULL) ZXY_TYPE,--中药、西药、草药标记 1西药， 2中成药 ,3草药,空 未知
              NULL IS_BASIC_MEDI,--基本药物类型 0否，1是
              NULL IS_ZSY,--是否注射剂标记 0否，1是
              NULL JDM_TYPE,--精神麻醉药品标记
              NULL STOP_DATE,--自负、医保、新农合类型
              T1.ANTIBIOTIC_LEVEL KSS_TYPE,--抗生素分级级别 三线用药级别
              NULL STOP_TYPE,--停用标记 0未停用，1停用
              NULL MEDI_TYPE,--停用时间
              NULL YB_CODE,--医保中标药品编码
              NULL YB_TYPE,--医保类型
              NULL YB_REMARK,--医保备注
              NULL PZWH,--批准文号
              NULL HOS_CODE--医院代码 区域项目使用
               FROM DRUG_LIST T LEFT JOIN DRUG_DICT T1 ON T.DRUG_DICT_CODE = T1.DRUG_DICT_CODE;