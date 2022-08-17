import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> getJson() async {
  Uri url = Uri.parse("https://randomfox.ca/floof/?ref=apilist.fun");
  http.Response data = await http.get(url);
  var jsonData = json.decode(data.body);
  var img = jsonData['image'];
  print(img);
  return img;
}
