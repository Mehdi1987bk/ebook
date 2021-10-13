import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kango/domain/entities/message.dart';
import 'package:kango/screens/utils/text_style.dart';

class MessageItem extends StatefulWidget {
  final Message message;

  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
          child: Builder(
            builder: (context) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ExpandablePanel(
                collapsed: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 19, top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(widget.message.updatedAt.toString(),style: TextStyles.styleText2,)),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(widget.message.content,style: TextStyles.styleText17,textAlign: TextAlign.start,),
                        ),
                      ],
                    )),
                expanded: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
