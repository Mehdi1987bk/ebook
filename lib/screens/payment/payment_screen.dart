import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/repositories/payment_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/screens/payment/successful_payment_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final int amount;

  const PaymentScreen({Key? key, required this.amount}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final Future<String> paymentUrl;

  @override
  void initState() {
    super.initState();
    paymentUrl = sl.get<PaymentRepository>().getPaymentLink(widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<String>(
            future: paymentUrl,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return WebView(
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
                  initialUrl: snapshot.requireData,
                  navigationDelegate: (delegate) {
                    print("Redireeeeeect     " + delegate.url);
                    FocusScope.of(context).unfocus();
                    if(Uri.parse(delegate.url).host == "kango.az"){
                      Navigator.pop(context);
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                );
              }
              return const SizedBox();
            }),
      ),
    );
  }
}
