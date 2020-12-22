import 'package:book_darshan/global.dart';
import 'package:flutter/material.dart';
import 'package:book_darshan/module/temple.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_darshan/module/form.dart';

class DetailsFire extends StatelessWidget {
  final Temple temple;
  DetailsFire({this.temple});
  String img;
  @override
  Widget build(BuildContext context) {
    if (temple.type.toString() == 'Mandir') {
      img = 'assets/icons/mandir.png';
    }
    if (temple.type.toString() == 'Majjid') {
      img = 'assets/icons/majjid.png';
    }
    if (temple.type.toString() == 'Church') {
      img = 'assets/icons/church.png';
    }
    if (temple.type.toString() == 'Guru Dwara') {
      img = 'assets/icons/mandir.png';
    }
    if (temple.type.toString() == 'Jain Mandir') {
      img = 'assets/icons/church.png';
    }
    final temples = Provider.of<List<Temple>>(context);
    var _showMoreAbout = true;
    return StreamBuilder<Temple>(
        stream: null,
        builder: (context, snapshot) {
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
                            image: AssetImage(img),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          temple.name.toUpperCase(),
                                          // ignore: deprecated_member_use
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle,
                                        ),
                                        Text(
                                          temple.type.toUpperCase(),
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
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        _launchcall(temple.mob);
                                      },
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
                                  Text(
                                      "(${templeInfo[0].reviewCount} Reviews)"),
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
                                    "",
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
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              Text(
                                "Opening Hours",
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                              Row(
                                children: <Widget>[
                                  Text("24*7"),
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
                                            .copyWith(
                                                color: MyColors.darkGreen),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Color(0xffdbf3e8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Stats",
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                              SizedBox(height: 11),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text("5",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title),
                                      Text(
                                        "Workers",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("97 Years Ago",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title),
                                      Text(
                                        "Age",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("10",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title),
                                      Text(
                                        "Was Destroy",
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
                                    "Make A Visit",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  onPressed: () {
                                    // ignore: missing_required_param
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (index) => form(temple:temple.name)));
                                  },
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
        });
  }
}

_launchcall(mob) async {
  String url = 'tel:${mob}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchemail(mail) async {
  const url = 'mailto:hemantbanjara855@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
