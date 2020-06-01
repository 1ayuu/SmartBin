import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/NavigationDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app1/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }


  List<Widget> getImageList(){
    return [Image.asset('assets/1.png'),
    Image.asset('assets/2.png'),
    Image.asset('assets/3.png'),
    Image.asset('assets/4.png'),
    Image.asset('assets/5.png')
    ];

  // return[Text("text1"),Text("Text2")];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: myAppBar(),
      drawer: NavigationDrawer(),
      body: Center(child:
      Padding(
        padding: const EdgeInsets.all(8.0),2
        child: CarouselSlider(
          height: 10 00.0,
          items: getImageList()
        ),
      ),

      )

    );
  }
}
    
