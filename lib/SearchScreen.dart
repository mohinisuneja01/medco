import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
//Future <Diseases> data;
  static int itemcount = 20;
  static int testCon=0;
  var firebaseDB = Firestore.instance.collection('Medico').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: firebaseDB,
          builder: (context, snapshot) {
            if(snapshot.hasData)
            return Container(
//            height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    CustomTextScreen(snapshot),
                    Expanded(
                      child: ListView.builder(
                          itemCount: (testCon==0)?itemcount:snapshot.data.documents.length,
                          itemBuilder: (context, int index) {

//                            print(Firestore.instance
//                                .collection('Medico')
//                                .where('name',
//                                isGreaterThanOrEqualTo: query,
//                                isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length-1) + 1))
//                                .snapshots().listen((data)=>data.documents.forEach((doc)=>print(doc['name']))));
                            return _DiseaseDetail(snapshot.data, index);
                          }),
                    ),
                  ],
                ),
            );
            else
              return Center(child: CircularProgressIndicator());
          }
      ),);
  }


  _DiseaseDetail(QuerySnapshot snapshot, int index) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            child: Card(
              child: Center(
                child: ListTile(
                  subtitle: Text('${snapshot.documents[index]['overview'].toString().substring(0,80).replaceAll('[',' ')} ...'),
                  title: Text(snapshot.documents[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:18 ),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>_DiseaseCompleteDetail(snapshot,index)

                    ,));
                  },
                ),
              ),
            ),
          ),
        ),
        if((index==itemcount-1)&&((itemcount+20)<=snapshot.documents.length))
          FlatButton(
            onPressed:(){
              setState(() {
                itemcount+=20;
              });
            } ,
            child: Text('More',),
          )
      ],
    );
  }

