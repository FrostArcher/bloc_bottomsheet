import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CompanyEvent extends Equatable{
  const CompanyEvent();
}

class FetchCompany extends CompanyEvent{
  final String id;

  FetchCompany({@required this.id}):assert(id!=null);

  @override
  // TODO: implement props
  List<Object> get props => [id];

}

