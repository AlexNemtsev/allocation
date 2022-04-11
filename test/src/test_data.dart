import 'package:allocation/src/dto/security_data.dart';
import 'package:allocation/src/dto/security_price.dart';

Map<String, String> boardIds = {
  'AFLT': 'TQBR', // Акции
  'TSPX': 'TQTD', // ETF, $
  'FXUS': 'TQTF', // ETF, ₽
  'TEUR': 'TQTE', // ETF, €
  'RU000A1004K1': 'TQCB', // Корп облигации
  'SU26220RMFS2': 'TQOB', // ОФЗ
  'AAPL': 'FQBR', // Иностранные акции
  'KO': 'FQBR' // Иностранные акции
};

// ignore: non_constant_identifier_names
List<dynamic> MOEXSecPrices = [
  {
    "charsetinfo": {"name": "utf-8"}
  },
  {
    "marketdata": [
      {"SECID": "ABRD", "LAST": 183.5},
      {"SECID": "ACKO", "LAST": null},
      {"SECID": "AFKS", "LAST": 13.89},
      {"SECID": "AFLT", "LAST": 38.8}
    ]
  }
];

List<SecPrice> secPrices = [
  SecPrice.fromJSON({'secid': "ABRD", 'price': 183.5}),
  SecPrice.fromJSON({'secid': "ACKO", 'price': null}),
  SecPrice.fromJSON({'secid': "AFKS", 'price': 13.89}),
  SecPrice.fromJSON({'secid': "AFLT", 'price': 38.8}),
];

List<SecPrice> secPricesUpdated = [
  SecPrice.fromJSON({'secid': "ABRD", 'price': 0}),
  SecPrice.fromJSON({'secid': "ACKO", 'price': 0})
];

List<SecPrice> dbSecPricesUpdated = [
  SecPrice.fromJSON({'secid': "ABRD", 'price': 0}),
  SecPrice.fromJSON({'secid': "ACKO", 'price': 0}),
  SecPrice.fromJSON({'secid': "AFKS", 'price': 13.89}),
  SecPrice.fromJSON({'secid': "AFLT", 'price': 38.8}),
];

// ignore: non_constant_identifier_names
List<dynamic> MOEXSharesData = [
  {
    "charsetinfo": {"name": "utf-8"}
  },
  {
    "securities": [
      {
        "SECID": "ABRD",
        "SECNAME": "Абрау-Дюрсо ПАО ао",
        "BOARDID": "TQBR",
        "ISIN": "RU000A0JS5T7",
        "CURRENCYID": "SUR"
      },
      {
        "SECID": "ACKO",
        "SECNAME": "АСКО-СТРАХОВАНИЕ ПАО ао",
        "BOARDID": "TQBR",
        "ISIN": "RU000A0JXS91",
        "CURRENCYID": "SUR"
      },
      {
        "SECID": "AFKS",
        "SECNAME": "АФК \"Система\" ПАО ао",
        "BOARDID": "TQBR",
        "ISIN": "RU000A0DQZE3",
        "CURRENCYID": "SUR"
      },
      {
        "SECID": "AFLT",
        "SECNAME": "Аэрофлот-росс.авиалин(ПАО)ао",
        "BOARDID": "TQBR",
        "ISIN": "RU0009062285",
        "CURRENCYID": "SUR"
      },
    ]
  },
];

List<SecData> sharesData = [
  SecData.fromJSON({
    'secid': "ABRD",
    'secname': "Абрау-Дюрсо ПАО ао",
    'boardid': "TQBR",
    'isin': "RU000A0JS5T7",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
  SecData.fromJSON({
    'secid': "ACKO",
    'secname': "АСКО-СТРАХОВАНИЕ ПАО ао",
    'boardid': "TQBR",
    'isin': "RU000A0JXS91",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
  SecData.fromJSON({
    'secid': "AFKS",
    'secname': "АФК \"Система\" ПАО ао",
    'boardid': "TQBR",
    'isin': "RU000A0DQZE3",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
  SecData.fromJSON({
    'secid': "AFLT",
    'secname': "Аэрофлот-росс.авиалин(ПАО)ао",
    'boardid': "TQBR",
    'isin': "RU0009062285",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
];

List<SecData> sharesDataUpd = [
  SecData.fromJSON({
    'secid': "ABRD",
    'secname': "Абрау",
    'boardid': "TQBR",
    'isin': "RU000A0JS5T7",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
];

List<SecData> dbSharesDataUpd = [
  SecData.fromJSON({
    'secid': "ABRD",
    'secname': "Абрау",
    'boardid': "TQBR",
    'isin': "RU000A0JS5T7",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
  SecData.fromJSON({
    'secid': "ACKO",
    'secname': "АСКО-СТРАХОВАНИЕ ПАО ао",
    'boardid': "TQBR",
    'isin': "RU000A0JXS91",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
  SecData.fromJSON({
    'secid': "AFKS",
    'secname': "АФК \"Система\" ПАО ао",
    'boardid': "TQBR",
    'isin': "RU000A0DQZE3",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
  SecData.fromJSON({
    'secid': "AFLT",
    'secname': "Аэрофлот-росс.авиалин(ПАО)ао",
    'boardid': "TQBR",
    'isin': "RU0009062285",
    'currencyid': "SUR",
    'lotvalue': 100,
  }),
];
