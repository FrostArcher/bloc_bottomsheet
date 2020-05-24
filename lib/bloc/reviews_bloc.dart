import 'package:blocbottomsheet/bloc/reviews.event.dart';
import 'package:blocbottomsheet/bloc/reviews_state.dart';
import 'package:blocbottomsheet/models/models.dart';
import 'package:blocbottomsheet/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState>{

  final ReviewsRepository reviewsRepository;

  ReviewsBloc({this.reviewsRepository}):assert(reviewsRepository!=null);

  @override
  // TODO: implement initialState
  ReviewsState get initialState => ReviewsUninitialized();

  @override
  Stream<ReviewsState> mapEventToState(ReviewsEvent event) async*{

    var reviewsInitialized = false;

    // TODO: implement mapEventToState
    if(state is ReviewsUninitialized){
      reviewsInitialized = true;
      yield ReviewsLoading();
    }
    if(event is FetchReviews && !_hasReachedMax(state)){
      try{
        if(state is ReviewsLoading && reviewsInitialized){
          final reviews = await reviewsRepository.getReviews(event.id,event.next);
          yield ReviewsLoaded(reviews: reviews,hasMaxReached: false);
          (state as ReviewsLoaded).results.clear();
          (state as ReviewsLoaded).results.addAll(reviews.results);
        }
        if(state is ReviewsLoaded && !reviewsInitialized){
          final reviews = await reviewsRepository.getReviews(event.id, event.next);
          (state as ReviewsLoaded).results.addAll(reviews.results);
          yield ReviewsLoaded(reviews: reviews,hasMaxReached: false);
        }
      }catch(e){
        print("checkreviewerror${e}");
        yield ReviewsError();
      }
    }
  }

}

bool _hasReachedMax(ReviewsState state) =>
    state is ReviewsLoaded && state.hasMaxReached;