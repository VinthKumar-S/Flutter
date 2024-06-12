
import 'package:cloud_firestore/cloud_firestore.dart';

create(String colName,docName,name,animal,int age) async{
  await FirebaseFirestore.instance
  .collection(colName)
  .doc(docName)
  .set({
    'name':name,
    'animal':animal,
    'age':age, 
  });

print("Data Uploaded");
}

update(String colName,docName,field,var newField)
async{
  await FirebaseFirestore.instance
  .collection(colName)
  .doc(docName)
  .update({field:newField});
  print("Data Updated");
}

delete(String callName,docName)async{
  await FirebaseFirestore.instance
  .collection(callName)
  .doc(docName).delete();
  print('Deleted');
}