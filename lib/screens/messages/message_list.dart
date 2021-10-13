import 'package:flutter/material.dart';
import 'package:kango/domain/entities/message.dart';

import 'message_ithem.dart';

class MessageList extends StatelessWidget {
  final List<Message> data;

  const MessageList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      return MessageItem(message: data[index]);
    }, childCount: data.length));
  }
}
