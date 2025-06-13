import 'package:flutter/material.dart';
import 'package:newsapp/constant/material.dart';
import 'package:newsapp/widgets/grab_icon_menu.dart';
import 'package:newsapp/widgets/grab_more_icon_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 130 + MediaQuery.of(context).viewPadding.top,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF138880),
                        Color(0xFF1C9E82),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0 + MediaQuery.of(context).viewPadding.top,
                    ),
                    child: Center(
                      child: Text(
                        "Good afternoon",
                        style: kGrabWhiteRegularSmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ovo Balance",
                                style: kGrabBlackBoldMedium.copyWith(fontSize: 20),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "RP",
                                    style: kGrabBlackBoldMedium.copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(thickness: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GrabIconMenu(
                                image: "assets/images/pay.png",
                                title: "Pay"
                              ),
                              GrabIconMenu(
                                image: "assets/images/topu.png",
                                title: "Top Up",
                              ),
                              GrabIconMenu(
                                image: "assets/images/reward.png",
                                title: "Reward",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                   Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ovo Balance",
                                style: kGrabBlackBoldMedium.copyWith(fontSize: 20),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "RP",
                                    style: kGrabBlackBoldMedium.copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(thickness: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GrabIconMenu(
                                image: "assets/images/pay.png",
                                title: "Pay"
                              ),
                              GrabIconMenu(
                                image: "assets/images/topu.png",
                                title: "Top Up",
                              ),
                              GrabIconMenu(
                                image: "assets/images/reward.png",
                                title: "Reward",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 8,
          color: Colors.grey[300],
        ),
        GridView.count(
          padding: EdgeInsets.all(5),
          childAspectRatio: .75,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            10,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                        ),
                        child: Image.network("https://image.freepik.com/free-vector/square-food-banner-with-photo_23-2148118766.jpg",
                        fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text("Article Title Here",
                                style: kGrabBlackRegularSmall.copyWith(
                                    fontSize: 15)),
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.calendar_today, size: 15,),
                              SizedBox(width: 5),
                              Text("1 min read",
                                  style: kGrabBlackRegularSmall.copyWith(
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } 
          )
        )
      ],
    );
  }
}
