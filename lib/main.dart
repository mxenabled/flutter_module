import 'package:flutter/material.dart';
import 'accounts_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: Center(child: JSONListView()),
    ));
  }
}

double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else {
    return value.toDouble();
  }
}

class JSONListView extends StatefulWidget {
  const JSONListView({super.key});
  AccountsListView createState() => AccountsListView();
}
