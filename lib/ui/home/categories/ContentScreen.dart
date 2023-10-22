import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse/news.dart';

class ContentScreen extends StatelessWidget {
  static const String routeName = 'content';

  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.do_not_disturb),
              ),
            ),
            Text(
              args.author ?? "",
              textAlign: TextAlign.start,
            ),
            Text(
              args.title ?? "",
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              args.publishedAt ?? "",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''${args.content}''' ?? "",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
