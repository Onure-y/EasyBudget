import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_budget/main.dart';

// FireStore yi ekliyorum
final _fireStore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

User? user = FirebaseAuth.instance.currentUser;

CollectionReference movementsRef = _fireStore.collection('Movements');

int balance = 0;
int itemCount = 0;

StreamBuilder streamBuilderWidget() {
  return StreamBuilder<QuerySnapshot>(
      stream: movementsRef.orderBy('time', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          return Center(child: Text('There has been error!!!!'));
        } else {
          if (asyncSnapshot.hasData) {
            List<DocumentSnapshot> listOfDocSnapshots = asyncSnapshot.data.docs;

            if (listOfDocSnapshots.length < 3) {
              itemCount = listOfDocSnapshots.length;
            } else {
              itemCount = 3;
            }

            return Flexible(
              child: ListView.builder(
                itemCount: itemCount,
                primary: false,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          '${listOfDocSnapshots[index].get('name')} ',
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: Text(
                          '${listOfDocSnapshots[index].get('value')} \$',
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      });
}

StreamBuilder totalBalance() {
  return StreamBuilder<QuerySnapshot>(
      stream: movementsRef.orderBy('time', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          return Center(child: Text('There has been error!!!!'));
        } else {
          if (asyncSnapshot.hasData) {
            List<DocumentSnapshot> listOfDocSnapshots = asyncSnapshot.data.docs;
            int temp = 0;
            for (int i = 0; i < listOfDocSnapshots.length; i++) {
              temp += listOfDocSnapshots[i].get('value') as int;
            }
            balance = temp;

            return Text(
              '$balance \$',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      });
}

void newMovement(String movType, movValue, BuildContext context, spend) async {
  var now = DateTime.now();
  Map<String, dynamic> newMov = {
    'name': movType,
    'value': spend ? -int.parse(movValue) : int.parse(movValue),
    'time': now
  };
  print(newMov);
  print(-int.parse(movValue));

  await movementsRef.doc(movType).set(newMov);

  Navigator.pop(context);
}

void signUp(email, password, context) async {
  await auth.createUserWithEmailAndPassword(email: email, password: password);

  Navigator.pushReplacementNamed(context, '/login');
}

void signIn(email, password, context) async {
  await auth.signInWithEmailAndPassword(email: email, password: password);

  user = FirebaseAuth.instance.currentUser;
  movementsRef = _fireStore.collection('users/${user!.uid}/movements');
  // print(user!.uid);

  Navigator.pushReplacementNamed(context, '/');
}

void checkUser() {
  auth.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signet out!');
    } else {
      print('User is signed in!');
    }
  });
}

StreamBuilder allMovements() {
  return StreamBuilder<QuerySnapshot>(
      stream: movementsRef.orderBy('time', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          return Center(child: Text('There has been error!!!!'));
        } else {
          if (asyncSnapshot.hasData) {
            List<DocumentSnapshot> listOfDocSnapshots = asyncSnapshot.data.docs;

            return Flexible(
              child: ListView.builder(
                itemCount: listOfDocSnapshots.length,
                primary: false,
                itemBuilder: (context, index) {
                  return Card(
                    
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          '${listOfDocSnapshots[index].get('name')} ',
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: Text(
                          '${listOfDocSnapshots[index].get('value')} \$',
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      });
}
