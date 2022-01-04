import 'package:flutter/cupertino.dart';

double heightMediaQuery(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double widthMediaQuery(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
