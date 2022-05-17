import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaymentTlScreen extends StatefulWidget {
  final String url;

  const PaymentTlScreen({Key? key, required this.url}) : super(key: key);

  @override
  _PaymentTlScreenState createState() => _PaymentTlScreenState();
}

class _PaymentTlScreenState extends State<PaymentTlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          // onPageFinished: (url) {
          //   print("On Page finished            " + url);
          // },
          // onPageStarted: (url) {
          //   print("On Page starteeeed            " + url);
          //   if (url == "https://mojo.az/") {
          //     Navigator.pushReplacement(
          //         context,
          //         CupertinoPageRoute(
          //             builder: (_) => SuccessfulPaymentScreen()));
          //   }
          // },
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          navigationDelegate: (delegate) {
            print("Redireeeeeect     " + delegate.url);
            FocusScope.of(context).unfocus();
            if (Uri.parse(delegate.url).host == "bookleaks.org") {
              Navigator.pop(context, true);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
