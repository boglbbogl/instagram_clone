import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/constants/firestore_keys.dart';
import 'package:instagram_clone/models/firestore/user_model.dart';

class UserNetworkRepository {
  Future<void> attemptCreateUser({String userKey, String email}) async{

    final DocumentReference userRef = Firestore.instance.collection(COLLECTION_USERS).document(userKey);

    DocumentSnapshot snapshot = await userRef.get();
    if(!snapshot.exists){
      return userRef.setData(UserModel.getMapForCreatUser(email));
    }
  }
}

UserNetworkRepository userNetworkRepository = UserNetworkRepository();
