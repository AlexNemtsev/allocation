// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecData _$SecDataFromJson(Map<String, dynamic> json) => SecData(
      json['isin'] as String,
      json['secid'] as String,
      json['secname'] as String,
      json['boardid'] as String,
      json['currencyid'] as String,
      (json['lotvalue'] as num?)?.toDouble() ?? 100,
    );

Map<String, dynamic> _$SecDataToJson(SecData instance) => <String, dynamic>{
      'isin': instance.isin,
      'secid': instance.secid,
      'secname': instance.secname,
      'boardid': instance.boardid,
      'currencyid': instance.currencyid,
      'lotvalue': instance.lotvalue,
    };
