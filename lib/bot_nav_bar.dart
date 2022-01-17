import 'package:allocation/widgets/history_card.dart';
import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;

  static const String name = 'Абрау-Дюрсо ПАО ао';
  static const String currency = 'SUR';
  static const bool isSold = false;
  static const double cost = 88.34;
  static const int amount = 12;
  static const String secid = 'ABRD';
  static const String date = '12.08.2021';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Портфель',
      style: optionStyle,
    ),
    HistoryCard(
      name: name,
      currency: currency,
      isSold: isSold,
      cost: cost,
      amount: amount,
      secid: secid,
      date: date,
    ),
    Text(
      'Index 2: Пополнения и вывод',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Портфель',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Сделки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Пополнение и вывод',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
