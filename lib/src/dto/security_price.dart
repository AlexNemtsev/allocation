import 'package:json_annotation/json_annotation.dart';

part 'security_price.g.dart';

@JsonSerializable()
class SecPrice {
  final String secid;
  final double? price;

  SecPrice(this.secid, this.price);

  factory SecPrice.fromJSON(Map<String, dynamic> json) => _$SecPriceFromJson(json);

  Map<String, dynamic> toJSON() => _$SecPriceToJson(this);

  @override
  bool operator ==(Object other) =>
      other is SecPrice && other.secid == secid && other.price == price;

  @override
  int get hashCode => secid.hashCode ^ price.hashCode;

  SecPrice copyWith({
    String? secid,
    double? price,
  }) {
    return SecPrice(
      secid ?? this.secid,
      price ?? this.price,
    );
  }
}
