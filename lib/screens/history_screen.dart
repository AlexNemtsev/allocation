import 'package:allocation/widgets/history_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  // TODO: Для данных нужно разработать DTO
  static const List<Map<String, dynamic>> history = [
    {
      'name': 'ПАО ЗАО Рога и копыта ао и ап ГДР',
      'currency': 'SUR',
      'isSold': false,
      'cost': 88.34,
      'amount': 12,
      'secid': 'ABRD',
      'date': '12.08.2021'
    },
    {
      'name': 'Абрау-Дюрсо ПАО ао',
      'currency': 'SUR',
      'isSold': false,
      'cost': 88.34,
      'amount': 12,
      'secid': 'ABRD',
      'date': '12.08.2021'
    },
    {
      'name': 'Абрау-Дюрсо ПАО ао',
      'currency': 'SUR',
      'isSold': false,
      'cost': 88.34,
      'amount': 12,
      'secid': 'ABRD',
      'date': '12.08.2021'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemCount: history.length,
      itemBuilder: (context, index) => HistoryCard(
          name: history[index]['name'],
          currency: history[index]['currency'],
          isSold: history[index]['isSold'],
          price: history[index]['cost'], //
          amount: history[index]['amount'],
          secid: history[index]['secid'],
          date: history[index]['date']),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
