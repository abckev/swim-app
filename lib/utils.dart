import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context);
  //..removeCurrentSnackBar()
  //      ..showSnackBar(SnackBar(content: Text(text)));

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(
              //static StreamTransformer transformer<T>(
              T Function(Map<String, dynamic> json) fromJson) =>
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<T>>.fromHandlers(
            handleData: (QuerySnapshot<Map<String, dynamic>> data,
                EventSink<List> sink) {
              final snaps = data.docs.map((doc) => doc.data()).toList();
              final objects = snaps.map((json) => fromJson(json)).toList();
              sink.add(objects);
            },
          );
}
