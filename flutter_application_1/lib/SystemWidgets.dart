import 'package:flutter/material.dart';

Widget transactionWidget(Map<String, dynamic> transaction) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Row(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Color(0XFF042D33),
        child: Text(
          "F",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      SizedBox(
        width: 5,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From: " + transaction['benefitiaryName'],
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Bank: " + transaction['benefitiaryAccount'],
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (transaction['transactionTypeId'] == 2 ? "-" : "+") +
                transaction['amount'].toString() +
                " KES",
            style: TextStyle(
                fontSize: 15,
                color: transaction['transactionTypeId'] == 2
                    ? Colors.red
                    : Colors.black54),
          ),
          Text(
            "2021-15-12",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    ]),
  );
}
