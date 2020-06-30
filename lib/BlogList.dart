import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/widgets/Blog.dart';
import 'BlogFetch.dart';
class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  var data;
  List blogLinks=[
'https://fitbottomedgirls.com/2018/07/5-movement-meditation-practices-thatll-work-your-body-and-clear-your-mind/',
    'https://fitbottomedgirls.com/2018/05/the-stages-of-adrenal-fatigue/',
    'https://fitbottomedgirls.com/2018/04/why-your-self-care-practice-benefits-other-people/',
    'https://fitbottomedgirls.com/2018/04/10-tips-to-stop-rushing-in-your-life/',
    'https://fitbottomedgirls.com/2020/02/how-ending-negative-relationships-can-help-your-anxiety/',
    'https://fitbottomedgirls.com/2020/01/this-is-why-you-feel-like-youre-running-on-empty/',
    'https://fitbottomedgirls.com/2019/12/human-foods-you-can-and-cant-feed-your-dog/',
    'https://fitbottomedgirls.com/2019/12/5-ways-to-heal-from-your-past/',
    'https://fitbottomedgirls.com/2020/04/a-simple-way-to-help-the-planet-and-yourself/',
    'https://fitbottomedgirls.com/2020/04/when-good-vibes-only-goes-bad/',
    'https://fitbottomedgirls.com/2020/03/mindfulness-practices-to-help-you-get-through-co-working-with-your-family/',
    'https://fitbottomedgirls.com/2020/03/how-to-stop-being-so-distracted-all-the-time/'
  ];
  @override
  void initState() {
    super.initState();
    int num =Random.secure().nextInt(12);
    print(num);
    APIService apiService = APIService();
    data=apiService.get(url:blogLinks[num]);
  }

  @override
  Widget build(BuildContext context) {
    var FireStoreDB= Firestore.instance.collection("Links").snapshots();
    return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: FutureBuilder(
                  future: data,
                  builder: (context,AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                    return Blog(snapshot,context);
                    }
                    else
                      return Center(child: CircularProgressIndicator());
                  },
                ),
//        child: StreamBuilder(
//          stream: FireStoreDB,
//          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
//              if(snapshot.hasData)
//                return ListView.builder(itemCount: snapshot.data.documents.length,
//                    itemBuilder: (context,int index){return Card(child: Text(snapshot.data.documents[index]['Links'],style: TextStyle(color: Colors.purple),));});
//               else
//                 return CircularProgressIndicator();
//          },
//        ),
      ),
            ),
    );
  }

//  _CustomListItemBuilder(AsyncSnapshot<QuerySnapshot> snapshot,int index) {
//    APIService apiService = APIService();
//    Future future =apiService.get(endpoint:'/GET');
//        return future.then((value) => Text());
//
//
//          Text(snapshot.data.documents[index]['Links']);
 // }
}

