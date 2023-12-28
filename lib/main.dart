
import 'package:flutter/material.dart';
import 'package:rough/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() => runApp (
  const MaterialApp(
    
    home: WebviewExample(),
    )
);
class WebviewExample extends StatefulWidget {
  const WebviewExample({super.key});

  @override
  State<WebviewExample> createState() => _WebviewExampleState();
}

class _WebviewExampleState extends State<WebviewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Flutter'),
      ),
      body: ElevatedButton(child: Text("web"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView(),));
      }),
    );
  }
}


 
