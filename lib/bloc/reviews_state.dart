import 'package:blocbottomsheet/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ReviewsState extends Equatable{

  ReviewsState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class ReviewsUninitialized extends ReviewsState{

}

class ReviewsLoading extends ReviewsState{
}

class ReviewsLoaded extends  ReviewsState{
  final Reviews reviews;
  static List<Results> _results = <Results>[];
  final bool hasMaxReached;

  ReviewsLoaded({@ required this.reviews,this.hasMaxReached}):super([reviews,hasMaxReached]);

  ReviewsLoaded copyWith({List<Results> resultList, bool hasMaxReached}){
    return ReviewsLoaded(
      reviews: this.reviews,
      hasMaxReached: hasMaxReached ?? this.hasMaxReached
    );
  }

  @override
  List<Object> get props => [reviews];

  List<Results> get results => _results;

  set results(List<Results> value) {
    _results = value;
  }
}

class ReviewsEmpty extends ReviewsState{}

class ReviewsError extends ReviewsState{}
