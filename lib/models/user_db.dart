import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDb{
var auth = FirebaseAuth.instance ;
var db = FirebaseFirestore.instance.collection("users");

AddNewUser(String phone) async {
  String id = auth.currentUser!.uid;
  var currentUserInfo = await db.doc(id).get();
  if(!currentUserInfo.exists){
    await db.doc(id).set({
    id : id,
    phone : phone
  });

  }

}
UpdateProfile(geolocalisation){
  var id= auth.currentUser!.uid;
  db.doc(id).update({
    geolocalisation: geolocalisation
  });
}


}