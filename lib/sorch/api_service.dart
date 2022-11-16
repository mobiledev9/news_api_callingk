// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:news_api_calling/model/news_model.dart';

// class Apiservice {
//   final endPointUrl =
//       "https://newsapi.org/v2/everything?q=tesla&from=2022-10-16&sortBy=publishedAt&apiKey=c9265fad09d2431fa094418ad664301f";
//   Future<List<Article>> getArticle() async {
//     var response = await http.get(Uri.parse(endPointUrl));

//     if (response.statusCode == 200) {
//       Map<String, dynamic> Json = jsonDecode(response.body);

//       List<dynamic> body = Json['articles'];

//       List<Article> articles =
//           body.map((dynamic item) => Article.fromMap(item)).toList();

//       return articles;
//     } else
//       (throw ("can't get tha articles"));
//   }
// }
