import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {Key? key,
      required this.name,
      required this.currency,
      required this.isSold,
      required this.cost,
      required this.amount,
      required this.secid,
      required this.date})
      : super(key: key);

  static final fistLineStyle =
      TextStyle(fontSize: 25, color: Colors.green[900]);
  static final secondLineStyle = TextStyle(
    fontSize: 18,
    color: Colors.lightGreen[900],
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );

  final String name;
  final String currency;
  final bool isSold;
  final double cost;
  final int amount;
  final String secid;
  final String date;

  static const kArrowDown = Icon(
    Icons.arrow_drop_down,
    size: 30,
    color: Colors.green,
  );

  static const kArrowUp = Icon(
    Icons.arrow_drop_up,
    size: 30,
    color: Colors.red,
  );

  static const Map<String, String> curs = {'SUR': '₽', 'USD': '\$', 'EUR': '€'};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    // 'Длинное название ценной бумаги',
                    name,
                    style: fistLineStyle,
                  ),
                ),
              ),
              isSold ? kArrowUp : kArrowDown,
              Text(
                '${curs[currency]}$cost',
                style: fistLineStyle,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                secid,
                style: secondLineStyle,
              ),
              Text(
                '$amountшт.',
                style: secondLineStyle,
              ),
              Text(
                date,
                style: secondLineStyle,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
      ),
    );
  }
}
