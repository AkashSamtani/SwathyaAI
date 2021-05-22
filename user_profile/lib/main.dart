import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:userprofile/desease.dart';
import 'package:userprofile/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int mvalue = 0;
  int fvalue = 0;
  int aplusBlood = 0;
  int abBlood = 0;
  int bplusBlood = 0;
  String blood = "Blood Group";
  @override

  String Name;
  String Surname;
  String Gender = "Gender";
  String Dob = "Dob";
  String pinCode;
  String contactNumber;
  List<String> comorbidities = ["Cough","headache","Breathlessness","Sweating","Fever","Body Ache","Chest Pain","Heart Burn","Nausea","Diziness"];
  List<String> _selectedAllergies = [];
  List<String> _selectedcomorbidities = [];
  List<String> X = [];

  getListData(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      X = myPrefs.getStringList(key);
    });
  }


  Widget colorButton(String title){
    return Container(
      width: 180,
      child: RaisedButton(
        onPressed: () {print('Button Clicked');},
        child: Text('$title'),
        color: Colors.deepOrange,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(38.0),
        ),
        //      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Select Gender",
                    style: TextStyle(fontSize: 24.0,color: Colors.blueAccent,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          children: [
                        mvalue == 0 ? Container(
                                child: TextButton(
                                    onPressed: (){
                                  setState(() {
                                    mvalue = 1;
                                    fvalue = 0;
                                  });
                                  Navigator.pop(context);
                                  openAlertBox();
                                },
                                child: Text("Male",style: TextStyle(color: Colors.grey,fontSize: 18),))) :colorButton("Male"),


                          fvalue == 0 ? Container(
                                 child: TextButton(
                                   onPressed: (){
                                    setState(() {
                                      mvalue = 0;
                                      fvalue = 1;
                                });
                                    Navigator.pop(context);
                                    openAlertBox();
                              },
                                  child: Text("Female",style: TextStyle(color: Colors.grey,fontSize: 18),))) : colorButton("Female"),
                          ],
                        ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 30.0, right: 30.0,bottom: 20),
                    child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                              TextButton(onPressed: (){
                                setState(() {

                                  if(mvalue == 1){
                                    Gender = "Male";
                                  }
                                  if(fvalue == 1){
                                    Gender = "Female";
                                  }

                                });

                                Navigator.pop(context);
                              },
                                  child: Text("SELECT",style: TextStyle(color: Colors.orangeAccent,fontSize: 20),)),


                          TextButton(onPressed: (){
                                Navigator.pop(context);
                          }, child: Text("CANCEL",style: TextStyle(color: Colors.black,fontSize: 20),))

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  openAlertBox2() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Select Blood Group",
                    style: TextStyle(fontSize: 24.0,color: Colors.blueAccent,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: [
                        aplusBlood == 0 ? Container(
                            child: TextButton(
                                onPressed: (){
                                  setState(() {
                                    aplusBlood = 1;
                                    abBlood = 0;
                                    bplusBlood = 0;
                                  });
                                  Navigator.pop(context);
                                  openAlertBox2();
                                },
                                child: Text("A+",style: TextStyle(color: Colors.grey,fontSize: 18),))) :colorButton("A+"),
                        abBlood == 0 ? Container(
                            child: TextButton(
                                onPressed: (){
                                  setState(() {
                                    aplusBlood = 0;
                                    abBlood = 1;
                                    bplusBlood = 0;
                                  });
                                  Navigator.pop(context);
                                  openAlertBox2();
                                },
                                child: Text("AB",style: TextStyle(color: Colors.grey,fontSize: 18),))) : colorButton("AB"),
                        bplusBlood == 0 ? Container(
                            child: TextButton(
                                onPressed: (){
                                  setState(() {
                                    aplusBlood = 0;
                                    abBlood = 0;
                                    bplusBlood = 1;
                                  });
                                  Navigator.pop(context);
                                  openAlertBox2();
                                },
                                child: Text("B+",style: TextStyle(color: Colors.grey,fontSize: 18),))) :colorButton("B+"),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 30.0, right: 30.0,bottom: 20),
                    child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(onPressed: (){
                            setState(() {

                              if (aplusBlood == 1)
                                blood = "A+";
                              if (abBlood == 1)
                                blood = "AB";
                              if (bplusBlood == 1)
                                blood = "B+";
                            });

                            Navigator.pop(context);
                          },
                              child: Text("SELECT",style: TextStyle(color: Colors.orangeAccent,fontSize: 20),)),


                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("CANCEL",style: TextStyle(color: Colors.black,fontSize: 20),))

                        ],
                      ),
                    ),
                  ),



                ],
              ),
            ),
          );
        });
  }
  DateTime picked;
  selectDate(BuildContext context) async {
     picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(

          data: ThemeData(
            primarySwatch: Colors.orange,

            //selection color
            dialogBackgroundColor: Colors.white, //Background color
          ),
          child: child,
        );
      },
    );
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackBar(String message,int duration) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(' ! ' + message +' ! '),
      duration: Duration(seconds: duration),
      backgroundColor: Colors.grey,
      action: SnackBarAction(
        label: 'close',
        textColor: Colors.black,
        onPressed: scaffoldKey.currentState.hideCurrentSnackBar,
      ),
    ));
  }

  Color mycolor = Colors.white;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: mycolor,
        key: scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.89,
                        width: MediaQuery.of(context).size.width,
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.8,
                                    height: MediaQuery.of(context).size.height*0.25,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(25.0,46,0,0),
                                      child: Text("Tell us about \n yourself.",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        height: 140,
                                      ),
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.person,size: 50,),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                             // SizedBox(height: 20,),
                              Container(
                                color: Colors.orange,
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.2,
                                  height: MediaQuery.of(context).size.height*0.048,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.blue[400],
                                          Colors.blue[400],
                                          //Colors.blue[700],
                                        ]
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                                  ),
                                ),
                              ),

                              //textfields
