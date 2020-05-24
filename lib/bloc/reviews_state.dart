import 'package:blocbottomsheet/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ReviewsState extends Equatable{

  ReviewsState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class ReviewsUninitialized extends ReviewsState{}

class ReviewsLoading extends ReviewsState{}

class ReviewsLoaded extends  ReviewsState{
  final Reviews reviews;
  final List<Results> results;
  final bool hasMaxReached;

  ReviewsLoaded({@ required this.reviews,this.hasMaxReached, this.results}):super([reviews,results,hasMaxReached]);

  ReviewsLoaded copyWith({List<Results> resultList, bool hasMaxReached}){
    return ReviewsLoaded(
      reviews: this.reviews,
      results: resultList ?? this.reviews.results,
      hasMaxReached: hasMaxReached ?? this.hasMaxReached
    );
  }

  @override
  List<Object> get props => [reviews];
}

class ReviewsEmpty extends ReviewsState{}

class ReviewsError extends ReviewsState{}
