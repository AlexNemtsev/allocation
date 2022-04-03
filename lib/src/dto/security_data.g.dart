// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityData _$SecurityDataFromJson(Map<String, dynamic> json) => SecurityData(
      json['ISIN'] as String,
      json['SECID'] as String,
      json['SECNAME'] as String,
      json['BOARDID'] as String,
      json['CURRENCYID'] as String,
      (json['LOTVALUE'] as num?)?.toDouble() ?? 100,
    );

Map<String, dynamic> _$SecurityDataToJson(SecurityData instance) =>
    <String, dynamic>{
      'ISIN': instance.isin,
      'SECID': instance.secid,
      'SECNAME': instance.secName,
      'BOARDID': instance.boardID,
      'CURRENCYID': instance.currencyID,
      'LOTVALUE': instance.lotValue,
    };
