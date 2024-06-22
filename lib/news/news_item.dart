import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Theme_Data.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsItem extends StatefulWidget {
News news;
NewsItem({super.key, required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior:Clip.antiAlias ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

            ),

            child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.news.author??'',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.greyColor
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.news.title??'',
              style: Theme.of(context).textTheme.titleMedium,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.news.publishedAt??'',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.greyColor
                ),
            textAlign:TextAlign.end ,
            ),

          ),
        ],
      ),
    ) ;
  }
}
