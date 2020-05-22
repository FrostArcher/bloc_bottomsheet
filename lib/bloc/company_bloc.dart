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
        if(companyDetails.id!=null){
          yield CompanyLoaded(companyDetails: companyDetails);
        }
      }catch (_){
        yield CompanyError();
      }

    }
  }
}