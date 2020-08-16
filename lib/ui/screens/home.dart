import 'package:flutter/material.dart';
import 'package:book_darshan/global.dart';
import 'package:book_darshan/login/login_ui.dart';
import 'package:book_darshan/ui/widgets/temple_container.dart';
import 'care.dart';

class HomeScreen extends StatelessWidget {
  String NAME = 'Hemant';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello,",
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              NAME,
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.white70, // button color
                          child: InkWell(
                            splashColor: Colors.grey, // inkwell color
                            child: SizedBox(width: 57, height: 57, child: Icon(Icons.account_circle,
                            size: 57,)),
                            onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  login(),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Desire Temple",
                      filled: true,
                      fillColor: MyColors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 9),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CareScreen(id: 0),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                'assets/icons/temple.png'
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              padding: const EdgeInsets.all(11.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: MyColors.blue.withOpacity(.3),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Need Help To Book Appointment?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    color: MyColors.blue,
                                    child: Text(
                                      "Customer Service",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CareScreen(id: 0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 9),
                  Text("Categories", style: Theme.of(context).textTheme.title),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 9.0),
                    height: 71,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        categories.length,
                        (f) => Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 2),
                          margin: const EdgeInsets.symmetric(horizontal: 9.0),
                          padding: const EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors.grey),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: categories[f]['color'],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Image.asset("${categories[f]['icon']}"),
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text("${categories[f]['title']}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                color: MyColors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Top Temples",
                        style: Theme.of(context).textTheme.title,
                      ),
                      FlatButton(
                        child: Text("See All"),
                        onPressed: () {},
                      )
                    ],
                  ),
                  ListView.builder(
                    itemCount: templeInfo.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) => TempleContainer(id: i),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
