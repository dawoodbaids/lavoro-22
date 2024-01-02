import 'package:flutter/material.dart';

import 'chat_body.dart';

class ChatUser extends StatelessWidget {
  const ChatUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatBody(),
    );
  }
}
