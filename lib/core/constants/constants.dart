class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';
  static String currentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city&appid=$apiKey';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
  static String haha(String cityname) =>
      'https://745431b4-b0c4-4cee-9532-dd5fc3d09ae7.mock.pstmn.io/$cityname';
}
