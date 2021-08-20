import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/order.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/common/image_selector.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class OrderInfoDialog extends StatefulWidget {
  final Order order;

  const OrderInfoDialog({Key? key, required this.order}) : super(key: key);

  @override
  _OrderInfoDialogState createState() => _OrderInfoDialogState();
}

class _OrderInfoDialogState extends State<OrderInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: AppColors.homeButtonDontHover,
        contentPadding: EdgeInsets.zero,
        children: [
          _DialogItem(
            title: S.of(context).scStatus,
            value: widget.order.price,
          ),
          _DialogItem(
            title: S.of(context).scStatus,
            value: widget.order.price,
          ),
          _DialogItem(
            title: S.of(context).scStatus,
            value: widget.order.price,
          ),
          _DialogItem(
            title: S.of(context).scStatus,
            value: widget.order.price,
          ),
          _DialogItem(
            title: S.of(context).scStatus,
            value: widget.order.price,
          ),
          _FileItem(
            url: 'https://unsplash.com/photos/XT9iDcKESjE/download?force=true',
          )
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

class _FileItem extends StatefulWidget {
  final String url;

  const _FileItem({Key? key, required this.url}) : super(key: key);

  @override
  _FileItemState createState() => _FileItemState();
}

class _FileItemState extends State<_FileItem> {
  bool _permissionReady = false;
  late String _localPath;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

      await  _prepare();
      _downloadFile();
      },
      child: Container(
        child: Text('fdfdfdfd'),
      ),
    );
  }

  _downloadFile() async {
    if (!_permissionReady) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return _buildNoPermissionWarning();
        },
      );
      return;
    }

    final taskId = await FlutterDownloader.enqueue(
      url: widget.url,
      savedDir: _localPath,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  Future<String?> _findLocalPath() async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory?.path;
  }

  Future<void> _prepareSaveDir() async {
    _localPath =
        (await _findLocalPath())! + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<bool> _checkPermission() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Null> _prepare() async {
    _permissionReady = await _checkPermission();

    if (_permissionReady) {
      await _prepareSaveDir();
    }
  }

  Widget _buildNoPermissionWarning() => Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  S.of(context).pleaseGrantAccessingStoragePermissionToContinue,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              FlatButton(
                  onPressed: () {
                    _retryRequestPermission();
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).retry,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      );

  Future<void> _retryRequestPermission() async {
    final hasGranted = await _checkPermission();

    if (hasGranted) {
      await _prepareSaveDir();
    }
    _permissionReady = hasGranted;
  }
}
