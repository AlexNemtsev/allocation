// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityPrice _$SecurityPriceFromJson(Map<String, dynamic> json) =>
    SecurityPrice(
      json['SECID'] as String,
      (json['LAST'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SecurityPriceToJson(SecurityPrice instance) =>
    <String, dynamic>{
      'SECID': instance.secid,
      'LAST': instance.price,
    };
