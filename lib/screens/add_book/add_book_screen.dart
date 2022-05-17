import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/presentation/bloc/base_screen.dart';
import 'package:kango/screens/add_book/add_book_bloc.dart';
import 'package:kango/screens/add_book/category_selector.dart';
import 'package:kango/screens/utils/patterns.dart';

import '../../data/network/request/create_book_request.dart';
import '../../generated/l10n.dart';
import '../../presentation/common/image_selector.dart';
import '../../presentation/common/pop_up_selector.dart';
import '../../presentation/resourses/app_colors.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../utils/decimal_textInput_formatter.dart';

class AddBookScreen extends BaseScreen {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends BaseState<AddBookScreen, AddBookBloc> {
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();

  final TextEditingController _title = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _publisherName = TextEditingController();
  final TextEditingController _isbn = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _shortDescription = TextEditingController();
  final TextEditingController _passwordProtected = TextEditingController();
  bool _isChecked = true;

  @override
  Widget body() {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: _selectImage,
              child: StreamBuilder<File>(
                stream: bloc.bookImage,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.file(
                      snapshot.requireData,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                    );
                  }
                  return Image.asset(
                    'asset/images/logo.png',
                    width: 150,
                    height: 150,
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).title,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.55,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _title,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).bookName,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).categories,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                StreamBuilder<List<Category>>(
                  stream: bloc.categoryList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CategorySelector(
                        key: ValueKey(snapshot),
                        categories: snapshot.requireData,
                        onChange: (value) {
                          bloc.categories = value;
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.3,
                child: DropDownSelector<Locale>(
                    hint: 'language',
                    iconRightPadding: 2,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                    items: getItems(),
                    onChanged: (value) {
                      bloc.locale = value;
                    })),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).publicationYear,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.54,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _year,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).publicationYear,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).isbnNumber,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _isbn,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).choose,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).publisherName,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.54,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _publisherName,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).choose,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).passwordProtected,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _passwordProtected,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).passwordProtected,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).price,
                      style: const TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.54,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    inputFormatters: [
                      DecimalTextInputFormatter(decimalRange: 2),
                      FilteringTextInputFormatter.allow(Patterns.demicalFormat)
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _price,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: S.of(context).price,
                      hintStyle: const TextStyle(color: AppColors.buttonText),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.appColor)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  S.of(context).description,
                  style: const TextStyle(color: AppColors.appColor),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: _description,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText: S.of(context).description,
                  hintStyle: const TextStyle(color: AppColors.buttonText),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.appColor)),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 5, top: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  S.of(context).shortdescription,
                  style: const TextStyle(color: AppColors.appColor),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.95,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: _shortDescription,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText: S.of(context).shortdescription,
                  hintStyle: const TextStyle(color: AppColors.buttonText),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.appColor)),
                ),
              ),
            ),
          ],
        ),
        StreamBuilder<File>(
            stream: bloc.bookFile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.requireData.path);
              }
              return const SizedBox();
            }),
        ElevatedButton(
            onPressed: _selectFile, child: const Text('SelectedFile')),
        ElevatedButton(
          onPressed: validate,
          child: Text('upload'),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }

  @override
  AddBookBloc provideBloc() {
    return AddBookBloc();
  }

  List<DropDownItem<Locale>> getItems() => [
        DropDownItem(
          value: Locale("ru"),
          text: S.of(context).ru,
        ),
        DropDownItem(
          value: Locale("az"),
          text: S.of(context).az,
        ),
        DropDownItem(
          value: Locale("en"),
          text: S.of(context).en,
        ),
      ];

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['epub'],
    );
    if (result != null) {
      bloc.onBookFileSelected(File(result.files.single.path!));
    }
  }

  Future<void> _selectImage() async {
    final source = await showSelectImageSourceAlert(context);
    if (source != null) {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        bloc.onImageSelected(File(image.path));
      }
    }
  }

  void validate() {
    final isValid = _title.text.trim().isNotEmpty &&
        _description.text.trim().isNotEmpty &&
        bloc.categories.isNotEmpty &&
        bloc.locale != null &&
        bloc.image != null &&
        bloc.file != null;
    if (isValid) {
      final request = CreateBookRequest(
        category: bloc.categories.map((e) => e.id).toList(),
        title: _title.text.trim(),
        language: bloc.locale!.languageCode,
        bookCover: bloc.image!,
        description: _description.text.trim(),
        bookFile: bloc.file!,
      );
      bloc.uploadBook(request).then((value) => Navigator.pop(context));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Eror'),
          );
        },
      );
    }
  }
}
