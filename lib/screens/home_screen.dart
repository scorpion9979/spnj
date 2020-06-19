import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spnj/widgets/field_button.dart';
import 'package:spnj/widgets/field_text_area.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:like_button/like_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final _firestore = Firestore.instance;

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _ideaController = TextEditingController();

  FirebaseUser user;
  int _page;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    setState(() {
      _page = 0;
    });
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
      isHome: true,
      backgroundColor: Color(0xFFF2E368),
      children: <Widget>[
        _page == 0
            ? Container(
                height: MediaQuery.of(context).size.height - 80,
                child: StreamBuilder(
                  stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    final List<DocumentSnapshot> posts =
                        snapshot.data.documents;
                    return ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      children: posts.map((p) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Post(post: p, user: user),
                        );
                      }).toList(),
                    );
                  },
                ),
              )
            : _page == 1
                ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FieldTextArea(
                          controller: _ideaController,
                          hintText: 'Write your thoughts..',
                          autoFocus: true,
                          keyboardType: TextInputType.text,
                        ),
                        FieldButton(
                          text: 'Submit Idea',
                          onPressed: () {
                            final Map<String, dynamic> data = {
                              'text': _ideaController.text,
                              'user': user.displayName,
                              'likes': [],
                              'dislikes': [],
                              'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch,
                            };
                            if (_ideaController.text.isNotEmpty) {
                              _firestore.collection('posts').add(data);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(user.displayName),
                  ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, -1.0),
                end: Alignment(0, -0.2),
                colors: [
                  Color(0xFFF2E368).withOpacity(0),
                  Color(0xFFF2E368),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CurvedNavigationBar(
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
        ),
      ],
    );
  }
}

class Post extends StatelessWidget {
  final post;
  final user;
  const Post({this.post, this.user});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 145,
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${post['user']}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${post['text']}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      LikeButton(
                        onTap: (t) async {
                          if (!t) {
                            // log(post['likes'].toString());
                            final data = {
                              'likes': FieldValue.arrayUnion([user.displayName]),
                              'dislikes': FieldValue.arrayRemove([user.displayName]),
                            };
                            Timer(const Duration(milliseconds: 750), () {
                              _firestore.collection('posts').document(post.documentID).updateData(data);
                            });
                            // log(post['likes'].toString());
                            return true;
                          } else {
                            // log(post['likes'].toString());
                            final data = {
                              'likes': FieldValue.arrayRemove([user.displayName]),
                            };
                            Timer(const Duration(milliseconds: 750), () {
                              _firestore.collection('posts').document(post.documentID).updateData(data);
                            });
                            // log(post['likes'].toString());
                            return false;
                          }
                        },
                        isLiked: post['likes'].contains(user.displayName),
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
                        likeCount: post['likes'].length,
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
                        onTap: (t) async {
                          if (!t) {
                            // log(post['likes'].toString());
                            final data = {
                              'dislikes': FieldValue.arrayUnion([user.displayName]),
                              'likes': FieldValue.arrayRemove([user.displayName]),
                            };
                            
                            Timer(const Duration(milliseconds: 500), () {
                              _firestore.collection('posts').document(post.documentID).updateData(data);
                            });
                            // log(post['likes'].toString());
                            return true;
                          } else {
                            // log(post['likes'].toString());
                            final data = {
                              'dislikes': FieldValue.arrayRemove([user.displayName]),
                            };
                            
                            // log(post['likes'].toString());
                            Timer(const Duration(milliseconds: 500), () {
                              _firestore.collection('posts').document(post.documentID).updateData(data);
                            });
                            return false;
                          }
                        },
                        isLiked: post['dislikes'].contains(user.displayName),
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
                        likeCount: post['dislikes'].length,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
