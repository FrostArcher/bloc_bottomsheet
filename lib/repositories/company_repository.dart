import 'package:blocbottomsheet/models/models.dart';
import 'package:blocbottomsheet/repositories/company_api_client.dart';
import 'package:flutter/material.dart';

class CompanyRepository{
  final CompanyDetailsApiClient companyDetailsApiClient;

  CompanyRepository({ @required this.companyDetailsApiClient}):assert(companyDetailsApiClient!=null);

  Future<CompanyDetails> getCompanyDetails(String id) async{
    final CompanyDetails companyDetails = await companyDetailsApiClient.getCompanyDetails(id);
    return companyDetails;
  }
}

class ReviewsRepository{
  final CompanyDetailsApiClient companyDetailsApiClient;

  ReviewsRepository({ @required this.companyDetailsApiClient}):assert(companyDetailsApiClient!=null);

  Future<Reviews> getReviews(String id, String next) async{

    final Reviews reviews = await companyDetailsApiClient.getReviews(id,next);

    return reviews;
  }
}