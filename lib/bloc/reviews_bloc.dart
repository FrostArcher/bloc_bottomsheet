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
    // TODO: implement mapEventToState
    if(state is ReviewsUninitialized){
      yield ReviewsLoading();
    }
    if(event is FetchReviews && !_hasReachedMax(state)){
      try{
        if(state is ReviewsLoading){
          final reviews = await reviewsRepository.getReviews(event.id,event.next);
          yield ReviewsLoaded(reviews: reviews,hasMaxReached: false);
        }
        if(state is ReviewsLoaded){
          final reviews = await reviewsRepository.getReviews(event.id, event.next);
          yield reviews.next==null? (state as ReviewsLoaded).copyWith(hasMaxReached:true):ReviewsLoaded(
            reviews: reviews,
            results: (state as ReviewsLoaded).results??<Results>[]+reviews.results,
            hasMaxReached: false
          );
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