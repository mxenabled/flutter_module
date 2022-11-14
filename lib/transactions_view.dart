import 'package:flutter/material.dart';

import 'package:mx_mobile_flutter/mx_mobile_flutter.dart';
import 'package:mx_mobile_flutter/account.dart';
import 'package:mx_mobile_flutter/transaction.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key, required this.account});
  final Account account;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(account.name),
      // ),
      body: FutureBuilder<List<Transaction>?>(
        future: MXMobileFlutter.getInstance().getTransactions(account.guid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!
                .map(
                  (transaction) => ListTile(
                    title: Text(transaction.description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                    subtitle: Text('Amount: ${transaction.amount}'),
                    leading: const Icon(Icons.shop),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
