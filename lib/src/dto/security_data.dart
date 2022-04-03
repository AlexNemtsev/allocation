import 'package:json_annotation/json_annotation.dart';

part 'security_data.g.dart';

@JsonSerializable()
class SecurityData {
  @JsonKey(name: 'ISIN')
  final String isin;
  @JsonKey(name: 'SECID')
  final String secid;
  @JsonKey(name: 'SECNAME')
  final String secName;
  @JsonKey(name: 'BOARDID')
  final String boardID;
  @JsonKey(name: 'CURRENCYID')
  final String currencyID;
  @JsonKey(name: 'LOTVALUE', defaultValue: 100)
  final double lotValue;

  SecurityData(this.isin, this.secid, this.secName, this.boardID,
      this.currencyID, this.lotValue);

  factory SecurityData.fromJSON(Map<String, dynamic> json) =>
      _$SecurityDataFromJson(json);

  Map<String, dynamic> toJSON() => _$SecurityDataToJson(this);

  @override
  bool operator ==(Object other) =>
      other is SecurityData && other.isin == isin && other.boardID == boardID;

  // TODO: переделать hashCode
  @override
  int get hashCode => '$isin$boardID'.hashCode;

}
