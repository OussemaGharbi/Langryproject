import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('categories');
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzz${value.docs}");

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _productCollectionRef.get();
    print("fffffffffffffffffffff${value.docs}");
    return value.docs;
  }
}