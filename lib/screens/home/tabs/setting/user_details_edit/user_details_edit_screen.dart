// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:kango/data/network/response/user_details_response.dart';
// import 'package:kango/domain/entities/gender.dart';
// import 'package:kango/domain/entities/user_details_screen.dart';
// import 'package:kango/domain/entities/user_filial.dart';
// import 'package:kango/generated/l10n.dart';
// import 'package:kango/presentation/bloc/base_screen.dart';
// import 'package:kango/presentation/resourses/app_colors.dart';
// import 'package:kango/screens/home/tabs/setting/update_password/password_update_true.dart';
// import 'package:kango/screens/home/tabs/setting/user_details_edit/user_details_esti_bloc.dart';
// import 'package:kango/screens/home/tabs/setting/user_details_edit/user_details_update_true.dart';
// import 'package:kango/screens/registration/page/step_two.dart';
// import 'package:kango/screens/utils/patterns.dart';
//
// import '../../../home_header.dart';
//
// class UserDetailsEditScreen extends BaseScreen {
//   late final UserDetailsEditBloc bloc;
//
//   @override
//   _UserDetailsEditScreenState createState() => _UserDetailsEditScreenState();
// }
//
// class _UserDetailsEditScreenState
//     extends BaseState<UserDetailsEditScreen, UserDetailsEditBloc> {
//   @override
//
//   @override
//   Widget body() {
//     return Column(
//       children: [
//         HomeHeader(
//           onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
//         ),
//         FutureBuilder<UserDetailsResponse>(
//           future: bloc.userDetails,
//           builder: (BuildContext context, snapshot) {
//             if (snapshot.hasData) {
//               return UserEditIthem(
//                 user: snapshot.requireData.user,
//                 bloc: bloc, userFilial: snapshot.requireData.userFilial,
//               );
//             }
//             return const SizedBox();
//           },
//         )
//       ],
//     );
//   }
//
//   @override
//   UserDetailsEditBloc provideBloc() {
//     return UserDetailsEditBloc();
//   }
// }
//
// class UserEditIthem extends StatefulWidget {
//   final UserDetailsEditBloc bloc;
//
//   const UserEditIthem({Key? key, required this.user, required this.bloc, required this.userFilial})
//       : super(key: key);
//
//   @override
//   _UserEditIthemState createState() => _UserEditIthemState();
// }
//
// class _UserEditIthemState extends State<UserEditIthem> {
//
//   final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
//   final dateFormat = DateFormat('yyyy-MM-dd');
//   final firstDate = DateTime(1960, 1);
//   final lastDate = DateTime.now();
//   final TextEditingController _dateTimeController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _adressController = TextEditingController();
//   final TextEditingController _passportNumberontroller =
//       TextEditingController();
//
//   UserDetailsEditBloc get _bloc => widget.bloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _mobileController.addListener(
//           () {
//         _bloc.editPageInfo.phoneNumber = _mobileController.text.trim();
//         _validate();
//       },
//     );
//     _passportNumberontroller.addListener(
//           () {
//         _bloc.editPageInfo.pasportNumber = _passportNumberontroller.text.trim();
//         _validate();
//       },
//     );
//     _adressController.addListener(
//           () {
//         _bloc.editPageInfo.adress = _adressController.text.trim();
//         _validate();
//       },
//     );
//     _dateTimeController.text = widget.user.birthday;
//     _passportNumberontroller.text = widget.user.passportNumber;
//     _adressController.text = widget.user.address ?? '';
//     _mobileController.text = widget.user.mobile;
//     _bloc.editPageInfo.gender = widget.user.gender;
//     _bloc.editPageInfo.pasportSeria = widget.user.passportSerie;
//     _bloc.editPageInfo.pasportNumber = widget.user.passportNumber;
//     _bloc.editPageInfo.birthday = DateTime.parse(widget.user.birthday.split('.').reversed.join());
//     _bloc.editPageInfo.phoneNumber = widget.user.mobile;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 0),
//             child: SimpleDialogOption(
//               padding: const EdgeInsets.only(bottom: 27, top: 0, left: 20),
//               onPressed: () {
//                 Navigator.pop(
//                   context,
//                 );
//               },
//               child: Row(
//                 children: [
//                   SvgPicture.asset(
//                     'asset/vektor_23.svg',
//                     height: 18,
//                   ),                  const SizedBox(
//                     width: 18,
//                   ),
//                   Text(S.of(context).xsiMlumatlar,
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w600))
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
//             height: 1,
//             color: AppColors.appColor,
//           ),
//           GreyButtton(
//             buttonName: S.of(context).ad,
//             buttonValue: widget.user.firstName,
//           ),
//           GreyButtton(
//             buttonName: S.of(context).soyad,
//             buttonValue: widget.user.lastName,
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16, bottom: 5, top: 15),
//               child: Text(
//                 S.of(context).doumTarixiniz,
//               ),
//             ),
//           ),
//           Container(
//             height: 50,
//             margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
//             child: TextField(
//               readOnly: true,
//               controller: _dateTimeController,
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//               decoration: InputDecoration(
//                 suffixIcon: GestureDetector(
//                     child: Image.asset('asset/data_d.png'),
//                     onTap: () => _openDataPicker(context)),
//                 hintStyle: const TextStyle(color: AppColors.buttonText),
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.grey)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: AppColors.appColor)),
//               ),
//             ),
//           ),
//           GreyButtton(
//             buttonName: S.of(context).emailAdres,
//             buttonValue: widget.user.email,
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16, bottom: 5, top: 15),
//               child: Text(
//                 S.of(context).mobilNmrniz,
//               ),
//             ),
//           ),
//           Container(
//             height: 50,
//             margin: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
//             child: TextField(
//               controller: _mobileController,
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//               decoration: InputDecoration(
//                 prefixIcon: Container(
//                     padding: const EdgeInsets.all(12),
//                     child: const Text(
//                       '+994',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                     )),
//                 hintText: widget.user.mobile,
//                 hintStyle: const TextStyle(color: AppColors.buttonText),
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.grey)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: AppColors.appColor)),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16, bottom: 5, top: 15),
//               child: Text(
//                 S.of(context).cinsiniz,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: GenderSelector(
//               bloc: _bloc,
//               onChanged: _validate,
//               user: widget.user,
//             ),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16, bottom: 5, top: 15),
//               child: Text(
//                 S.of(context).xsiyytVsiqsininSeriyaNmrsi,
//               ),
//             ),
//           ),
//           Container(
//             height: 50,
//             margin: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
//             child: TextField(
//               controller: _passportNumberontroller,
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//               decoration: InputDecoration(
//                 prefixIcon: DropdownSelector(
//                   values: seriyaCodes,
//                   onChanged: (String value) {
//                     widget.bloc.editPageInfo.pasportSeria = value;
//                   },
//                 ),
//                 hintText: S.of(context).vNinSeriyaNmrsi,
//                 hintStyle: const TextStyle(color: AppColors.buttonText),
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.grey)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: AppColors.appColor)),
//               ),
//             ),
//           ),
//           GreyButtton(
//             buttonName: S.of(context).xsiyytVsiqsininFnKodu,
//             buttonValue: widget.user.passportFin,
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16, bottom: 5, top: 15),
//               child: Text(
//                 S.of(context).nvan,
//               ),
//             ),
//           ),
//           Container(
//             height: 50,
//             margin: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
//             child: TextField(
//               controller: _adressController,
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//               decoration: InputDecoration(
//                 hintText: S.of(context).nvannzDaxilEdin,
//                 hintStyle: const TextStyle(color: AppColors.buttonText),
//                 filled: true,
//                 fillColor: Colors.white,
//
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.grey)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: AppColors.appColor)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: GreyButtton(
//               buttonName: S.of(context).filial,
//               buttonValue: widget.userFilial.name ,
//             ),
//           ),
//           ValueListenableBuilder<bool>(
//             valueListenable: _valueNotifier,
//             builder: (_, value, __) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 16,right: 16,bottom: 40),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: AppColors.appColor,
//                       padding: EdgeInsets.symmetric(
//                           vertical: 20,
//                           horizontal:
//                           MediaQuery.of(context).size.width * 0.30),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       textStyle: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       )),
//                   onPressed: value ? _edit : null,
//                   child: Text(S.of(context).rli),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _openDataPicker(BuildContext context) async {
//     final date = await showDatePicker(
//       initialDate: _bloc.editPageInfo.birthday ?? DateTime.now(),
//       firstDate: firstDate,
//       context: context,
//       lastDate: lastDate,
//     );
//     if (date != null) {
//       _bloc.editPageInfo.birthday = date;
//
//       _dateTimeController.text =
//           dateFormat.format(_bloc.editPageInfo.birthday!);
//     }
//     _validate();
//   }
//
//   void _validate() {
//     final isValid =
//         Patterns.phone.hasMatch(widget.bloc.editPageInfo.phoneNumber) &&   Patterns.textField.hasMatch(widget.bloc.editPageInfo.adress) &&
//             RegExp(r'^.{7,8}$').hasMatch(_bloc.editPageInfo.pasportNumber);
//     _valueNotifier.value = isValid;
//   }
//
//   _edit() {
//     _bloc.registration().then((value) => Navigator.pushReplacement(
//     context,
//     CupertinoPageRoute(builder: (BuildContext context) => UserDetailsUpdateTrue())));
//   }
//
// }
//
//
//
//
// class GreyButtton extends StatelessWidget {
//   final String buttonName;
//   final String buttonValue;
//
//   const GreyButtton(
//       {Key? key, required this.buttonName, required this.buttonValue})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Align(alignment: Alignment.bottomLeft, child: Text(buttonName)),
//           const SizedBox(
//             height: 5,
//           ),
//           Container(
//             alignment: Alignment.bottomLeft,
//             width: MediaQuery.of(context).size.width,
//             height: 50,
//             decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(0.4),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(17.0),
//               child: Text(buttonValue),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class GenderSelector extends StatefulWidget {
//   final UserDetailsEditBloc bloc;
//   final VoidCallback onChanged;
//   final User user;
//
//   const GenderSelector(
//       {Key? key,
//       required this.bloc,
//       required this.onChanged,
//       required this.user})
//       : super(key: key);
//
//   @override
//   _GenderSelectorState createState() => _GenderSelectorState();
// }
//
// class _GenderSelectorState extends State<GenderSelector> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       margin: const EdgeInsets.only(left: 16, right: 16),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//         border: Border.all(
//           color: Colors.black,
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<Gender>(
//             hint: Text(widget.user.gender.toString() == 'Gender.male'
//                 ? 'Kisi'
//                 : 'Qadin'),
//             isExpanded: true,
//             itemHeight: 50.0,
//             value: widget.bloc.editPageInfo.gender,
//             items: [
//               DropdownMenuItem(
//                 child: Text(S.of(context).kii),
//                 value: Gender.male,
//               ),
//               DropdownMenuItem(
//                 child: Text(S.of(context).qadn),
//                 value: Gender.female,
//               )
//             ],
//             onChanged: (value) {
//               setState(() {
//                 widget.bloc.editPageInfo.gender = value;
//                 widget.onChanged();
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
