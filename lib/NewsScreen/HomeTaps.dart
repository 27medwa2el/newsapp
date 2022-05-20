import 'package:flutter/material.dart';
import 'package:news/NewsScreen/NewsList.dart';
import 'package:news/NewsScreen/TabItem.dart';
import 'package:news/modules/sources.dart';

class HomeTaps extends StatefulWidget {
  List<Sources> sources;
  HomeTaps(this.sources);


  @override
  _HomeTapsState createState() => _HomeTapsState();
}

class _HomeTapsState extends State<HomeTaps> {
  int selectedIndex;
  @override


  Widget build(BuildContext context) {
    return

       Padding(
         padding: const EdgeInsets.all(20),
         child: DefaultTabController(initialIndex: 0,length: widget.sources.length,

            child: Column(
              children: [
                TabBar(
                  onTap: (index){
                    setState(() {
                      selectedIndex=index;
                    });

                  },

                  isScrollable: true,

                    indicatorColor: Colors.transparent,
                    tabs: widget.sources.map((source) => TabItem(source, widget.sources.indexOf(source)==selectedIndex)).toList()
                ),
                Expanded(
                  child: TabBarView(children:
                    widget.sources.map((source) => NewsList(source)).toList(),


                  ),
                )
              ],
            )

      ),
       );

  }
}
