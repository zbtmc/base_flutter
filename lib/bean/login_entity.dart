import 'package:flutter_base_app/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	String token;
	String expire;
	String userId;
}
