import 'package:flutter/material.dart';
import 'package:flutter_application_1/PaymentsPage.dart';

import 'SystemWidgets.dart';
import 'data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userObject = {
    "userId": '1',
    "fullname": "James Njuguna",
    "balance": 100001.0,
    "transactions": [
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
    ]
  };

  String username = "";
  double balance = 0.0;
  List<Map<String, dynamic>> transactions = [];

  void setData() {
    setState(() {
      var fullname = userObject['fullname'] as String;
      balance = userObject['balance'] as double;
      var part = fullname.split(" ");
      if (part.length > 1) {
        username = part[0];
      } else {
        username = fullname;
      }
      var uTranject = userObject['transactions'] ?? [];
      transactions = uTranject as List<Map<String, dynamic>>;
    });
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  fetchProfileData() {
    homePageData().then((value) {
      setState(() {
        userObject = value as Map<String, ObjectKey>;
      });
      setData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text(
                  "Hello ",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                ),
                Text(
                  "$username, ",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0XFF019087),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(children: [
                Container(
                  child: Icon(
                    Icons.credit_card,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Loan Balance",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Kes $balance",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                )
              ]),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Quick Actions",
                  style: TextStyle(fontSize: 20),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentsPage()),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 60,
                        ),
                        Text("Payments")
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentsPage()),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Icon(
                          Icons.wallet_travel_sharp,
                          size: 60,
                        ),
                        Text("Loans")
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentsPage()),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Icon(
                          Icons.payments_rounded,
                          size: 60,
                        ),
                        Text("Pay Loans")
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 15),
                )),
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
