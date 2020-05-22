import 'package:blocbottomsheet/bloc/blocs.dart';
import 'package:blocbottomsheet/home.dart';
import 'package:blocbottomsheet/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final CompanyRepository companyRepository = CompanyRepository(
    companyDetailsApiClient: CompanyDetailsApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(companyRepository: companyRepository,));
}

class MyApp extends StatelessWidget {
  final CompanyRepository companyRepository;

  MyApp({Key key, @required this.companyRepository})
      : assert(companyRepository != null),
        super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CompanyBloc(companyRepository: companyRepository),
        child: Home(),
      ),
    );
  }
}
