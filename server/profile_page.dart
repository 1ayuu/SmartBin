import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/NavigationDrawer.dart';
import 'package:flutter_app1/widgets/my_app_bar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: NavigationDrawer(),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.green.withOpacity(0.4),
            ),
            clipper: getClipper(),
          ),
          Positioned(
            width: 350.0,

            top: MediaQuery.of(context).size.height/5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  /*decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                     // image: Image.asset('assets/Profile.jpg'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)
                    ),
                      boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.green)
                      ]

                  ),*/

                ),
                SizedBox(height: 90.0,),
                Text(
                    'Anushka Parajuli'
              /*  style: TextStyle[
                  fontSize: 30.0,
                    fontWeight : FontWeight.bold,
                    fontFamily : 'MonteSerrat'
                    ]*/
                ),
                SizedBox(height: 30.0,),
                Text(
                    'Dustbin Id : 1010'
                   /* style: TextStyle[
                    fontSize: 15.0,
                    fontWeight : FontWeight.bold,
                    fontFamily : 'MonteSerrat'

                    ]*/
                )

              ],
            ),
          )
        ],
      )
    );
  }
}
class getClipper extends CustomClipper<Path>{
@override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height/1.9);
    path.lineTo(size.width + 125 , 0.0 );
    path.close();
    return path;


  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper )
  {
    return true;
  }

}
