-- adaltas-hive-udf-0.0.1-SNAPSHOT.jar

CREATE TEMPORARY FUNCTION to_map as 'com.adaltas.UDAFToMap';
CREATE TEMPORARY FUNCTION to_ordered_map as 'com.adaltas.UDAFToOrderedMap';

-- nexr-hive-udf-0.2-SNAPSHOT.jar

CREATE TEMPORARY FUNCTION nvl AS 'com.nexr.platform.hive.udf.GenericUDFNVL';
CREATE TEMPORARY FUNCTION decode AS 'com.nexr.platform.hive.udf.GenericUDFDecode';
CREATE TEMPORARY FUNCTION nvl2 AS 'com.nexr.platform.hive.udf.GenericUDFNVL2';
CREATE TEMPORARY FUNCTION str_to_date AS 'com.nexr.platform.hive.udf.UDFStrToDate';
CREATE TEMPORARY FUNCTION date_format AS 'com.nexr.platform.hive.udf.UDFDateFormat';
CREATE TEMPORARY FUNCTION to_char AS 'com.nexr.platform.hive.udf.UDFToChar';
CREATE TEMPORARY FUNCTION instr4 AS 'com.nexr.platform.hive.udf.GenericUDFInstr';
CREATE TEMPORARY FUNCTION chr AS 'com.nexr.platform.hive.udf.UDFChr';
CREATE TEMPORARY FUNCTION last_day AS 'com.nexr.platform.hive.udf.UDFLastDay';
CREATE TEMPORARY FUNCTION greatest AS 'com.nexr.platform.hive.udf.GenericUDFGreatest';
CREATE TEMPORARY FUNCTION to_number AS 'com.nexr.platform.hive.udf.GenericUDFToNumber';
CREATE TEMPORARY FUNCTION trunc AS 'com.nexr.platform.hive.udf.GenericUDFTrunc';
CREATE TEMPORARY FUNCTION row_number AS 'com.nexr.platform.hive.udf.GenericUDFRowNumber';
CREATE TEMPORARY FUNCTION sysdate AS 'com.nexr.platform.hive.udf.UDFSysDate';
CREATE TEMPORARY FUNCTION populate AS 'com.nexr.platform.hive.udf.GenericUDTFPopulate';
CREATE TEMPORARY FUNCTION dedup AS 'com.nexr.platform.hive.udf.GenericUDAFDedup';
CREATE TEMPORARY FUNCTION lnnvl AS 'com.nexr.platform.hive.udf.GenericUDFLnnvl';
CREATE TEMPORARY FUNCTION substr AS 'com.nexr.platform.hive.udf.UDFSubstrForOracle';

-- ls-hive-0.7-SNAPSHOT.jar

CREATE TEMPORARY FUNCTION ArrayItemUDF AS 'com.lovelysystems.hive.udf.ArrayItemUDF';
CREATE TEMPORARY FUNCTION ArrayMaxUDF AS 'com.lovelysystems.hive.udf.ArrayMaxUDF';
CREATE TEMPORARY FUNCTION ArraySumUDF AS 'com.lovelysystems.hive.udf.ArraySumUDF';
CREATE TEMPORARY FUNCTION ESHashUDF AS 'com.lovelysystems.hive.udf.ESHashUDF';
CREATE TEMPORARY FUNCTION GreatestUDF AS 'com.lovelysystems.hive.udf.GreatestUDF';
CREATE TEMPORARY FUNCTION RegexExtractAllUDF AS 'com.lovelysystems.hive.udf.RegexExtractAllUDF';
CREATE TEMPORARY FUNCTION RowNumberUDF AS 'com.lovelysystems.hive.udf.RowNumberUDF';
CREATE TEMPORARY FUNCTION SequenceIdUDF AS 'com.lovelysystems.hive.udf.SequenceIdUDF';
CREATE TEMPORARY FUNCTION UDAFCollectHistogram AS 'com.lovelysystems.hive.udf.UDAFCollectHistogram';
CREATE TEMPORARY FUNCTION UDAFCumulateHistogram AS 'com.lovelysystems.hive.udf.UDAFCumulateHistogram';
CREATE TEMPORARY FUNCTION UDFHistogramSlope AS 'com.lovelysystems.hive.udf.UDFHistogramSlope';
CREATE TEMPORARY FUNCTION UDFUpdateHistogram AS 'com.lovelysystems.hive.udf.UDFUpdateHistogram';
CREATE TEMPORARY FUNCTION UnescapeXMLUDF AS 'com.lovelysystems.hive.udf.UnescapeXMLUDF';

