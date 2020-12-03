

import 'package:flutter_base_app/common/local/local_storage.dart';
import 'package:flutter_base_app/common/local/local_storage_key.dart';
import 'package:uuid/uuid.dart';

class AppUtil{

  static Future<String> getUUid() async{
      String uuid = await LocalStorage.get(LocalStorageKey.USER_UUID);
      if(uuid==null){
        uuid = Uuid().v4();
        await LocalStorage.save(LocalStorageKey.USER_UUID, uuid);
        return uuid;
      }
      return uuid;
  }
}
