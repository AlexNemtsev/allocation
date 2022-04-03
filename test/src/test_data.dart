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

List<SecurityPrice> secPrices = [
  SecurityPrice.fromJSON({"SECID": "ABRD", "LAST": 183.5}),
  SecurityPrice.fromJSON({"SECID": "ACKO", "LAST": null}),
  SecurityPrice.fromJSON({"SECID": "AFKS", "LAST": 13.89}),
  SecurityPrice.fromJSON({"SECID": "AFLT", "LAST": 38.8}),
];

List<Map<String, dynamic>> dbSecPrices = [
  {'secid': 'ABRD', 'price': 197},
  {'secid': 'ACKO', 'price': 5.26},
  {'secid': 'AFKS', 'price': 27.001},
  {'secid': 'AFLT', 'price': 66.04}
];

List<List> secPricesUpdated = [
  ["AFKS", 0],
  ["AFLT", 0]
];

List<Map<String, dynamic>> dbSecPricesUpdated = [
  {'secid': 'ABRD', 'price': 197},
  {'secid': 'ACKO', 'price': 5.26},
  {'secid': 'AFKS', 'price': 0},
  {'secid': 'AFLT', 'price': 0}
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

List<SecurityData> sharesData = [
  SecurityData.fromJSON({
    "SECID": "ABRD",
    "SECNAME": "Абрау-Дюрсо ПАО ао",
    "BOARDID": "TQBR",
    "ISIN": "RU000A0JS5T7",
    "CURRENCYID": "SUR"
  }),
  SecurityData.fromJSON({
    "SECID": "ACKO",
    "SECNAME": "АСКО-СТРАХОВАНИЕ ПАО ао",
    "BOARDID": "TQBR",
    "ISIN": "RU000A0JXS91",
    "CURRENCYID": "SUR"
  }),
  SecurityData.fromJSON({
    "SECID": "AFKS",
    "SECNAME": "АФК \"Система\" ПАО ао",
    "BOARDID": "TQBR",
    "ISIN": "RU000A0DQZE3",
    "CURRENCYID": "SUR"
  }),
  SecurityData.fromJSON({
    "SECID": "AFLT",
    "SECNAME": "Аэрофлот-росс.авиалин(ПАО)ао",
    "BOARDID": "TQBR",
    "ISIN": "RU0009062285",
    "CURRENCYID": "SUR"
  }),
];

List<List> sharesDataUpd = [
  ['RU000A0JS5T7', 'ABRD', 'Абрау', 'TQBR', 'SUR']
];

List<Map<String, dynamic>> dbSharesData = [
  {
    'secid': 'ABRD',
    'secname': 'Абрау-Дюрсо ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0JS5T7',
    'lotvalue': 100,
    'currencyid': 'SUR'
  },
  {
    'secid': 'ACKO',
    'secname': 'АСКО-СТРАХОВАНИЕ ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0JXS91',
    'lotvalue': 100,
    'currencyid': 'SUR'
  },
  {
    'secid': 'AFKS',
    'secname': 'АФК "Система" ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0DQZE3',
    'lotvalue': 100,
    'currencyid': 'SUR'
  },
  {
    'secid': 'AFLT',
    'secname': 'Аэрофлот-росс.авиалин(ПАО)ао',
    'boardid': 'TQBR',
    'isin': 'RU0009062285',
    'lotvalue': 100,
    'currencyid': 'SUR'
  }
];

List<Map<String, dynamic>> dbSharesDataUpd = [
  {
    'secid': 'ABRD',
    'secname': 'Абрау',
    'boardid': 'TQBR',
    'isin': 'RU000A0JS5T7',
    'lotvalue': 100,
    'currencyid': 'SUR'
  },
  {
    'secid': 'ACKO',
    'secname': 'АСКО-СТРАХОВАНИЕ ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0JXS91',
    'lotvalue': 100,
    'currencyid': 'SUR'
  },
  {
    'secid': 'AFKS',
    'secname': 'АФК "Система" ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0DQZE3',
    'lotvalue': 100,
    'currencyid': 'SUR'
  },
  {
    'secid': 'AFLT',
    'secname': 'Аэрофлот-росс.авиалин(ПАО)ао',
    'boardid': 'TQBR',
    'isin': 'RU0009062285',
    'lotvalue': 100,
    'currencyid': 'SUR'
  }
];
