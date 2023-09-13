// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gss/utils/show_toast.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:gss/app/app.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> firebaseMassageBackground(RemoteMessage message) async {
  print(message.data.toString());
  showToast(message: 'onMassageFirebaseMassageBackground', state: ToastState.SUCCESS);
}

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initAppModule();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Directory dir =await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TowerModelAdapter());
  if(!Hive.isBoxOpen('towers')) {
    await Hive.openBox<TowerModel>('towers');
  }
  // if(!Hive.isBoxOpen('favorite')) {
  //   Box favorities=  await Hive.openBox<bool>('favorite');
  // }
  var token =await FirebaseMessaging.instance.getToken();
  print("token:$token");
  FirebaseMessaging.onMessage.listen((event) {
    print('onMassage ${event.data.toString()}');
    showToast(message: 'onMassage', state: ToastState.SUCCESS);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('onMessageOpenedApp ${event.data.toString()}');
    showToast(message: 'onMessageOpenedApp', state: ToastState.SUCCESS);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMassageBackground);
  runApp(const MyApp());
}



