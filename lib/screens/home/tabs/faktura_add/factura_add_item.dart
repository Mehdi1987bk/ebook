import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kango/data/network/request/send_declarations.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/common/user_details.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/demical_number_validator.dart';
import 'package:kango/screens/utils/menu_utils.dart';
import 'package:kango/screens/utils/patterns.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../home_header.dart';
import '../../home_screen.dart';

class InputTextd extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.splBag,
      drawer: MenuUtils(),
      key: scaffoldKey,
      body: Container(
          width: MediaQuery.of(context).size.width / 0.3,
          child: Column(
            children: [
              Column(
                children: [
                  HomeHeader(
                    onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
                  ),
                ],
              ),

              Expanded(child: FactureItem())
            ],
          )),
    );
  }
}

class FactureItem extends StatefulWidget {
  @override
  _FactureItemState createState() => _FactureItemState();
}

class _FactureItemState extends State<FactureItem> {
  final TextEditingController _kodFacturaController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  FileType _pickingType = FileType.any;
  final List<File> _paths = [];

  @override
  void initState() {
    super.initState();
    _kodFacturaController.addListener(_validate);
    _priceController.addListener(_validate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SimpleDialogOption(
            padding: EdgeInsets.only(bottom: 0,top: 0,left: 20),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Row(
              children: [
                Image.asset("asset/vektor_23.png"),
                const SizedBox(
                  width: 18,
                ),
                 Text(S.of(context).anaShif,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
          UserDetails(),
          Container(
            margin: EdgeInsets.only(top: 27,bottom: 30,left: 16,right: 16),
            height: 1,
            color: AppColors.appColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 23),
            child: Row(
              children: [
                Text(
                  S.of(context).fakturaLavEtcsa,
                  style: TextStyles.styleText4,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).kargoNmrsi,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: TextField(
              controller: _kodFacturaController,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: S.of(context).kgo9920xxxxxx,
                hintStyle: const TextStyle(color: AppColors.buttonText),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.appColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.appColor)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).fakturaQiymti,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: TextField(
              inputFormatters: [
                ValidatorInputFormatter(
                    editingValidator: DecimalNumberEditingRegexValidator())
              ],
              controller: _priceController,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: S.of(context).mhsulunQiymtiTl,
                hintStyle: const TextStyle(color: AppColors.buttonText),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.appColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.appColor)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 5, top: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                S.of(context).faktura,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 18, right: 18),
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
              onPressed: _openFileExplorer,
              child: Text(S.of(context).fakturaLavEdin),
            ),
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            margin: const EdgeInsets.symmetric(vertical: 34),
            child: ValueListenableBuilder<bool>(
              valueListenable: _valueNotifier,
              builder: (BuildContext context, value, Widget? child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.buttonBacgraund,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: value ? _sendDeclaration : null,
                  child: Text(S.of(context).tsdiqEt),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openFileExplorer() async {
    List<PlatformFile>? _platformPaths;
    try {
      // _directoryPath = null;
      _platformPaths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        // allowedExtensions: ['pdf', 'svg', 'jpg'],
      ))
          ?.files;
      print("PATH ${_paths.toString()}");
      if (!mounted) return;
      _paths.addAll(_platformPaths
              ?.where((element) => element.path != null)
              .map((e) => File(e.path!)) ??
          []);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
  }

  _sendDeclaration() {
    final kodFactura = _kodFacturaController.text;
    final price = _priceController.text;
    sl.get<OrderRepository>().sendDeclarations(
        SendDeclarationRequest(trackingNo: kodFactura, price: price),
        _paths.first);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _kodFacturaController.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid =
        Patterns.userName.hasMatch(_kodFacturaController.text.trim()) &&
            Patterns.price.hasMatch(_priceController.text.trim());
    _valueNotifier.value = isValid;
  }
}
