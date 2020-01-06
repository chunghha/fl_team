import 'package:fluttertoast/fluttertoast.dart';

void toastWidget(message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 2,
  );
}
