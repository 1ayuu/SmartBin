import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/NavigationDrawer.dart';
import 'package:flutter_app1/widgets/my_app_bar.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection("binState");

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
  }

  
  Widget getAvatar(String state){
    if(state=="full"){
      return   new CircleAvatar(
        // child: new Text(snapshot[index].data["state"]),
        child: Icon(Icons.hourglass_full),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      );
    }else if(state=="empty"){
      return   new CircleAvatar(
        // child: new Text(snapshot[index].data["state"]),
        child: Icon(Icons.hourglass_empty),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      );
    }
  }

  Widget getStateText(String state){
    String message = "";
    if (state == "full"){
      message = "Dustbin is FULL";
  }else if(state == "empty"){
      message = "Dustbin is EMPTY";
    }
    return Text(message, style: TextStyle(fontWeight: FontWeight.bold),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: NavigationDrawer(),
      body: new ListView.builder(
          reverse: true,
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            return new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getAvatar(snapshot[index].data["state"])
                  ,
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Container(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //new Text(snapshot[index].data["state"]),
                          getStateText(snapshot[index].data["state"]),
                          new Text(snapshot[index].documentID,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
