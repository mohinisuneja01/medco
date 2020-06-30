import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Blog(AsyncSnapshot snapshot,BuildContext context) {
  return ListView(
    children: <Widget>[
      Text('${snapshot.data['article']['title']}',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,),
      SizedBox(height: 30,),
      Image.network(snapshot.data['article']['images'][0], height: MediaQuery
          .of(context)
          .size
          .height / 2.5, width: MediaQuery
          .of(context)
          .size
          .width,),
      Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 30),
        child: Text('By ' + snapshot.data['article']['author'],
          style: TextStyle(color: Colors.blue), textAlign: TextAlign.center,),
      ),
      Text(snapshot.data['article']['summary'], style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
      SizedBox(height: 30,),
      //(snapshot.data['article']['images'].length>2)?Image.network(snapshot.data['article']['images'][1],height: MediaQuery.of(context).size.height/2.5,width: MediaQuery.of(context).size.width,):null,
      SizedBox(height: 30,),
//      ListView.builder(
//        itemBuilder: (BuildContext context,int index){
          Text(snapshot.data['article']['text'], style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,),
       // },
        //itemCount: snapshot.data['article']['text'].split('\n').length,
      //),
      SizedBox(height: 30,),
      Text('Published on ' + snapshot.data['article']['pub_date'].split(' ')[0],
        style: TextStyle(fontSize: 14, color: Colors.grey),
        textAlign: TextAlign.center,),
    ],
  );
//
//return Column(
//   children: <Widget>[
//     ListView.builder(shrinkWrap:true,itemCount:snapshot.data['article']['text'].split('\n').length,itemBuilder: (context,index){
//
//       return Text(snapshot.data['article']['text'].split('\n')[index]);
//
//     }),
//   ],
//);
}