import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCartItemDbHelper {
  FireStoreCartItemDbHelper._();

  static final FireStoreCartItemDbHelper fireStoreCartItemDbHelper = FireStoreCartItemDbHelper._();

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> insert({required Map<String, dynamic> data}) async {
    DocumentSnapshot<Map<String, dynamic>> counter =
    await db.collection('counter').doc('cart_counter').get();
    int id = counter['id'];
    int length = counter['length'];

    await db.collection('cart').doc('${++id}').set(data);

    await db.collection('counter').doc('cart_counter').update({'id': id});

    await db
        .collection('counter')
        .doc('cart_counter')
        .update({'length': ++length});
  }

  Future<void> delete({required String id}) async {
    await db.collection('cart').doc(id).delete();

    DocumentSnapshot<Map<String, dynamic>> counter =
    await db.collection('counter').doc('cart_counter').get();
    int length = counter['length'];

    await db
        .collection('counter')
        .doc('cart_counter')
        .update({'length': --length});
  }

  Future<void> update(
      Map<String, dynamic> data,{required String id}) async {
    await db.collection('cart').doc(id).update(data);
  }
}
