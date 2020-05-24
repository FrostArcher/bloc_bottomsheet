import 'package:blocbottomsheet/bloc/blocs.dart';
import 'package:blocbottomsheet/models/models.dart';
import 'package:blocbottomsheet/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState>{
  final CompanyRepository companyRepository;

  CompanyBloc({this.companyRepository}):assert(companyRepository!=null);

  @override
  // TODO: implement initialState
  CompanyState get initialState => CompanyEmpty();

  @override
  Stream<CompanyState> mapEventToState(CompanyEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchCompany){
      yield CompanyLoading();
      try{
        final CompanyDetails companyDetails = await companyRepository.getCompanyDetails(event.id);
        if(companyDetails !=null){

          companyDetails.roundRating = companyDetails.avg_rating.round();
          var stars = <int>[];
          for (int i = 0; i < companyDetails.roundRating; i++) {
            stars.add(i);
          }
          companyDetails.stars.addAll(stars);
          var starCount = [];
          var starclicked = [];
          for (int i = 5; i >= 1; i--) {
            switch (i) {
              case 5:
                starCount
                    .add({"$i": companyDetails.ratingCount.fiveStar});
                starclicked.add({"$i", false});
                break;
              case 4:
                starCount
                    .add({"$i": companyDetails.ratingCount.fourStar});
                starclicked.add({"$i", false});
                break;
              case 3:
                starCount
                    .add({"$i": companyDetails.ratingCount.threeStar});
                starclicked.add({"$i", false});
                break;
              case 2:
                starCount.add({"$i": companyDetails.ratingCount.twoStar});
                starclicked.add({"$i", false});
                break;
              case 1:
                starCount.add({"$i": companyDetails.ratingCount.oneStar});
                starclicked.add({"$i", false});
                break;
            }
          }
          companyDetails.starCount.addAll(starCount);
          companyDetails.starclicked.addAll(starclicked);
          yield CompanyLoaded(companyDetails: companyDetails);
        }
        else{
          yield CompanyEmpty();
        }
      }catch (e){
        print("checkerror$e");
        yield CompanyError();
      }

    }
    else yield CompanyEmpty();
  }
}