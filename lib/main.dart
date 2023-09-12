import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gss/app/app.dart';
import 'package:gss/app/di.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
//git follow
//branching models
//bloc

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initAppModule();
  final Directory dir =await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TowerModelAdapter());
  if(!Hive.isBoxOpen('towers')) {
    await Hive.openBox<TowerModel>('towers');
  }
  runApp(const MyApp());
}



