import 'dart:developer';

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

class JSONListView extends StatefulWidget {
  const JSONListView({super.key});
  AccountsListView createState() => AccountsListView();
}
