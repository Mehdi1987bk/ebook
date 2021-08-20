import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/order.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/common/image_selector.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/text_style.dart';

class OrderEdit extends StatefulWidget {

  @override
  _OrderInfoDialogState createState() => _OrderInfoDialogState();
}

class _OrderInfoDialogState extends State<OrderEdit> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: AppColors.homeButtonDontHover,
        contentPadding: EdgeInsets.zero,
        children: [
          _DialogItem(
            title: S.of(context).scStatus,
            value: "widget.order.price",
          ),

          _ImageItem()
        ]);
  }
}

class _DialogItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle style;

  const _DialogItem(
      {Key? key,
        required this.title,
        required this.value,
        this.style = TextStyles.styleText2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(
          value,
          style: style,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 17, top: 20),
          height: 1,
          color: AppColors.appColor,
        ),
      ],
    );
  }
}

class _ImageItem extends StatefulWidget {
  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<_ImageItem> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePicker,
      child: Container(
        child: Row(
          children: [
            Text(
                _file == null?
                S.of(context).endirin : _file!.path.toString()
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePicker() async {
    FocusScope.of(context).unfocus();
    final ImageSource source = await showSelectImageSourceAlert(context);
    if (source != null) {
      _selectImage(source);
    }
  }

  void _selectImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker()
        .getImage(source: imageSource, maxWidth: 600, maxHeight: 600);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }
}
