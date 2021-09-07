// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Şəxsi kabinetə giriş`
  String get LoginQiris {
    return Intl.message(
      'Şəxsi kabinetə giriş',
      name: 'LoginQiris',
      desc: '',
      args: [],
    );
  }

  /// `In publishing and graphic design, Lorem ipsum is a placeholder text commonly`
  String get loginDescribtion {
    return Intl.message(
      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly',
      name: 'loginDescribtion',
      desc: '',
      args: [],
    );
  }

  /// `E-mail addresinizi daxil edin`
  String get emailAddresiniziDaxilEdin {
    return Intl.message(
      'E-mail addresinizi daxil edin',
      name: 'emailAddresiniziDaxilEdin',
      desc: '',
      args: [],
    );
  }

  /// `Şifrənizi daxil edin`
  String get ifrniziDaxilEdin {
    return Intl.message(
      'Şifrənizi daxil edin',
      name: 'ifrniziDaxilEdin',
      desc: '',
      args: [],
    );
  }

  /// `Şifrəmi unutdum`
  String get ifrmiUnutdum {
    return Intl.message(
      'Şifrəmi unutdum',
      name: 'ifrmiUnutdum',
      desc: '',
      args: [],
    );
  }

  /// `İrəli`
  String get rli {
    return Intl.message(
      'İrəli',
      name: 'rli',
      desc: '',
      args: [],
    );
  }

  /// `E-mail adres`
  String get emailAdres {
    return Intl.message(
      'E-mail adres',
      name: 'emailAdres',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Qeydiyyatdan keçin`
  String get qeydiyyatdanKein {
    return Intl.message(
      'Qeydiyyatdan keçin',
      name: 'qeydiyyatdanKein',
      desc: '',
      args: [],
    );
  }

  /// `Şifrə`
  String get ifr {
    return Intl.message(
      'Şifrə',
      name: 'ifr',
      desc: '',
      args: [],
    );
  }

  /// `Şifrəmi unutmusam`
  String get ifrmiUnutmusam {
    return Intl.message(
      'Şifrəmi unutmusam',
      name: 'ifrmiUnutmusam',
      desc: '',
      args: [],
    );
  }

  /// `Salam`
  String get salam {
    return Intl.message(
      'Salam',
      name: 'salam',
      desc: '',
      args: [],
    );
  }

  /// `Bu gün sizə xoş alış-verişlər arzu edirik`
  String get buGnSizXoAlverilrArzuEdirik {
    return Intl.message(
      'Bu gün sizə xoş alış-verişlər arzu edirik',
      name: 'buGnSizXoAlverilrArzuEdirik',
      desc: '',
      args: [],
    );
  }

  /// `Məhsulun kodu`
  String get mhsulunKodu {
    return Intl.message(
      'Məhsulun kodu',
      name: 'mhsulunKodu',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status {
    return Intl.message(
      'Status:',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `SC status: `
  String get scStatus {
    return Intl.message(
      'SC status: ',
      name: 'scStatus',
      desc: '',
      args: [],
    );
  }

  /// `Qiymət: `
  String get qiymt {
    return Intl.message(
      'Qiymət: ',
      name: 'qiymt',
      desc: '',
      args: [],
    );
  }

  /// `Kargo çəkisi: `
  String get kargoKisi {
    return Intl.message(
      'Kargo çəkisi: ',
      name: 'kargoKisi',
      desc: '',
      args: [],
    );
  }

  /// `Məhsulun linki`
  String get mhsulunLinki {
    return Intl.message(
      'Məhsulun linki',
      name: 'mhsulunLinki',
      desc: '',
      args: [],
    );
  }

  /// `Sifariş ver`
  String get sifariVer {
    return Intl.message(
      'Sifariş ver',
      name: 'sifariVer',
      desc: '',
      args: [],
    );
  }

  /// `Faktura`
  String get fakturaLavEt {
    return Intl.message(
      'Faktura',
      name: 'fakturaLavEt',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image`
  String get chooseImage {
    return Intl.message(
      'Choose Image',
      name: 'chooseImage',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Endirin`
  String get endirin {
    return Intl.message(
      'Endirin',
      name: 'endirin',
      desc: '',
      args: [],
    );
  }

  /// `Bağlamalarım`
  String get balamalarm {
    return Intl.message(
      'Bağlamalarım',
      name: 'balamalarm',
      desc: '',
      args: [],
    );
  }

  /// `Bütün bağlamalarım`
  String get btnBalamalarm {
    return Intl.message(
      'Bütün bağlamalarım',
      name: 'btnBalamalarm',
      desc: '',
      args: [],
    );
  }

  /// `Mağaza: `
  String get maaza {
    return Intl.message(
      'Mağaza: ',
      name: 'maaza',
      desc: '',
      args: [],
    );
  }

  /// `Məhsulun tipi: `
  String get mhsulunTipi {
    return Intl.message(
      'Məhsulun tipi: ',
      name: 'mhsulunTipi',
      desc: '',
      args: [],
    );
  }

  /// `Kargo qiyməti: `
  String get kargoQiymti {
    return Intl.message(
      'Kargo qiyməti: ',
      name: 'kargoQiymti',
      desc: '',
      args: [],
    );
  }

  /// `Qeyd`
  String get qeyd {
    return Intl.message(
      'Qeyd',
      name: 'qeyd',
      desc: '',
      args: [],
    );
  }

  /// `Ödəniş edin`
  String get dniEdin {
    return Intl.message(
      'Ödəniş edin',
      name: 'dniEdin',
      desc: '',
      args: [],
    );
  }

  /// `Please grant accessing storage permission to continue`
  String get pleaseGrantAccessingStoragePermissionToContinue {
    return Intl.message(
      'Please grant accessing storage permission to continue',
      name: 'pleaseGrantAccessingStoragePermissionToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `əlavə et`
  String get lavEt {
    return Intl.message(
      'əlavə et',
      name: 'lavEt',
      desc: '',
      args: [],
    );
  }

  /// `Kod`
  String get kod {
    return Intl.message(
      'Kod',
      name: 'kod',
      desc: '',
      args: [],
    );
  }

  /// `Faktura kodunu əlavə edin`
  String get fakturaKodunuLavEdin {
    return Intl.message(
      'Faktura kodunu əlavə edin',
      name: 'fakturaKodunuLavEdin',
      desc: '',
      args: [],
    );
  }

  /// `Düzəliş`
  String get dzli {
    return Intl.message(
      'Düzəliş',
      name: 'dzli',
      desc: '',
      args: [],
    );
  }

  /// `KGO9920xxxxxx`
  String get kgo9920xxxxxx {
    return Intl.message(
      'KGO9920xxxxxx',
      name: 'kgo9920xxxxxx',
      desc: '',
      args: [],
    );
  }

  /// `Məhsulun qiyməti (TL)`
  String get mhsulunQiymtiTl {
    return Intl.message(
      'Məhsulun qiyməti (TL)',
      name: 'mhsulunQiymtiTl',
      desc: '',
      args: [],
    );
  }

  /// `Qiyməti`
  String get qiymti {
    return Intl.message(
      'Qiyməti',
      name: 'qiymti',
      desc: '',
      args: [],
    );
  }

  /// `Faktura`
  String get faktura {
    return Intl.message(
      'Faktura',
      name: 'faktura',
      desc: '',
      args: [],
    );
  }

  /// `Ətraflı`
  String get trafl {
    return Intl.message(
      'Ətraflı',
      name: 'trafl',
      desc: '',
      args: [],
    );
  }

  /// `Faktura qiyməti`
  String get fakturaQiymti {
    return Intl.message(
      'Faktura qiyməti',
      name: 'fakturaQiymti',
      desc: '',
      args: [],
    );
  }

  /// `Kargo takip NO.`
  String get kargoTakipNo {
    return Intl.message(
      'Kargo takip NO.',
      name: 'kargoTakipNo',
      desc: '',
      args: [],
    );
  }

  /// `Çəki`
  String get ki {
    return Intl.message(
      'Çəki',
      name: 'ki',
      desc: '',
      args: [],
    );
  }

  /// `Çatdırılma`
  String get atdrlma {
    return Intl.message(
      'Çatdırılma',
      name: 'atdrlma',
      desc: '',
      args: [],
    );
  }

  /// `Məhsulun sayı`
  String get mhsulunSay {
    return Intl.message(
      'Məhsulun sayı',
      name: 'mhsulunSay',
      desc: '',
      args: [],
    );
  }

  /// `Əlavə xidmətlər`
  String get lavXidmtlr {
    return Intl.message(
      'Əlavə xidmətlər',
      name: 'lavXidmtlr',
      desc: '',
      args: [],
    );
  }

  /// `Kateqoriya`
  String get kateqoriya {
    return Intl.message(
      'Kateqoriya',
      name: 'kateqoriya',
      desc: '',
      args: [],
    );
  }

  /// `Ödəmə`
  String get dm {
    return Intl.message(
      'Ödəmə',
      name: 'dm',
      desc: '',
      args: [],
    );
  }

  /// `SC status`
  String get scStatuss {
    return Intl.message(
      'SC status',
      name: 'scStatuss',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get statuss {
    return Intl.message(
      'Status',
      name: 'statuss',
      desc: '',
      args: [],
    );
  }

  /// `Əməliyyatlar`
  String get mliyyatlar {
    return Intl.message(
      'Əməliyyatlar',
      name: 'mliyyatlar',
      desc: '',
      args: [],
    );
  }

  /// `Faktura əlavə edin`
  String get fakturaLavEdin {
    return Intl.message(
      'Faktura əlavə edin',
      name: 'fakturaLavEdin',
      desc: '',
      args: [],
    );
  }

  /// `Yadda saxla`
  String get yaddaSaxla {
    return Intl.message(
      'Yadda saxla',
      name: 'yaddaSaxla',
      desc: '',
      args: [],
    );
  }

  /// `Bağlamalar`
  String get balamalar {
    return Intl.message(
      'Bağlamalar',
      name: 'balamalar',
      desc: '',
      args: [],
    );
  }

  /// `Sifarişlər`
  String get sifarilr {
    return Intl.message(
      'Sifarişlər',
      name: 'sifarilr',
      desc: '',
      args: [],
    );
  }

  /// `Kuryer sifariş et`
  String get kuryerSifariEt {
    return Intl.message(
      'Kuryer sifariş et',
      name: 'kuryerSifariEt',
      desc: '',
      args: [],
    );
  }

  /// `Xidmətlərimi`
  String get xidmtlrimi {
    return Intl.message(
      'Xidmətlərimi',
      name: 'xidmtlrimi',
      desc: '',
      args: [],
    );
  }

  /// `Giriş et`
  String get giriEt {
    return Intl.message(
      'Giriş et',
      name: 'giriEt',
      desc: '',
      args: [],
    );
  }

  /// `DIgər bölmələr`
  String get digrBlmlr {
    return Intl.message(
      'DIgər bölmələr',
      name: 'digrBlmlr',
      desc: '',
      args: [],
    );
  }

  /// `Balansınız`
  String get balansnz {
    return Intl.message(
      'Balansınız',
      name: 'balansnz',
      desc: '',
      args: [],
    );
  }

  /// `AZN balansı`
  String get aznBalans {
    return Intl.message(
      'AZN balansı',
      name: 'aznBalans',
      desc: '',
      args: [],
    );
  }

  /// `250.0`
  String get aznnnn {
    return Intl.message(
      '250.0',
      name: 'aznnnn',
      desc: '',
      args: [],
    );
  }

  /// `TL balansı`
  String get tlBalans {
    return Intl.message(
      'TL balansı',
      name: 'tlBalans',
      desc: '',
      args: [],
    );
  }

  /// `Şəxsi kabinet`
  String get xsiKabinet {
    return Intl.message(
      'Şəxsi kabinet',
      name: 'xsiKabinet',
      desc: '',
      args: [],
    );
  }

  /// `© 2021 Kargolux | Bütün Hüquqlar Qorunur`
  String get oluxBtnHquqlarQorunur {
    return Intl.message(
      '© 2021 Kargolux | Bütün Hüquqlar Qorunur',
      name: 'oluxBtnHquqlarQorunur',
      desc: '',
      args: [],
    );
  }

  /// `Şəxsi məlumatlarım`
  String get xsiMlumatlarm {
    return Intl.message(
      'Şəxsi məlumatlarım',
      name: 'xsiMlumatlarm',
      desc: '',
      args: [],
    );
  }

  /// `Xarici ünvanlarım`
  String get xariciNvanlarm {
    return Intl.message(
      'Xarici ünvanlarım',
      name: 'xariciNvanlarm',
      desc: '',
      args: [],
    );
  }

  /// `Şifrəni dəyiş`
  String get ifrniDyi {
    return Intl.message(
      'Şifrəni dəyiş',
      name: 'ifrniDyi',
      desc: '',
      args: [],
    );
  }

  /// `Çıxış et`
  String get xEt {
    return Intl.message(
      'Çıxış et',
      name: 'xEt',
      desc: '',
      args: [],
    );
  }

  /// `Kuryer sifarişi`
  String get kuryerSifarii {
    return Intl.message(
      'Kuryer sifarişi',
      name: 'kuryerSifarii',
      desc: '',
      args: [],
    );
  }

  /// `Onlayn daşıma haqqı ödənişi`
  String get onlaynDamaHaqqDnii {
    return Intl.message(
      'Onlayn daşıma haqqı ödənişi',
      name: 'onlaynDamaHaqqDnii',
      desc: '',
      args: [],
    );
  }

  /// `Tariflər`
  String get tariflr {
    return Intl.message(
      'Tariflər',
      name: 'tariflr',
      desc: '',
      args: [],
    );
  }

  /// `Xəbərlər`
  String get xbrlr {
    return Intl.message(
      'Xəbərlər',
      name: 'xbrlr',
      desc: '',
      args: [],
    );
  }

  /// `Kango filialları`
  String get kangoFiliallar {
    return Intl.message(
      'Kango filialları',
      name: 'kangoFiliallar',
      desc: '',
      args: [],
    );
  }

  /// `Əlaqə`
  String get laq {
    return Intl.message(
      'Əlaqə',
      name: 'laq',
      desc: '',
      args: [],
    );
  }

  /// `tarixçəsi`
  String get tarixsi {
    return Intl.message(
      'tarixçəsi',
      name: 'tarixsi',
      desc: '',
      args: [],
    );
  }

  /// `Kuryer tarifləri`
  String get kuryerTariflri {
    return Intl.message(
      'Kuryer tarifləri',
      name: 'kuryerTariflri',
      desc: '',
      args: [],
    );
  }

  /// `Sürətli poçt daşıma xidməti`
  String get srtliPotDamaXidmti {
    return Intl.message(
      'Sürətli poçt daşıma xidməti',
      name: 'srtliPotDamaXidmti',
      desc: '',
      args: [],
    );
  }

  /// `Bakı şəhər daxili`
  String get bakHrDaxili {
    return Intl.message(
      'Bakı şəhər daxili',
      name: 'bakHrDaxili',
      desc: '',
      args: [],
    );
  }

  /// `Bakı kəndləri`
  String get bakKndlri {
    return Intl.message(
      'Bakı kəndləri',
      name: 'bakKndlri',
      desc: '',
      args: [],
    );
  }

  /// `Kango Tel: 012 525 43 43`
  String get kangoTel0125254343 {
    return Intl.message(
      'Kango Tel: 012 525 43 43',
      name: 'kangoTel0125254343',
      desc: '',
      args: [],
    );
  }

  /// `Qeyd: Kuryer ödəşini nəğd şəkildə bağlamanızı çatdıran kuryerə ödəyəcəksiniz`
  String get qeydKuryerDiniNdKildBalamanzAtdranKuryerDycksiniz {
    return Intl.message(
      'Qeyd: Kuryer ödəşini nəğd şəkildə bağlamanızı çatdıran kuryerə ödəyəcəksiniz',
      name: 'qeydKuryerDiniNdKildBalamanzAtdranKuryerDycksiniz',
      desc: '',
      args: [],
    );
  }

  /// `Kuryer sifarişi sadəcə Nərimanov filialı üçün keçərlidir`
  String get kuryerSifariiSadcNrimanovFilialNKerlidir {
    return Intl.message(
      'Kuryer sifarişi sadəcə Nərimanov filialı üçün keçərlidir',
      name: 'kuryerSifariiSadcNrimanovFilialNKerlidir',
      desc: '',
      args: [],
    );
  }

  /// `Ünvanınızı qeyd edin`
  String get nvannzQeydEdin {
    return Intl.message(
      'Ünvanınızı qeyd edin',
      name: 'nvannzQeydEdin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
