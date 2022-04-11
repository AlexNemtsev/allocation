// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecPrice _$SecPriceFromJson(Map<String, dynamic> json) => SecPrice(
      json['secid'] as String,
      (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SecPriceToJson(SecPrice instance) => <String, dynamic>{
      'secid': instance.secid,
      'price': instance.price,
    };
