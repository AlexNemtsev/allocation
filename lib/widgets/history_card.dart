import 'package:flutter/material.dart';
import 'package:allocation/widgets/card_elements.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {Key? key,
      required this.name,
      required this.currency,
      required this.isSold,
      required this.price,
      required this.amount,
      required this.secid,
      required this.date})
      : super(key: key);

  final String name;
  final String currency;
  final bool isSold;
  final double price;
  final int amount;
  final String secid;
  final String date;

  // TODO: Эту карточку с небольшими изменениями можно переиспользовать и в других экранах
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SecurityNameWidget(name: name),
              ),
              SecurityPriceWidget(
                  price: price, currency: currency, isSold: isSold)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SecidWidget(secid: secid),
              AmountWidget(amount: amount),
              DateWidget(date: date),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
