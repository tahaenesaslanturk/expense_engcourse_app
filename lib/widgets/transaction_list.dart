import '../models/transaction.dart';
import 'transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * 0.6,
                  ))
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      transaction: tx,
                      deleteTx: deleteTx,
                      key: ValueKey(tx.id),
                    ))
                .toList());
  }
}
