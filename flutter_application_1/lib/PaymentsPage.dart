import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import 'SystemWidgets.dart';
import 'data.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  List<Map<String, dynamic>> transactions = [
    {
      "transactionId": 2,
      "transactionTypeId": 2,
      "amount": 8900.0,
      "benefitiaryName": "John doe",
      "benefitiaryAccount": "254724040350"
    },
    {
      "transactionId": 1,
      "transactionTypeId": 1,
      "amount": 900.0,
      "benefitiaryName": "John doe",
      "benefitiaryAccount": "254724040350"
    }
  ];

  String start = "2022-07-01";
  String end = "2022-07-20";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  fetchTransactions() {
    transactionsList(start, end).then((value) {
      setState(() {
        transactions = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment History"),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From"),
                          TextButton(
                              onPressed: () {}, child: Text('1 Jul 2022'))
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To"),
                          TextButton(
                              onPressed: () {}, child: Text('13 Jul 2022'))
                        ],
                      ),
                    ),
                  ]),
            )
          ]),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return (transactionWidget(transactions[index]));
        }, childCount: transactions.length))
      ]),
    );
  }
}
