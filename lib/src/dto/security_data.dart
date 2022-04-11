import 'package:json_annotation/json_annotation.dart';

part 'security_data.g.dart';

@JsonSerializable()
class SecData {
  final String isin;
  final String secid;
  final String secname;
  final String boardid;
  final String currencyid;
  @JsonKey(defaultValue: 100)
  final double lotvalue;

  SecData(this.isin, this.secid, this.secname, this.boardid,
      this.currencyid, this.lotvalue);

  factory SecData.fromJSON(Map<String, dynamic> json) =>
      _$SecDataFromJson(json);

  Map<String, dynamic> toJSON() => _$SecDataToJson(this);

  @override
  int get hashCode {
    return isin.hashCode ^
      secid.hashCode ^
      secname.hashCode ^
      boardid.hashCode ^
      currencyid.hashCode ^
      lotvalue.hashCode;
  }

  SecData copyWith({
    String? isin,
    String? secid,
    String? secname,
    String? boardid,
    String? currencyid,
    double? lotvalue,
  }) {
    return SecData(
      isin ?? this.isin,
      secid ?? this.secid,
      secname ?? this.secname,
      boardid ?? this.boardid,
      currencyid ?? this.currencyid,
      lotvalue ?? this.lotvalue,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SecData &&
      other.isin == isin &&
      other.secid == secid &&
      other.secname == secname &&
      other.boardid == boardid &&
      other.currencyid == currencyid &&
      other.lotvalue == lotvalue;
  }
}
