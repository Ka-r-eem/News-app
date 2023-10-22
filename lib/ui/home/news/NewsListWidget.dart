import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../api/ApiManager.dart';
import '../../../model/SourcesResponse/Source.dart';
import '../../../providers/SearchProvider.dart';
import 'NewsWidget.dart';


class NewsListWidget extends StatelessWidget {

  Source source;
  NewsListWidget(this.source, {super.key});


  @override
  Widget build(BuildContext context) {

    var searchProvider = Provider.of<SearchProvider>(context);

    return FutureBuilder(
      future: ApiManager.getNews( searchProvider.search , source.id ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles;

        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsWidget(newsList![index]);
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }
}
