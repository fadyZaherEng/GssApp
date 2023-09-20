// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

abstract class DataState<T>{
  final T? data;
  final DioError? dioError;

  DataState({this.data, this.dioError});
}
class DataSuccess<T>extends DataState<T>{
  final T data;
  DataSuccess(this.data):super(data: data);
}
class DataFailed<T>extends DataState<T>{
  final DioError dioError;
  DataFailed(this.dioError):super(dioError: dioError);
}
