import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/ContentScreen.dart';

import '../../../model/NewsResponse/news.dart';

class NewsWidget extends StatelessWidget {
 News news;
 NewsWidget(this.news,{super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ContentScreen.routeName,
        arguments: news);
        print(news.content);

      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child:CachedNetworkImage(
                imageUrl: news.urlToImage??"",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.do_not_disturb),
              ),
            ),
            Text(news.author ??"",
            textAlign: TextAlign.start,),
            Text(news.title??"",
              textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400
            ),),
            Text(news.publishedAt??"",
              textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}