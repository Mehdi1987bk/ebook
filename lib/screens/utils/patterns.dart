
// ignore: avoid_classes_with_only_static_members
class Patterns {
  static final RegExp email = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]"
      r"+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\."
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  static final RegExp optionalEmail =
      RegExp(r"^(^$|[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+)");
  static final RegExp password = RegExp(r'^.{6,50}$');
  static final RegExp userName = RegExp(r'^.{2,50}$');
  static final RegExp cityName = RegExp(r'^.{2,254}');
  static final RegExp phone = RegExp(r'^.{7,50}$');
  static final RegExp codeVerificationWhiteList = RegExp(r"^\S{0,8}");
  static final RegExp questionWhiteList = RegExp(r"^.{0,200}");
  static final RegExp voteWhiteList = RegExp(r"^.{0,100}");
  static final RegExp codeVerification = RegExp('^.{8}');
  static final RegExp textField = RegExp(r'^.{1,254}');
  static final RegExp search = RegExp(r'^\S.*$');
  static final RegExp textFilter = RegExp(r'^.{10,}');
  static final RegExp link = RegExp(
      r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$');

  static final RegExp youtubeLink = RegExp(
      r'^http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?[\w\?=]*)?');
  static final RegExp instagramLink = RegExp(
      r'^(?:(?:http|https):\/\/)?(?:www\.)?(?:instagram\.com|instagr\.am)\/([A-Za-z0-9-_\.]+)');

  static final RegExp facebookLink = RegExp(
      r'^(?:https?:\/\/)?(?:www\.)?(mbasic.facebook|m\.facebook|facebook|fb)\.+');

  static final RegExp price = RegExp('^\$|^(0|([1-9][0-9]{0,7}))(\\.[0-9]{0,2})?\$');
}
