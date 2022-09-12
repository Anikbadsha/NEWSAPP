import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/service/news_api_service.dart';
import 'package:newsapp/widgets/Colors.dart';
import 'package:newsapp/widgets/fontstyle.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Articles> newslist = [];

  @override
  void didChangeDependencies() async {
    newslist = await NewsApiService().FetchNewsData();
    setState(() {});
    super.didChangeDependencies();
  }

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          "News App",
          style: myStyle(24, deepred, FontWeight.w700, FontStyle.italic),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: black,
            )),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: Icon(
                Icons.search,
                color: black,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: white,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ALL NEWS",
                style: myStyle(16, black, FontWeight.w700, FontStyle.italic),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        currentIndex -= currentIndex;
                      },
                      child: Text("Prev"),
                      style: ElevatedButton.styleFrom(
                          textStyle:
                              myStyle(16, white, FontWeight.w500, null, 1)),
                    ),
                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex == index + 1;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    color: currentIndex == index + 1
                                        ? Colors.blue
                                        : Colors.white),
                                width: 40,
                                child: Text(
                                  "${index + 1}",
                                  style: myStyle(
                                    16,
                                    black,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        currentIndex += currentIndex;
                      },
                      child: Text("Next"),
                      style: ElevatedButton.styleFrom(
                          textStyle:
                              myStyle(16, white, FontWeight.w500, null, 1)),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: newslist.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text("${newslist[index].source!.name}"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
