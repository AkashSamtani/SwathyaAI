import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Select extends StatefulWidget {
  List<String> deseases = [];
  List<String> selectedList = [];
  String title;
  Select({this.deseases, this.selectedList,this.title});
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  setListData(String key, List<String> value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setStringList(key, value);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.,
          children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*0.73,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),),
                  ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25.0,46,0,0),
                      child: Text("\n ${widget.title} ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                    )
                ),
                Container(
                  color:Colors.orangeAccent,
                  width: MediaQuery.of(context).size.width*0.2,
                  height: MediaQuery.of(context).size.height*0.07,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("    Please Choose Symptoms\n",style: TextStyle(fontSize: 20,color: Colors.grey),),
                      ],
                    ),
                    MultiSelectChip(
                        widget.deseases,
                        onSelectionChanged: (selectedList) {
                          setState(() {
                            widget.selectedList = selectedList;
                          });
                        },
                      ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width*0.4,
                      child: RaisedButton(
                          onPressed: (){
                            setListData(widget.title, widget.selectedList);
                              Navigator.pop(context);
                            },
                          child: Text("  ADD  ",style: TextStyle(color: Colors.white),),
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      ),
                    ),
                  ],
                ),
            ),

          ],
        ),
      ),
//            t: Text("Flutter Choice Chip"),
//      Center(
//        child: MultiSelectChip(
//          widget.deseases,
//          onSelectionChanged: (selectedList) {
//            setState(() {
//              widget.selectedList = selectedList;
//            });
//          },
//        ),
//      ),
//            actions: <Widget>[
//              FlatButton(
//                child: Text("Report"),
//                onPressed: () => Navigator.of(context).pop(),
//              )
//            ],
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