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
      body: Card(
        elevation: 20,
        surfaceTintColor: Theme.of(context).primaryColor,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold , fontFamily: "KOUFIBD"),
              ),
              Text(
                args.publishedAt ?? "",
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Card(
                  elevation: 12,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Text(
                        '''${args.content}${args.content}''' ?? "",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold , fontFamily: "KOUFIBD"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
