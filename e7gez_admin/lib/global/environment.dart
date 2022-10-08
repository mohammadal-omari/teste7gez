import 'package:e7gez_admin/constants.dart';

class Environment {
  static String apiUrl = isDevlopment
      ? 'https://rebel-jade-creator.glitch.me/api'
      : 'http://10.0.2.2:3000/api';

  static String socketUrl = isDevlopment
      ? 'http://localhost:3000/api'
      : 'http://10.0.2.2:3000/api';
}