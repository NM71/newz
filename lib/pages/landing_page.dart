import 'package:flutter/material.dart';

import 'home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/images/landing-lib.jpeg',
                width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.7,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('News from around the\n       world for you',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('Best time to read , take your time to read\n            a bit more about this world',style: TextStyle(color:Colors.black45, fontSize: 18,),),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 10,
                shadowColor: Colors.green,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(30),),
                    // child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500),),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white,size: 30,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
