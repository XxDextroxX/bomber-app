import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No se encontró la variable de entorno';

  static String apiUrlContable =
      dotenv.env['API_CONTABLE_URL'] ?? 'No se encontró la variable de entorno';

  static String keyMessage =
      dotenv.env['KEY_MESSAGE'] ?? 'No se encontró la variable de entorno';

  static initEnvirontment() async {
    await dotenv.load(fileName: ".env");
  }
}
