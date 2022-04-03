import 'package:json_annotation/json_annotation.dart';

part 'security_price.g.dart';

@JsonSerializable()
class SecurityPrice {
  @JsonKey(name: 'SECID')
  final String secid;
  @JsonKey(name: 'LAST')
  final double? price;

  SecurityPrice(this.secid, this.price);

  factory SecurityPrice.fromJSON(Map<String, dynamic> json) =>
      _$SecurityPriceFromJson(json);

  Map<String, dynamic> toJSON() => _$SecurityPriceToJson(this);

  @override
  bool operator ==(Object other) =>
      other is SecurityPrice && other.secid == secid && other.price == price;

  @override
  int get hashCode => secid.hashCode * 1000000 + price.hashCode;
}
