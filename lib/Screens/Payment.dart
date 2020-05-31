import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'orderstatus.dart';

class Payment extends StatefulWidget {
  final String url;
  final int orderId;
  Payment(this.url, this.orderId);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Оплата продуктов",
            style: TextStyle(
              color: Colors.black,
            )),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 47,
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            size: 22,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.done, color: Colors.green),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OrderStatus(widget.orderId)),
                    (Route<dynamic> route) => false);
              }),
        ],
      ),
      body: IndexedStack(
        index: 0,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
