@JS()
library main;

import 'dart:js_util';
import 'package:dio/dio.dart';

import 'dart:js' as js;

import 'package:js/js.dart';

typedef Callback<T> = dynamic Function(T arg);

@JS()
class Promise<T> {
  external Promise<T> then(Callback<T> successCallback,
      [Function errorCallback]);

  external Promise<T> catchIt(Function errorCallback);
}

@JS('sendBotEvent')
external Promise<dynamic> sendBotEvent(Object objectParams);

//? {
//?    String method,
//?    Object? params,
//?    int? timeout,
//?    dynamic? files,
//?    bool? guaranteed_delivery_required,
//? }

class SmartAppClient {
  Future<dynamic> get(String endpoint, {Options? options}) async {

    return await promiseToFuture(sendBotEvent({
      'method': 'get_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'get',
        'options': options,
      },
    }).then(js.allowInterop((data) {
      print('SUCCESS: $data');
      return data;
    }), js.allowInterop((err) {
      print('ERROR: $err');
      return err;
    })));
  }

  Future<dynamic> post(String endpoint, {Object? data, Options? options}) async {
    return await promiseToFuture(sendBotEvent({
      'method': 'post_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'post',
        'options': options,
        'data': data,
      },
    }).then(js.allowInterop((data) {
      return data;
    }), js.allowInterop((err) {
      return err;
    })));
  }

  Future<dynamic> delete(String endpoint,
      {Object? data, Options? options}) async {
    return await promiseToFuture(sendBotEvent({
      'method': 'delete_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'delete',
        'options': options,
        'data': data,
      },
    }).then(js.allowInterop((data) {
      return data;
    }), js.allowInterop((err) {
      return err;
    })));
  }

  Future<dynamic> put(String endpoint, {Object? data, Options? options}) async {
    return await promiseToFuture(sendBotEvent({
      'method': 'put_$endpoint',
      'params': {
        'url': endpoint,
        'method': 'put',
        'options': options,
        'data': data,
      },
    }).then(js.allowInterop((data) {
      return data;
    }), js.allowInterop((err) {
      return err;
    })));
  }
}
