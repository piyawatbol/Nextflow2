import 'package:timeago/timeago.dart' as timeago;

class Post {
  String messege;
  DateTime createDate;

  Post({this.messege, this.createDate});

  String get timeagoMessage {
    var now = DateTime.now();
    var duration = now.difference(this.createDate);
    var ago = now.subtract(duration);
    var message = timeago.format(ago, locale: 'th_short');
    return message;
  }
}
