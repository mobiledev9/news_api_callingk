import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_api_calling/model/news_model.dart';
import 'package:news_api_calling/sorch/api_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_api_calling/veb_view.dart';
import 'package:http/http.dart' as http;
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Apiservice client = Apiservice();
  List<Article?> newsApiData = [];
  // void updatelist(String value) {
  //   activate();
  // }
  getData() async {
    var url =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-10-16&sortBy=publishedAt&apiKey=c9265fad09d2431fa094418ad664301f";
    // res = http.get(Url);
    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print(data);
    var hindi = data['articles'];
    for (var element in hindi) {
      Article find = Article();
      find = Article.fromMap(element);
      newsApiData.add(find);
      // print(newsApiData);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const _CustomAppbar(),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Find Newa.....',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: searchnews,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 350, autoPlay: true),
                    items: newsApiData.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsScreen(
                                    i.urlToImage.toString(),
                                    i.author!,
                                    i.publishedAt!,
                                    i.description!,
                                    i.title!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(i!.urlToImage.toString()),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsApiData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.04, right: width * 0.04),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VebViewSCreen(
                                              newsApiData[index]!
                                                  .url
                                                  .toString())));
                                },
                                child: Card(
                                  // color: Colors.red,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * 0.13,
                                        width: width * 0.23,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  newsApiData[index]!
                                                      .urlToImage
                                                      .toString()),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              newsApiData[index]!
                                                  .publishedAt
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              newsApiData[index]!
                                                  .author
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void searchnews(String query) {
    final suggestion = newsApiData.where((element) {
      final bookTitle = element!.publishedAt?.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle!.contains(input);
    }).toList();
    setState(() {
      newsApiData = suggestion;
    });
  }
}

class _CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: width * 0.02),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 35,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.02),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
