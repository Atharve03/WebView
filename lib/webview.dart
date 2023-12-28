import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rough/ModelWebView.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-App WebView JSON Example',
      home: MyWebView(),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString("assets/json/Webview.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = json.decode(snapshot.data!);
          ModelWebView modelWebView = ModelWebView.fromJson(list);
          // WebViewData webViewData = WebViewData.fromJson(list);
          // print("listtttlll${webViewData.link}");
          print("listtttlll${modelWebView.webViewData!.link}");

          return Container(
              margin: EdgeInsets.all(modelWebView.webViewData!.margin!),
              padding: EdgeInsets.all(modelWebView.webViewData!.padding!),
              child: InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: WebUri(modelWebView.webViewData!.link!)),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                    _loadContent(modelWebView.webViewData!);
                  }));
        } else if (snapshot.hasError) {
          return Text("Error loading json");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _loadContent(WebViewData webViewData) {
    try {
      // _webViewController.setBackgroundColor(color: webViewData.backgroundColor);

      // Load content based on the content type
      if (webViewData.contentType == 'html') {
        String htmlContent = '''
                  <html>
                  <head><meta name="viewport" content="width=device-width, initial-scale=${webViewData.scaleSize}"></head>
                 <body> ${webViewData.htmlContent!} </body>
                  </html>
                  ''';

        _webViewController.loadData(
          data: htmlContent,
          mimeType: 'text/html',
          encoding: 'utf8',
        );
      } else if (webViewData.contentType == 'link') {
        _webViewController.loadUrl(
            urlRequest: URLRequest(url: WebUri(webViewData.link!)));
      }
    } catch (e) {
      print('Error loading content: $e');
    }
  }

  Color _hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
