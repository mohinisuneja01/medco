import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medico/ui/Home.dart';

class profileCreation extends StatelessWidget {
  final FirebaseUser user;
  final _formKey=GlobalKey<FormState>();
  String name;
  String age;
  String dob;
  void onSavedName(String value){name=value;}
  void onSavedAge(String value){age=value;}
  void onSavedDOB(String value){dob=value;}
  profileCreation({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor:Color(0xFF00796B) ,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: ListView(
            children: <Widget>[
              CustomTextField(labelText: 'Email',readOnly: true,enabled:false,initialValue: user.email),
              CustomTextField(labelText: 'Full Name',textCapitalization: TextCapitalization.words,inputType: TextInputType.text,onSaved: onSavedName),
              CustomTextField(labelText: 'Age',inputType: TextInputType.number,onSaved: onSavedAge),
              CustomTextField(labelText: 'Date of Birth',inputType: TextInputType.datetime,onSaved: onSavedDOB),
              SizedBox(height: 20,),
              RaisedButton(child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.white),),color:Color(0xFF00796B) ,textColor: Colors.white,
              onPressed: (){
                if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                Firestore.instance.collection('UserData').add({'email':user.email,'name':name,'age':age,'dob':dob});
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home(user: user,)));
                }
              },)
            ],
          ),
        ),
      ),
    );

  }
}


Widget CustomTextField({@required String labelText, TextCapitalization textCapitalization=TextCapitalization.none,TextEditingController textEditingController,TextInputType inputType=TextInputType.text,bool enabled=true,bool readOnly=false,String initialValue=null,onSaved}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      onSaved: onSaved,
      readOnly: readOnly,
      enabled: enabled,
      controller: textEditingController,
      keyboardType: inputType,
      textCapitalization:textCapitalization,
      initialValue: initialValue,
      validator: (String value){
        if(value.isEmpty)
          return 'Please enter some text';
        else
          return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        focusColor: Color(0xFF00796B),

      ),
    ),
  );
}