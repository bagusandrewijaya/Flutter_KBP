import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WebChatting extends StatelessWidget {
  const WebChatting({Key? key, required this.chatdirect}) : super(key: key);
  final chatdirect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(chatdirect)),
    );
  }
}
