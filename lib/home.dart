import 'package:blocbottomsheet/bloc/company_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocs.dart';

class Home extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 8,),
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  onSubmitted: (text) async{
                    if(text!=null){
                      BlocProvider.of<CompanyBloc>(context).add(FetchCompany(id: text));
                    }
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<CompanyBloc, CompanyState>(builder: (context, state) {
              if (state is CompanyEmpty) {
                return Center(
                  child: Text("No Shop Found"),
                );
              }
              if (state is CompanyLoading) {
                return Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is CompanyLoaded) {
                final companyDetails = state.companyDetails;
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: ClipRRect(child: Image.network("${companyDetails.dealer_image}")),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${companyDetails.name}",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Info",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Contact",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black38,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              "+917003188891",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black38,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              "k.gorain007@gmail.com",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black38,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Address",
                              maxLines: 5,
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 2,
                              child: Container(
                                height: 80,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Overall Rating",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                    ),
                                    Row(
                                      children: [1,2,3,4,5].map((e) => Icon(Icons.star, size: 10,)).toList(),
                                    ),
                                    Text("4.5",
                                    textScaleFactor: 2,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text("343 votes",
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                    )
                                  ],
                                ),
                              )),
                          Flexible(
                              flex: 3,
                              child: Column(
                                children: [],
                              ))
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: (){},
                      color: Colors.deepPurple,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textColor: Colors.white,
                      child: Text("Add Review"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Customer Reviews",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    Column(
                      children: [1,2,3,4].map((e) => Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [1,2,3,4,5].map((e) => Icon(Icons.star, size: 10,)).toList(),
                                  ),
                                ),
                                Text("Very Good!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  minRadius: 5,
                                  maxRadius: 8,
                                  child: Image.network(""),
                                ),
                                Expanded(
                                  child: Text("Reviewer Name",
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )).toList(),
                    ),
                  ],
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
