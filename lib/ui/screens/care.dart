import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../global.dart';

class CareScreen extends StatefulWidget {
  final int id;

  const CareScreen({Key key, this.id}) : super(key: key);
  @override
  _CareScreenState createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  bool _showMoreAbout = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, _) => Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: MediaQuery.of(context).size.height / 3,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/care.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DraggableScrollableSheet(
                  initialChildSize: 2 / 3,
                  minChildSize: 2 / 3,
                  maxChildSize: 1,
                  builder: (context, scrollController) => Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          offset: Offset(0, -3),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Hemant Banjara",
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                  Text(
                                    "Bhinmal",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              decoration: BoxDecoration(
                                color: MyColors.darkGreen,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                              rating: 4.5,
                              size: 15,
                              color: MyColors.orange,
                            ),
                            Text("500K+ Reviews)"),
                            Expanded(
                              child: FlatButton(
                                child: FittedBox(
                                  child: Text(
                                    "See all reviews",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(color: MyColors.blue),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Text(
                          "About",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        Wrap(
                          children: <Widget>[
                            Text(
                              "Welcome to temple booking app here we are happy to help you. How can we help you?",
                              maxLines: _showMoreAbout ? null : 1,
                            ),
                            FlatButton(
                              child: Text(
                                _showMoreAbout ? "See Less" : "See More",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: MyColors.blue),
                              ),
                              onPressed: () {
                                setState(() {
                                  _showMoreAbout = !_showMoreAbout;
                                });
                              },
                            )
                          ],
                        ),
                        Text(
                          "Working Hours",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        Row(
                          children: <Widget>[
                            Text("Mon - Fri 08:00AM - 9:00PM"),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(9.0),
                                child: Text(
                                  "Open",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: MyColors.darkGreen),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xffdbf3e8),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Todays Stats",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(height: 11),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text("1280",
                                    style: Theme.of(context).textTheme.title),
                                Text(
                                  "Setisfied Customer",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                    "13 Years",
                                    style: Theme.of(context).textTheme.title),
                                Text(
                                  "Experience",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text("15",
                                    style: Theme.of(context).textTheme.title),
                                Text(
                                  "Certifications",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: MyColors.blue,
                            child: Text(
                              "Contact Now",
                              style: Theme.of(context).textTheme.button,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
