import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ReviewsEvent extends Equatable{
  const ReviewsEvent();
}

class FetchReviews extends ReviewsEvent{
  final String id;
  final String next;

  FetchReviews({@required this.id, this.next}):assert(id!=null);

  @override
  // TODO: implement props
  List<Object> get props => [id,next];

}