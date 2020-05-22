import 'package:blocbottomsheet/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CompanyState extends Equatable{
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyEmpty extends  CompanyState{}

class CompanyLoading extends CompanyState{}

class CompanyLoaded extends CompanyState{
  final CompanyDetails companyDetails;

  CompanyLoaded({@ required this.companyDetails}):assert(companyDetails!=null);

  @override
  List<Object> get props => [companyDetails];
}

class CompanyError extends CompanyState{}


