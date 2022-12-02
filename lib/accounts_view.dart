import 'package:flutter/material.dart';
import 'package:mx_mobile_flutter/mx_mobile_flutter.dart';

import 'transactions_view.dart';
import 'package:mxmobile_models/mxmobile_models.dart';

class AccountsListView extends State {
  @override
  Widget build(BuildContext context) {
    MXMobileFlutter.getInstance().initialize(context);


    return Scaffold(
      // app bar is not required as main application's app bar is displayed.
      body: FutureBuilder<List<AtlasAbacusAccount>?>(
        future: MXMobileFlutter.getInstance().getAccounts(params: ""),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!
                .map(
                  (account) => ListTile(
                    title: Text(account.name!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                    subtitle: Text('Balance: ${account.balance}'),
                    leading: const Icon(Icons.account_balance),
                    trailing: Text(account.balance.toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TransactionsScreen(account: account),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
