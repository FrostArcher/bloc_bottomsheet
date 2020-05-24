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
      print("${companyDetails.toString()}");
      return companyDetails;
    }catch(e){
      print("$e");
    }
  }

  Future<Reviews> getReviews(String id, String page) async{
    if(page==null)
      {
        final reviewsUrl = "$baseUrl/company/reviews/$id/";
        final response = await this.httpClient.get(reviewsUrl);
        if(response.statusCode!=200){
          throw Exception('error getting company reviews');
        }
        try{
          final responseJson = jsonDecode(response.body);
          var reviews = Reviews.fromjson(responseJson);
          print("${reviews.toString()}");
          return reviews;

        }catch(e){
          print("reviewserr$e");
        }
      }
    else{
      final reviewsUrl = "$page";
      final response = await this.httpClient.get(reviewsUrl);
      if(response.statusCode!=200){
        throw Exception('error getting company reviews');
      }
      try{
        final responseJson = jsonDecode(response.body);
        var reviews = Reviews.fromjson(responseJson);
        print("${reviews.toString()}");
        return reviews;
      }catch(e){
        print("reviewserr$e");
      }
    }


  }
}


