import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:kango/generated/l10n.dart';
import 'package:kango/presentation/resourses/app_colors.dart';
import 'package:kango/screens/utils/menu_utils.dart';
import 'package:kango/screens/utils/text_style.dart';

import '../../../home_header.dart';



class ForeignAddress extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.splBag,
      drawer: MenuUtils(),
      key: scaffoldKey,
      body:Column(
        children: [
          HomeHeader(
            onMenuTap: () => scaffoldKey.currentState?.openDrawer(),
          ),
          Expanded(child: Adress()),
        ],
      ),
    );
  }
}


class Adress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SimpleDialogOption(
            padding: const EdgeInsets.only(bottom: 27,top: 0,left: 20),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Row(
              children: [
                Image.asset('asset/vektor_23.png'),
                const SizedBox(
                  width: 18,
                ),
                Text(S.of(context).xariciNvanlarm,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            children: [
              const Expanded(
                child: TextButten(
                  copyTex: 'Bəylər Həşimli',
                  title: 'Ad Soyad',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              const Expanded(
                child: TextButten(
                  copyTex: 'İstanbul',
                  title: 'İl - şehir',
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16,bottom: 10,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        const Padding(
          padding:  EdgeInsets.only(left: 22,right: 60),
          child:  Expanded(
            child: TextButten(
              copyTex: 'Islambey mah. Hükümet sk. Dış kapı No: 14A D:2 Arnavutköy. İstanbul. kod 1907033614 Kargofly Express',
              title: 'Türkiyə ünvanım',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16,bottom: 10,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            children: [
              const Expanded(
                child: TextButten(
                  copyTex: '34275',
                  title: 'ZIP/Post kodu',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              const Expanded(
                child: TextButten(
                  copyTex: 'Arnavutköy',
                  title: 'İlçe',
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16,bottom: 10,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            children: [
              const Expanded(
                child: TextButten(
                  copyTex: 'KargoFly',
                  title: 'Adres başlığı',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              const Expanded(
                child: TextButten(
                  copyTex: 'Arnavutköy',
                  title: 'Semt',
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16,bottom: 10,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            children: [
              const Expanded(
                child: TextButten(
                  copyTex: 'Türkiye',
                  title: 'Ülke',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              const Expanded(
                child: TextButten(
                  copyTex: '552 788 23 11',
                  title: 'Mobil telefon',
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16,bottom: 10,left: 16,right: 16),
          height: 1,
          color: AppColors.appColor,
        ),
        const Padding(
          padding:  EdgeInsets.only(left: 22,bottom: 50),
          child:  Expanded(
            child: TextButten(
              copyTex: '3881376911',
              title: 'Vergi numarası',
            ),
          ),
        ),
      ],
    );
  }
}




class TextButten extends StatelessWidget {
  final String copyTex;
  final String title;

  const TextButten({required this.copyTex, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  if (copyTex == "") {
                    print('enter text');
                  } else {
                    FlutterClipboard.copy(copyTex)
                        .then((value) => print('copied'));
                  }
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "asset/copy.png",
                          width: 14,
                        ),
                        const SizedBox(
                          width: 10,
                          height: 40,
                        ),
                        Text(
                          title,
                          style: TextStyles.styleText23,
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            copyTex,
                          )),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
