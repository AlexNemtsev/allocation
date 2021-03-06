Map<String, dynamic> sharesBoardIds = {
  "securities": {
    "columns": ["secid", "primary_boardid"],
    "data": [
      ["AFLT", "TQBR"],
      ["AFLT_CLT", "RFUD"]
    ]
  }
};

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
Map<String, dynamic> MOEXSharesPrices = {
  "marketdata": {
    "columns": ["SECID", "LAST"],
    "data": [
      ["ABRD", 197],
      ["ACKO", 5.26],
      ["AFKS", 27.001],
      ["AFLT", 66.04]
    ]
  }
};

// ignore: non_constant_identifier_names
Map<String, dynamic> MOEXSharesData = {
  'securities': {
    'columns': ['SECID', 'SECNAME', 'BOARDID', 'ISIN'],
    'data': [
      ['ABRD', 'Абрау-Дюрсо ПАО ао', 'TQBR', 'RU000A0JS5T7'],
      ['ACKO', 'АСКО-СТРАХОВАНИЕ ПАО ао', 'TQBR', 'RU000A0JXS91'],
      ['AFKS', 'АФК "Система" ПАО ао', 'TQBR', 'RU000A0DQZE3'],
      ['AFLT', 'Аэрофлот-росс.авиалин(ПАО)ао', 'TQBR', 'RU0009062285']
    ]
  }
};

// Map<String, List<String>> sharesData = {
//   'ABRD': ['Абрау-Дюрсо ПАО ао', 'TQBR', 'RU000A0JS5T7'],
//   'ACKO': ['АСКО-СТРАХОВАНИЕ ПАО ао', 'TQBR', 'RU000A0JXS91'],
//   'AFKS': ['АФК "Система" ПАО ао', 'TQBR', 'RU000A0DQZE3'],
//   'AFLT': ['Аэрофлот-росс.авиалин(ПАО)ао', 'TQBR', 'RU0009062285']
// };

List<dynamic> sharesData = [
  ['ABRD', 'Абрау-Дюрсо ПАО ао', 'TQBR', 'RU000A0JS5T7'],
  ['ACKO', 'АСКО-СТРАХОВАНИЕ ПАО ао', 'TQBR', 'RU000A0JXS91'],
  ['AFKS', 'АФК "Система" ПАО ао', 'TQBR', 'RU000A0DQZE3'],
  ['AFLT', 'Аэрофлот-росс.авиалин(ПАО)ао', 'TQBR', 'RU0009062285']
];

List<List<dynamic>> securitiesPrices = [
  ["ABRD", 197],
  ["ACKO", 5.26],
  ["AFKS", 27.001],
  ["AFLT", 66.04]
];
