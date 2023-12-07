import 'dart:math';

import 'package:flutter/cupertino.dart';

class ProviderClass extends ChangeNotifier{
  int count=0;
  int get numcount=>count;
void counterincrement(){
  count++;
  notifyListeners();
}

int RandomnNo(){
  return Random().nextInt(60);
}
}