//  _DiseaseCompleteDetail(QuerySnapshot snapshot, int index) {
//    return Scaffold(appBar: AppBar( title:Text(snapshot.documents[index]['name'])),
//    body: Container(
//      child: ListView(
//        children: <Widget>[Column(
//          children: <Widget>[
//            if(snapshot.documents[index]['overview']!='')
//              Container(
//                  height: 80,
//                  width: 400,
//                  color: Color(0xFF87E6D5),
//                  alignment: Alignment.center,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text('Over View',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B))),
//                  )),
//            if(snapshot.documents[index]['overview']!='')
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Container(
//                    child: Text(snapshot.documents[index]['overview'].toString().replaceAll('\n', ' '),style: TextStyle(fontSize: 16),)),
//              ),
//            if(snapshot.documents[index]['symptoms']!='')
//          Container(
//            height: 80,
//             width: 400,
//             color: Color(0xFF87E6D5),
//            alignment: Alignment.center,
//             child: Padding(
//              padding: const EdgeInsets.all(8.0),
//               child:   Text('Symptoms',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),)),),
//            if(snapshot.documents[index]['symptoms']!='')
//              Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//
//                      child:Text(snapshot.documents[index]['symptoms'].toString().replaceAll('[', ' '),style: TextStyle(fontSize: 16),),
//                  )),
//            if(snapshot.documents[index]['home_remedies']!='')
//    Container(
//    height: 80,
//    width: 400,
//    color: Color(0xFF87E6D5),
//    alignment: Alignment.center,
//    child: Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Text('Home Remedies',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),))),
//            if(snapshot.documents[index]['home_remedies']!='')
//              Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                      child:Text(snapshot.documents[index]['home_remedies'].toString(),style: TextStyle(fontSize: 16) ,))),
//            if(snapshot.documents[index]['causes']!='')
//    Container(
//    height: 80,
//    width: 400,
//    color: Color(0xFF87E6D5),
//    alignment: Alignment.center,
//    child: Padding(
//    padding: const EdgeInsets.all(8.0),
//    child:  Text('Causes',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),))),
//            if(snapshot.documents[index]['causes']!='')
//              Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//
//                      child:Text(snapshot.documents[index]['causes'].toString(),style: TextStyle(fontSize: 16)))),
//            if(snapshot.documents[index]['treatment']!='')
//    Container(
//    height: 80,
//    width: 400,
//    color: Color(0xFF87E6D5),
//    alignment: Alignment.center,
//    child: Padding(
//    padding: const EdgeInsets.all(8.0),
//    child:    Text('Treatment',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),))),
//            if(snapshot.documents[index]['treatment']!='')
//    Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Container(
//
//    child:Text(snapshot.documents[index]['treatment'].toString(),style: TextStyle(fontSize: 16),))),
//
//
//          ],
//        ),],
//      ),
//
//    ),
//
//
//    );
//
//  }

  _DiseaseCompleteDetail(QuerySnapshot snapshot, int index) {
    return Scaffold(appBar: AppBar( title:Text(snapshot.documents[index]['name'])),
      body: Container(
        child: ListView(
          children: <Widget>[Column(
            children: <Widget>[
              if(snapshot.documents[index]['overview']!='')
                Container(
                    height: 80,
                    width: 400,
                    //color: Color(0xFF87E6D5),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Over View',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(0xFF00796B),fontFamily: "Satisfy")),
                    )),
              if(snapshot.documents[index]['overview']!='')
              // Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Text(snapshot.documents[index]['overview'].toString().replaceAll('\n', ' '),style: TextStyle(fontSize: 16),)),
                ),
              //Divider(),
              if(snapshot.documents[index]['symptoms']!='')
                Container(
                  height: 80,
                  width: 400,
                  //color: Color(0xFF87E6D5),
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Text('Symptoms',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(0xFF00796B),fontFamily: "Satisfy"),)),),
              // Divider(),
              if(snapshot.documents[index]['symptoms']!='')
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      child:Text(snapshot.documents[index]['symptoms'].toString().replaceAll('[', ' '),style: TextStyle(fontSize: 16),),
                    )),
              // Divider(),
              if(snapshot.documents[index]['home_remedies']!='')
                Container(
                    height: 80,
                    width: 400,
                    //color: Color(0xFF87E6D5),
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Home Remedies',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(0xFF00796B),fontFamily: "Satisfy"),))),

              if(snapshot.documents[index]['home_remedies']!='')
              // Divider(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                        child:Text(snapshot.documents[index]['home_remedies'].toString(),style: TextStyle(fontSize: 16) ,))),

              if(snapshot.documents[index]['causes']!='')
              //Divider(),
                Container(
                    height: 80,
                    width: 400,
                    //color: Color(0xFF87E6D5),
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Text('Causes',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(0xFF00796B),fontFamily: "Satisfy"),))),
              //Divider(),
              if(snapshot.documents[index]['causes']!='')
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                        child:Text(snapshot.documents[index]['causes'].toString(),style: TextStyle(fontSize: 16)))),
              //Divider(),
              if(snapshot.documents[index]['treatment']!='')
                Container(
                    height: 80,
                    width: 400,
                    //color: Color(0xFF87E6D5),
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:    Text('Treatment',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(0xFF00796B),fontFamily: "Satisfy"),))),
              //Divider(),
              if(snapshot.documents[index]['treatment']!='')
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                        child:Text(snapshot.documents[index]['treatment'].toString(),style: TextStyle(fontSize: 16),))),


            ],
          ),],
        ),

      ),


    );

  }

 Widget CustomTextScreen(AsyncSnapshot snapshot) {
//    var itemc=firebaseDB.length;
//    itemc.then((value) => assignItemCount(value));
    return TextField(
      style: TextStyle(fontSize: 21),
      decoration: InputDecoration(hintText: 'Enter Disease',contentPadding: EdgeInsets.only(left: 15,top: 15,bottom: 5),hintStyle: TextStyle(fontSize: 21)),
      textCapitalization: TextCapitalization.words,
      onChanged: (String query){

        setState((){
  if(query== '')
    {firebaseDB=Firestore.instance.collection('Medico').snapshots();
  itemcount=20;
    testCon=0;
    }
  else{
  firebaseDB=Firestore.instance.collection('Medico').where('name', isGreaterThanOrEqualTo:query,
      isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length-1) + 1)).snapshots();
    testCon=1;
  }
});
      },
    );
 }
}