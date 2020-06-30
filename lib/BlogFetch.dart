import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class APIService {
  // API key
  static const _api_key = '632d76dfbdmshe5619695a812339p19614ajsn634d453d8609';
  Future<dynamic> get({ String url='https://www.acefitness.org/education-and-resources/professional/expert-articles/7530/an-introduction-to-the-ace-mover-method/'
  }) async
  {
   String uri='https://lexper.p.rapidapi.com/v1.1/extract?url='+url+'&rapidapi-key='+_api_key;
    final response = await http.get(Uri.encodeFull(uri));
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }
}