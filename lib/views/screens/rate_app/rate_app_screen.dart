import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RateAppScreen extends StatelessWidget {
  
  static const String route = 'google-web-view'; 
  
   WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://play.google.com/store/games?hl=en&gl=US'));

  RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Play Web View'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
