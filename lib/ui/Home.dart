import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medico/SearchScreen.dart';
import 'package:medico/home_remedies.dart';
import 'package:medico/ui/signUp.dart';
import 'package:medico/widgets/botton_nav_bar.dart';
import 'package:medico/BlogList.dart';
import 'package:medico/bot_ui.dart';
class Home extends StatefulWidget {
  //final String userName;
  //final String password;
 // Home();
  final FirebaseUser user;
  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //String userName;
  //String password;
  //_HomeState();
  int _currentItem=0;
   String _title;
  static List<Widget> _widgetOptions = <Widget>[-*]\
     BlogList(),
    SearchScreen(),
    homeRemedy(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentItem = index;
    });
  }
  var profileData;
@override
  void initState() {
        super.initState();
        //profileData=
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar:BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentItem,
        type: BottomNavigationBarType.shifting,

        unselectedItemColor: Color(0xFF87E6D5),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home'),backgroundColor: Color(0xFF00796B)),
          BottomNavigationBarItem(
            //activeIcon: ,

//              icon:IconButton(icon: Icon(Icons.cached),onPressed:(){Navigator.push(context, MaterialPageRoute(
//    builder: (context) =>
//    homeRemedy()));
  //} ,)
    icon: FaIcon(FontAwesomeIcons.disease) ,backgroundColor: Color(0xFF00796B),title: Text("Disease"))
          ,
          BottomNavigationBarItem(icon: Icon(Icons.blur_on),title: Text('Corona Tracker'),backgroundColor: Color(0xFF00796B)),
          //BottomNavigati
          // onBarItem(icon: Icon(Icons.person),title: Text('Remedies'),backgroundColor: Color(0xFF00796B))
        ],
        onTap: _onItemTapped
      ) ,

//      bottomNavigationBar: BottomBar(),
      floatingActionButton: ChatIcon(context),
      drawer: AppDrawer(context,widget.user),
      body: Center(
        child: _widgetOptions.elementAt(_currentItem)      ),
    );

  }

}

AppBar CustomAppBar(){
//if(state==0){
//  title1="Health Blogs";
//}
//if(state==1){
//  title1="Home Remedies";
//}
//if(state==2)
//  {title1="";}
//if(state==3){
//  title1="";
//}
Icon customIon=Icon(Icons.search);
 Widget customText=Text("HOME REMEDIES");
  return AppBar(
    title: Text("Medico"),
    backgroundColor: Color(0xFF00796B),
    centerTitle: true,

  );
}


Widget ChatIcon(BuildContext context){
  return FloatingActionButton(child: Icon(Icons.chat_bubble),backgroundColor: Color(0xFF00796B),
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            MyApp()));
  },);
}


Drawer AppDrawer(BuildContext context,FirebaseUser user){
 String title1;
 if(user!=null){
   title1="Sign Out";

 }
 else
   title1="Sign in";
  return Drawer(
          child:ListView(
            children: <Widget>[
              DrawerHeader(child: Column(
                children: <Widget>[
                  Container(
                    //color: Colors.blue,
                    height: 90,
                    width: 100,
alignment: Alignment.center,
                    child: FaIcon(FontAwesomeIcons.user,size: 70),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(50.0),
                        //image: DecorationImage(image: NetworkImage('https://image.shutterstock.com/z/stock-photo-mountains-during-sunset-beautiful-natural-landscape-in-the-summer-time-407021107.jpg'),fit: BoxFit.fill)
                    ),
                  ),
                  Text("${user.email.split('@')[0]}",style: TextStyle(fontSize: 25,color: Colors.black),),
                  Text("${user.email}",style: TextStyle(color: Colors.purple),)
                ],

              ),decoration: BoxDecoration(
                color: Color(0xFF4EAE9E),
                shape: BoxShape.rectangle,
              ),),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile" ),
                onTap:(){ Navigator.push(context, MaterialPageRoute(
  builder: (context) =>
  Profile(user: user,)));
},
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Chat"),
                onTap: () {Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          MyApp()));
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help" ),
                onTap: (){Navigator.push(context, MaterialPageRoute(
  builder: (context) =>
  Help()));
},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Icon(Icons.arrow_left),
                title: Text("$title1" ),
                onTap: (){Navigator.push(context, MaterialPageRoute(
  builder: (context) =>
  Home(user: user,)));

},
              ),
//          ListTile(
//            leading: Icon(Icons.help),
//            title: Text("Help" ),
//            onTap: null,
//          ),
            ],

          )



  );

}

//class Help extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text("Help Center"),),
//    );
//  }
//}
class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  Widget _text=Text("How do ChatBot works?",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),);
  Widget _text1=Text("Use of the app?",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),);
  Widget _text2=Text("Login is not compulsory!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help Center"),
        leading: IconButton(icon: Icon(Icons.cancel),onPressed: (){Navigator.pop(context);}),
        centerTitle: true,

      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(child: Card(child: _text,),
                  color: Colors.white,
                  onPressed:()=> setState(() {
                    _text=Text("ChatBot generates reply on the basis of intents means human intentions . It learns on the basis of intents and entities generated by user's text and hence generate relevant responses.!");
                  })),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(child: Card(child: _text1,),
                  color: Colors.white,
                  onPressed:()=> setState(() {
                    _text1=Text("One can search about any disease and the app will provide its symptoms, home remedies medication and its general overview, The app also did contains a chatbot which we can talk to for booking an appointment to the nearby or wished doctor! ");
                  })),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(child: Card(child: _text2,),
                  color: Colors.white,
                  onPressed:()=> setState(() {
                    _text2=Text("Login is not required to access this application.Only if you wish to store the Chats with the bot or want to book appointment through you need to login first ");
                  })),
            ),
            RaisedButton(child: Text("Send Feedback",style: TextStyle(color: Colors.white),),color: Color(0xFF00796B),onPressed: ()=>{},)
          ],
        ),
      ),
    );
  }
}


class Profile extends StatelessWidget {
  final FirebaseUser user;

  const Profile({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[ Container(child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.blue,
                  height: 90,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(image: NetworkImage('https://image.shutterstock.com/z/stock-photo-mountains-during-sunset-beautiful-natural-landscape-in-the-summer-time-407021107.jpg'),fit: BoxFit.fill)
                  ),

                ),
              ),
              Text("${user.email.split('@')[0]}",style: TextStyle(fontSize: 25,color: Colors.black),),
              Text("${user.email}",style: TextStyle(color: Colors.purple),)


            ]


        ),
          color: Color(0xFF87E6D5),
          width: 400,
          height: 180,
        ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 35,
              width: 300,
              child: Text("Name:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            ),
          ),
          Divider(),
          Container(
            height: 35,
            width: 300,
            child:  Text("Age: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

          ),
          Divider(),
          Container(
            height: 35,
            width: 300,
            child:  Text("Date of Birth: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          )
          ,
          Divider(),
        ],
      ));
  }
}
