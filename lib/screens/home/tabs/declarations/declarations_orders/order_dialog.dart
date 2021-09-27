import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/order.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void downloadCallback(String id, DownloadTaskStatus status, int progress) {}

class OrderInfoDialog extends StatefulWidget {
  final Order order;
  final Declaration declaration;

  const OrderInfoDialog({
    Key? key,
    required this.order,
    required this.declaration,
  }) : super(key: key);

  @override
  _OrderInfoDialogState createState() => _OrderInfoDialogState();
}

class _OrderInfoDialogState extends State<OrderInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        elevation: 10,
        insetPadding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
        backgroundColor: AppColors.homeButtonDontHover,
        contentPadding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              top: 12,
              left: 14,
            ),
            child: Row(
              children: [
                Text(
                  S.of(context).trafl,
                  style: TextStyles.styleText5,
                ),
                const Spacer(),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15, left: 14, right: 14),
            height: 1,
            color: Colors.grey.withOpacity(0.8),
          ),
          _DialogItem(
            title: S.of(context).kod,
            value: widget.declaration.fullCode,
          ),
          _DialogItem(
            title: S.of(context).maazavd,
            value: widget.order.shopName,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 0.3,
            padding: const EdgeInsets.only(left: 16, bottom: 5, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).fakturaQiymti, style: TextStyles.styleText6),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      widget.declaration.ordersTotal.toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.5,left: 2),
                      child: Image.asset('asset/tl.png',width: 9,),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 12),
                  height: 1,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ],
            ),
          ),
          _DialogItem(
            title: S.of(context).kargoTakipNo,
            value: widget.order.trackingCode,
          ),
          _DialogItem(
            title: S.of(context).ki,
            value: '${widget.declaration.cargoWeight} ${S.of(context).kq}',
          ),
          _DialogItem(
            title: S.of(context).atdrlma,
            value: widget.declaration.cargoTotal,
          ),
          _DialogItem(
            title: S.of(context).statuss,
            value: widget.declaration.statusStr,
          ),
          _DialogItem(
            title: S.of(context).scStatuss,
            value: widget.declaration.scStatusFront,
          ),
          _DialogItem(
            title: S.of(context).qeyd,
            value: widget.order.details,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15),
            child: Text(S.of(context).faktura, style: TextStyles.styleText6),
          ),
          const _FileItem(
            //Todo Foto downlide
            url: "widget.orderPhotos.photo",
          ),
          _DialogItem(
            title: S.of(context).mhsulunSay,
            value: widget.order.quantity.toString(),
          ),
          _DialogItem(
            title: S.of(context).lavXidmtlr,
            value: widget.order.price,
          ),
          _DialogItem(
            title: S.of(context).kateqoriya,
            value: widget.order.price,
          ),
          _DialogItem(
            title: S.of(context).dm,
            value: widget.order.price,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(S.of(context).mliyyatlar, style: TextStyles.styleText6),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 29, right: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 158,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.onbording1,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 11),
                          margin: const EdgeInsets.all(6),
                          child: Text(S.of(context).dniEdin,
                              style: TextStyles.styleText8),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Image.asset('asset/cart.png'),
                        ),
                      ],
                    )),
              ],
            ),
          ),
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
      this.style = TextStyles.styleText7})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 0.3,
      padding: const EdgeInsets.only(left: 16, bottom: 5, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.styleText6),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15, top: 12),
            height: 1,
            color: Colors.grey.withOpacity(0.8),
          ),
        ],
      ),
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
  dynamic taskId;

  @override
  void initState() {
    super.initState();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14),
      margin: const EdgeInsets.only(bottom: 19),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.appColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () async {
          if (taskId != null) {
            await _openDownloadedFile();
          } else {
            await _displayFile();
          }
        },
        child: Row(
          children: [
            Text(S.of(context).endirin),
            const Spacer(),
            Image.asset('asset/u_export.png')
          ],
        ),
      ),
    );
  }

  Future<bool> _openDownloadedFile() {
    if (taskId != null) {
      return FlutterDownloader.open(taskId: taskId!);
    } else {
      return Future.value(false);
    }
  }

  Future<void> _displayFile() async {
    if (Platform.isAndroid) {
      await _prepare();
      _downloadFile();
    } else if (Platform.isIOS) {
      await _prepare();
      _downloadFile();
    }
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

    taskId = await FlutterDownloader.enqueue(
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
