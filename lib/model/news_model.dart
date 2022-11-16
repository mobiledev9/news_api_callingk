// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

// News newsFromJson(String str) => News.fromJson(json.decode(str));

// String newsToJson(News data) => json.encode(data.toJson());

// class News {
//   News({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });

//   String status;
//   int totalResults;
//   List<Article> articles;

//   factory News.fromJson(Map<String, dynamic> json) => News(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(
//             json["articles"].map((x) => Article.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//       };
// }

class Article {
  Article({
    // required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  // Source source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  factory Article.fromMap( element) => Article(
        // source: Source.fromJson(json["source"]),
        author: element["author"],
        title: element["title"],
        description: element["description"],
        url: element["url"],
        urlToImage: element["urlToImage"],
        publishedAt: element["publishedAt"],
        content: element["content"],
      );

  // Map<String, dynamic> toJson() => {
  //       // "source": source.toJson(),
  //       // "author": author == null ? null : author,
  //       "title": title,
  //       // "description": description == null ? null : description,
  //       // "url": url,
  //       // "urlToImage": urlToImage == null ? null : urlToImage,
  //       // "publishedAt": publishedAt.toIso8601String(),
  // "content": content,
  //     };
}

// class Source {
//   Source({
//     required this.id,
//     required this.name,
//   });

//   String id;
//   String name;

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name,
//       };
// }