//                          SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30.0,0,0,10),
                                child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        style: TextStyle(color: Colors.white,fontSize: 25),
                                        autocorrect: false,
//                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            hintText: 'First Name',
                                            hintStyle: TextStyle(color: Colors.white,fontSize: 15),
                                            contentPadding: const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                          ),
                                          // trigger when value changes
                                          onChanged: (val) {
                                            Name = val;
                                          }
                                      ),
                                    ),
                                    SizedBox(width: 60,),
                                    Container(
                                      width: 120,
                                      child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: TextStyle(color: Colors.white,fontSize: 25),
                                          autocorrect: false,
//                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            hintText: 'Last Name',
                                            hintStyle: TextStyle(color: Colors.white,fontSize: 15),
                                            contentPadding: const EdgeInsets.all(10.0),
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                          ),
                                          // trigger when value changes
                                          onChanged: (val) {
                                            Surname = val;
                                          }
                                      ),
                                    ),
//                              TextField(),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30.0,0,0,0),
                                child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: TextButton(
                                        style: ButtonStyle(),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(" $Dob",style: TextStyle(color: Colors.white,fontSize: 20,),),
                                            Divider(color: Colors.white,thickness: 1.2,indent: 0,),
                                          ],
                                        ),
                                        onPressed: ()async {
                                         await selectDate(context);
                                          setState(() {
                                            var x;
                                            x = picked.toString().split(" ");
                                            Dob = x[0];
                                          });

                                        },
                                      ),
                                      // trigger when value changes
                                    ),
                                    SizedBox(width: 60,),
                                    Container(
                                      width: 120,
                                      child: TextButton(
                                        style: ButtonStyle(),

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(" $Gender",style: TextStyle(color: Colors.white,fontSize: 19,),),
                                              Divider(color: Colors.white,thickness: 1.2,indent: 0,),
                                            ],
                                          ),
                                        onPressed: (){
                                           openAlertBox();
                                        },
                                          ),
                                          // trigger when value changes
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30.0,0,0,0),
                                child: Container(
                                  width: 120,
                                  child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white,fontSize: 25),
                                      autocorrect: false,
//                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      decoration: const InputDecoration(
                                        hintText: 'Pin Code',
                                        hintStyle: TextStyle(color: Colors.white,fontSize: 15),
                                        contentPadding: const EdgeInsets.all(10.0),
                                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                      ),
                                      // trigger when value changes
                                      onChanged: (val) {
                                        pinCode = val;
                                      }
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30.0,0,0,10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white,fontSize: 25),
                                      autocorrect: false,
