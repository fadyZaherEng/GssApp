// ignore_for_file: avoid_print
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gss/app/di.dart';
import 'package:gss/data/network/cashe_helper.dart';
import 'package:gss/domain/models/home_models/local_notification.dart';
import 'package:gss/domain/models/home_models/home_tower.dart';
import 'utils/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:gss/app/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> firebaseMassageBackground(RemoteMessage message) async {
  LocalNotificationService.display(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await LocalNotificationService.initialize();
  await SharedHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Directory dir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TowerModelAdapter());
  if (!Hive.isBoxOpen('towers')) {
    await Hive.openBox<TowerModel>('towers');
  }
  var token = await FirebaseMessaging.instance.getToken();
  print("token:$token \n");
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    LocalNotificationService.display(message);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMassageBackground);
  FirebaseMessaging.onMessage.listen((message) {
    LocalNotificationService.display(message);
  });
  if (SharedHelper.get(key: 'lang') == null) {
    SharedHelper.save(value: 'arabic', key: 'lang');
  }
  runApp(
    const MyApp(),
  );
}
