import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  String Name;
  welcome({this.Name});

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Color mycolor = Colors.white;



  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mycolor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.4,
                              width: MediaQuery.of(context).size.width*0.9,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.blue[400],
                                      Colors.blue[400],
                                      Colors.blue[800],
                                    ]
                                ),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),),
                              ),

                            ),
                            Container(
                              color:Colors.blue[400],
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.height*0.07,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 30,),
                                    Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 20,),
                                    Text("${widget.Name}",style: TextStyle(fontSize: 30,),),
//                                Text("Sumit Jeswani"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 100,),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.18*2,
                          buttonColor:Colors.blue[800],
                          child: RaisedButton(
                              onPressed: (){

                              },
                              child: Text("Lets Get Started",style: TextStyle(color: Colors.white),),
                              color: Colors.blue[800],
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                          ),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.height*0.8,
                        ),
                        PhysicalModel(
                          elevation: 10,
                          color: Colors.black,
                          shape: BoxShape.circle,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person,size: 80,color: Colors.orangeAccent[100],),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
