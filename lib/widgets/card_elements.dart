import 'package:flutter/material.dart';

// TODO: нужно, чтобы цвет элементов мог изменяться в зависимость от купли/продажи, прибыли/убытка
const fistLineStyle = TextStyle(fontSize: 20, color: Color(0xFF1b5e20));
const secondLineStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF33691e),
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
);

class SecurityNameWidget extends StatelessWidget {
  final String name;

  const SecurityNameWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // 'Длинное название ценной бумаги',
      name,
      style: fistLineStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class SecurityPriceWidget extends StatelessWidget {
  final String currency;
  final bool isSold;
  final double price;

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

  const SecurityPriceWidget(
      {Key? key,
      required this.price,
      required this.currency,
      required this.isSold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: isSold ? kArrowUp : kArrowDown,
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(text: '${curs[currency]}$price', style: fistLineStyle)
        ],
      ),
    );
  }
}

class SecidWidget extends StatelessWidget {
  const SecidWidget({Key? key, required this.secid}) : super(key: key);

  final String secid;

  @override
  Widget build(BuildContext context) {
    return Text(
      secid,
      style: secondLineStyle,
    );
  }
}

class AmountWidget extends StatelessWidget {
  const AmountWidget({Key? key, required this.amount}) : super(key: key);

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$amountшт.',
      style: secondLineStyle,
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: secondLineStyle,
    );
  }
}