//                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      decoration: const InputDecoration(
                                        hintText: 'Emergency Contact number',
                                        hintStyle: TextStyle(color: Colors.white,fontSize: 15),
                                        contentPadding: const EdgeInsets.all(10.0),
                                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                      ),
                                      // trigger when value changes
                                      onChanged: (val) {
                                        contactNumber = val;
                                      }
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  width: 120,
                                  child: TextButton(
                                    style: ButtonStyle(),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(" $blood",style: TextStyle(color: Colors.white,fontSize: 15,),),
                                        Divider(color: Colors.white,thickness: 1.4,indent: 0,),
                                      ],
                                    ),
                                    onPressed: (){
                                      openAlertBox2();
                                    },
                                  ),
                                  // trigger when value changes
                                ),
                              ),
                              Padding(padding: const EdgeInsets.only(left: 30),
                              child: Container(
//                                width: 120,
                                    child: TextButton(
                                      style: ButtonStyle(),

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Allergy:  ",style: TextStyle(color: Colors.white,fontSize: 15,),),
                                              Icon(Icons.add_circle_outline,color: Colors.white,)
                                            ],
                                          ),
                                          if(_selectedAllergies != null )...[
                                            Wrap(
                                              children: [
                                                for (var i in _selectedAllergies)...[
                                                  Text("$i",style: TextStyle(color: Colors.white,backgroundColor: Colors.black12),),
                                                  SizedBox(width: 10,),
                                                ]
                                              ],
                                            ),
                                            Divider(color: Colors.white,thickness: 1.4,indent: 0,),
                                          ],
                                        ],
                                      ),
                                      onPressed: ()async {
                                        await Navigator.push(context, MaterialPageRoute(builder: (context) => Select(deseases: comorbidities,selectedList: _selectedAllergies,title: "Add Allergies",)));
  //                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Select(deseases: comorbidities,selectedList: _selectedcomorbidities,title: "Add  Comorbidies",)));

                                        await getListData("Add Allergies");
                                        setState(() {
                                          _selectedAllergies = X;
                                        });
                                        },
                                    ),
                                    // trigger when value changes
                                  ),

                            ),
                              Padding(padding: const EdgeInsets.only(left: 30),
                                child: Container(
//                                width: 120,
                                  child: TextButton(
                                    style: ButtonStyle(),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Comorbidities:  ",style: TextStyle(color: Colors.white,fontSize: 15,),),
                                            Icon(Icons.add_circle_outline,color: Colors.white,)
                                          ],
                                        ),
                                        if(_selectedcomorbidities != null )...[
                                          Wrap(
                                            children: [
                                              for (var i in _selectedcomorbidities)...[
                                                Text("$i",style: TextStyle(color: Colors.white,backgroundColor: Colors.black12),),
                                                SizedBox(width: 10,),
                                              ]

                                            ],
                                          ),
                                          Divider(color: Colors.white,thickness: 1.4,indent: 0,),
                                        ],
                                        ],
                                    ),
                                    onPressed: ()async {
                                      //await Navigator.push(context, MaterialPageRoute(builder: (context) => Select(deseases: comorbidities,selectedList: _selectedAllergies,title: "Add Allergies",)));
                                      await Navigator.push(context, MaterialPageRoute(builder: (context) => Select(deseases: comorbidities,selectedList: _selectedcomorbidities,title: "Add Comorbidities",)));

                                      await getListData("Add Comorbidities");
                                      setState(() {
                                        _selectedcomorbidities = X;
                                      });
                                    },
                                  ),
                                  // trigger when value changes
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            color:Colors.blue[700],
                            width: MediaQuery.of(context).size.width*0.2,
                            height: MediaQuery.of(context).size.height*0.08,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.18*2,
                            buttonColor:Colors.blue[800],
                            child: RaisedButton(
                              onPressed: ()async{

                                if(Name == null){
                                  showSnackBar("Name shouldn't be empty",3);
                                }

                                else if(Surname == null){
                                  showSnackBar("Name shouldn't be empty",3);
                                }
                                else if(Dob == "Date of Birth"){
                                  showSnackBar("Date shouldn't be empty",3);
                                }
                                else if(Gender == "Gender"){
                                  showSnackBar("Gender shouldn't be empty",3);
                                }
                                else if(pinCode == null || pinCode.length != 6){
                                  showSnackBar("Invalid Pincode ",3);
                                }
                                else if(contactNumber == null || contactNumber.length == 9){
                                  showSnackBar("Invalid Number ",3);
                                }
                                else if(blood == null ){
                                  showSnackBar("Please Select BloodGroup",3);
                                }

                               else{

                                  var databasesPath = await getDatabasesPath();
                                  String path = databasesPath+'/dummydatabase.db';
                                  Database database = await openDatabase(path, version: 1,
                                      onCreate: (Database db, int version) async {
                                        // When creating the db, create the table

                                        await db.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY,FirstName Text,LastName Text,DOB Text,Gender Text,Pincode Text,MobileNumber Text,Bloodgroup Text,Allergy Text,Comorbidities Text )');
                                        print("hello");
                                      });

                                  await database.transaction((txn) async {
                                    await txn.rawInsert(

                                        'INSERT INTO Test(FirstName,LastName,DOB,Gender,Pincode ,MobileNumber ,Bloodgroup,Allergy,Comorbidities)values("$Name","$Surname","$Dob","$Gender","$pinCode","$contactNumber","$blood","$_selectedAllergies","$_selectedcomorbidities")');
                                  });

                                  List<Map> result = await database.rawQuery(
                                      "SELECT * FROM Test;"
                                  );

                                  print(result.length);
                                  print(result);

//                                  showSnackBar("Data Successfully Saved",3);
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => welcome(Name: Name+" "+Surname,)));


                                }
                                },
                                child: Text("profile",style: TextStyle(color: Colors.white),),
                            color: Colors.blue[800],
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
   ),
    );
  }


}
class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;
  MultiSelectChip(this.reportList, {this.onSelectionChanged});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List();
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}