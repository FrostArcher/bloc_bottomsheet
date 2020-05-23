import 'package:blocbottomsheet/bloc/company_bloc.dart';
import 'package:blocbottomsheet/models/company_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocs.dart';

class Home extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onSubmitted: (text) async {
                      if (text != null) {
                        BlocProvider.of<CompanyBloc>(context)
                            .add(FetchCompany(id: text));
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.power_settings_new),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<CompanyBloc, CompanyState>(
                  builder: (context, state) {
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
                  var listCount = 6;
                  var starCountClick = 6;
                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                      "${companyDetails.dealer_image ?? "https://images.unsplash.com/photo-1521120098171-0400b4ec1319?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80"}",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "${companyDetails.name ?? "No Name Found"}"
                                      .toUpperCase(),
                                  textScaleFactor: 1.3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 30),
                        child: Text(
                          "Info",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30.0,top: 20,right:15,bottom: 10),
                        child: Text(
                          "Contact",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.black38,
                              size: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${companyDetails.phone}",
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.black38,
                              size: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10.0),
                                child: Text(
                                  "${companyDetails.email}",
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.black38,
                              size: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:10.0),
                                child: Text(
                                  "${companyDetails.address}",
                                  maxLines: 5,
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 2,
                                fit: FlexFit.loose,
                                child: Container(
                                  height: 100,
                                  margin: EdgeInsets.only(top:20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Overall Rating",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [1, 2, 3, 4, 5]
                                                  .map((e) => Icon(
                                                        Icons.star_border,
                                                        size: 15,
                                                        color: Colors.amber,
                                                      ))
                                                  .toList(),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: companyDetails.stars
                                                  .map((e) => Icon(
                                                        Icons.star,
                                                        size: 15,
                                                        color: Colors.amber,
                                                      ))
                                                  .toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "${companyDetails.avg_rating}",
                                        textScaleFactor: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${companyDetails.reviews} votes",
                                        style: TextStyle(
                                          color: Colors.black38,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Flexible(
                                flex: 3,
                                fit: FlexFit.loose,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: companyDetails.starCount.map((ratingCount) {
                                    listCount = listCount - 1;
                                    print("${ratingCount.toString()}");

                                    return Container(
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 2),
                                                  child: Text("${listCount}",
                                                    textScaleFactor: 0.7,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 10,
                                                  color: Colors.amber,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            flex: 5,
                                            child: Stack(
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width),
                                                Container(
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(2.5),
                                                        color: Colors.black38,
                                                    ),
                                                    margin: EdgeInsets.symmetric(
                                                        vertical: 5),
                                                    width:
                                                        ((ratingCount[
                                                                "$listCount"] /
                                                            companyDetails
                                                                .reviews)*MediaQuery.of(context).size.width),
                                                    ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            flex: 3,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                  "${ratingCount["$listCount"]} votes",
                                                textScaleFactor: 0.7,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left:15),
                              width: MediaQuery.of(context).size.width/3,
                              alignment:Alignment.center,
                              child: RaisedButton(
                                onPressed: () {
                                  showModalBottomSheet<dynamic>(
                                      isScrollControlled: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (BuildContext bc) {
                                        return Wrap(children: <Widget>[
                                          Container(
                                            color: Colors.transparent,
                                            //height: MediaQuery.of(context).size.height/3,
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: new BorderRadius
                                                          .only(
                                                      topLeft:
                                                          const Radius.circular(
                                                              20.0),
                                                      topRight:
                                                          const Radius.circular(
                                                              20.0))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons.arrow_back,
                                                              size: 20,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          margin: EdgeInsets.only(right: 36),
                                                          child: Text(
                                                            "Rate this store",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Center(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children:
                                                          companyDetails.starclicked.map((e) {
                                                        starCountClick = starCountClick -1;
                                                        return IconButton(
                                                          icon: Icon(
                                                            Icons.star,
                                                            color: Colors.black26,
                                                          ),
                                                          iconSize: 20,
                                                          onPressed: () {

                                                          },
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                  Container(
                                                      margin:EdgeInsets.symmetric(vertical:20,horizontal: 40),
                                                      child: TextField(
                                                    maxLines: 5,
                                                    decoration: InputDecoration(
                                                      hintText: "Write a review",
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                    ),
                                                  )),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                                    child: RaisedButton(
                                                      onPressed: (){},
                                                      color: Colors.deepPurple,
                                                      padding: EdgeInsets.all(10),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      textColor: Colors.white,
                                                      child: Text("Submit"),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )
                                        ]);
                                      });
                                },
                                color: Colors.deepPurple,
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textColor: Colors.white,
                                child: Text("Add Review"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Customer Reviews",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [1, 2, 3, 4]
                            .map((e) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [1, 2, 3, 4, 5]
                                                  .map((e) => Icon(
                                                        Icons.star,
                                                        size: 10,
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Text(
                                            "Very Good!",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical:8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 5,
                                              maxRadius: 8,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(30),
                                                child: Image.network(
                                                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Text(
                                                  "Reviewer Name",
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text("Must Search by Id"),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
