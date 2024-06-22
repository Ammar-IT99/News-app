import 'package:flutter/material.dart';
import 'package:news_app/Category/tab_item.dart';
import 'package:news_app/news/news_widget.dart';

import '../model/sourceResponse.dart';

//ignore: must_be_immutable
class TabsWidget extends StatefulWidget {
  List<Source> sourecesList;

  TabsWidget({super.key, required this.sourecesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourecesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourecesList
                  .map((source) => TabItem(
                      source: source,
                      isSelected: selectedindex == widget.sourecesList.indexOf(source)))
                  .toList()),
          Expanded(child: NewsWidget(source: widget.sourecesList[selectedindex]))
        ],
      ),
    );
  }
}
