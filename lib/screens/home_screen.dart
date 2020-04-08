import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:like_button/like_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser user;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser();
      if (currentUser != null) {
        user = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: Color(0xFFF2E368),
      children: <Widget>[
        Idea(),
      ],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Color(0xFFF2E368),
        animationDuration: Duration(milliseconds: 400),
        animationCurve: Curves.easeInOutQuad,
        height: 55,
        items: <Widget>[
          Icon(Icons.view_stream, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        onTap: (index) {
          setState(() => _page = index);
        },
      ),
    );
  }
}

class Idea extends StatelessWidget {
  const Idea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 149,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Snakes probably think garden hoses are statues of famous snakes',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    LikeButton(
                      isLiked: false,
                      size: 30,
                      circleColor: CircleColor(
                        start: Colors.redAccent[50],
                        end: Colors.redAccent[200],
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.redAccent[100],
                        dotSecondaryColor: Colors.redAccent[300],
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.redAccent : Colors.grey,
                          size: 30,
                        );
                      },
                      likeCount: 0,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color = isLiked ? Colors.redAccent : Colors.grey;
                        Widget result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                        return result;
                      },
                    ),
                    LikeButton(
                      isLiked: false,
                      size: 30,
                      circleColor: CircleColor(
                        start: Colors.blueGrey,
                        end: Colors.blueGrey,
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.black,
                        dotSecondaryColor: Colors.blueGrey,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.delete,
                          color: isLiked ? Colors.black : Colors.grey,
                          size: 30,
                        );
                      },
                      likeCount: 0,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color = isLiked ? Colors.black : Colors.grey;
                        Widget result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                        return result;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
