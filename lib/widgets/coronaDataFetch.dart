import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:medico/model/coronaGlobalData.dart';
import 'package:medico/model/coronaCountryData.dart';

class coronaData{
  static const String uri='https://corona-api.com/countries';
  Future coronaGlobalDataFetch() async{
    final response= await http.get(Uri.encodeFull(uri));
    if(response.statusCode==200){
      print('################################################################################');
      print('Status code:200');
      print('##################################################################################');
      return json.decode(response.body);}
  }
  Future<coronaCountrydata> coronaCountryDataFetch({@required String countryCode})async{
    String countryUri=uri+'/'+countryCode;
    final response= await http.get(Uri.encodeFull(countryUri));
    return coronaCountrydata.fromJson(json.decode(response.body));
  }
}
