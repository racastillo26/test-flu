import 'package:flutter/cupertino.dart';
import 'package:app/res/Resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
