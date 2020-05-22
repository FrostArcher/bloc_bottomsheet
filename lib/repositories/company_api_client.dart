import 'dart:convert';

import 'package:blocbottomsheet/models/company_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CompanyDetailsApiClient {
  static const baseUrl = "https://test.1ounce.in";
  final http.Client httpClient;

  CompanyDetailsApiClient({@required this.httpClient})
      : assert(httpClient != null);

  Future<CompanyDetails> getCompanyDetails(String id) async{
    final companyDetailsUrl = "$baseUrl/company/details/$id/";
    final response = await this.httpClient.get(companyDetailsUrl);
    if(response.statusCode != 200){
      throw Exception('error getting company details');
    }
    try {
      final responseJson = jsonDecode(response.body);
      var companyDetails = CompanyDetails.fromJson(responseJson);
      if(companyDetails.id==null){
        return null;
      }
      return companyDetails;
    }catch(e){
      print("$e");
    }
  }
}


