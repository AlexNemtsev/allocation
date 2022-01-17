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
Map<String, dynamic> MOEXSecPrices = {
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

List<List> secPrices = [
  ["ABRD", 197],
  ["ACKO", 5.26],
  ["AFKS", 27.001],
  ["AFLT", 66.04]
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
Map<String, dynamic> MOEXSharesData = {
  'securities': {
    'columns': ['SECID', 'SECNAME', 'BOARDID', 'ISIN'],
    'data': [
      ['RU000A0JS5T7', 'ABRD', 'Абрау-Дюрсо ПАО ао', 'TQBR'],
      ['RU000A0JXS91', 'ACKO', 'АСКО-СТРАХОВАНИЕ ПАО ао', 'TQBR'],
      ['RU000A0DQZE3', 'AFKS', 'АФК "Система" ПАО ао', 'TQBR'],
      ['RU0009062285', 'AFLT', 'Аэрофлот-росс.авиалин(ПАО)ао', 'TQBR']
    ]
  }
};

List<List> sharesData = [
  ['RU000A0JS5T7', 'ABRD', 'Абрау-Дюрсо ПАО ао', 'TQBR'],
  ['RU000A0JXS91', 'ACKO', 'АСКО-СТРАХОВАНИЕ ПАО ао', 'TQBR'],
  ['RU000A0DQZE3', 'AFKS', 'АФК "Система" ПАО ао', 'TQBR'],
  ['RU0009062285', 'AFLT', 'Аэрофлот-росс.авиалин(ПАО)ао', 'TQBR']
];

List<List> sharesDataUpd = [
  ['ABRD', 'Абрау', 'TQBR', 'RU000A0JS5T7']
];

List<Map<String, dynamic>> dbSharesData = [
  {
    'secid': 'ABRD',
    'secname': 'Абрау-Дюрсо ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0JS5T7',
    'lotvalue': 100
  },
  {
    'secid': 'ACKO',
    'secname': 'АСКО-СТРАХОВАНИЕ ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0JXS91',
    'lotvalue': 100
  },
  {
    'secid': 'AFKS',
    'secname': 'АФК "Система" ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0DQZE3',
    'lotvalue': 100
  },
  {
    'secid': 'AFLT',
    'secname': 'Аэрофлот-росс.авиалин(ПАО)ао',
    'boardid': 'TQBR',
    'isin': 'RU0009062285',
    'lotvalue': 100
  }
];

List<Map<String, dynamic>> dbSharesDataUpd = [
  {
    'secid': 'ABRD',
    'secname': 'Абрау',
    'boardid': 'TQBR',
    'isin': 'RU000A0JS5T7',
    'lotvalue': 100
  },
  {
    'secid': 'ACKO',
    'secname': 'АСКО-СТРАХОВАНИЕ ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0JXS91',
    'lotvalue': 100
  },
  {
    'secid': 'AFKS',
    'secname': 'АФК "Система" ПАО ао',
    'boardid': 'TQBR',
    'isin': 'RU000A0DQZE3',
    'lotvalue': 100
  },
  {
    'secid': 'AFLT',
    'secname': 'Аэрофлот-росс.авиалин(ПАО)ао',
    'boardid': 'TQBR',
    'isin': 'RU0009062285',
    'lotvalue': 100
  }
];
