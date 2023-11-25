import 'package:flutter/material.dart';
 

//import 'package:flutter_application_1/new_app/golootloActualApp.dart';
 
import 'package:flutter_application_golootlo_clone/project/provider/provider.dart';
import 'package:flutter_application_golootlo_clone/project/widgets/PageSecondParts.dart';
 import 'package:flutter_application_golootlo_clone/project/widgets/dummyCart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_golootlo_clone/project/widgets/main.dart';
class pageOne extends StatelessWidget {
  final String topImage;
  final String title;
  final double distance;
  final double rating;
  final List loadData;
  final List loadDataSecond;
  final List loadDataThird;

  const pageOne(
      {super.key,
      required this.topImage,
      required this.title,
      required this.loadData,
      required this.loadDataSecond,
      required this.loadDataThird,
      required this.rating,
      required this.distance});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: MyHomePage(
        topImage: topImage,
        title: title,
        rating: rating,
        loadData: loadData,
        loadDataSecond: loadDataSecond,
        loadDataThird: loadDataThird,
        distance: distance,
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  final String topImage;
  final double distance;
  final double rating;
  final String title;
  final List loadData;
  final List loadDataSecond;
  final List loadDataThird;
  const MyHomePage(
      {super.key,
      required this.topImage,
      required this.title,
      required this.rating,
      required this.loadData,
      required this.loadDataSecond,
      required this.loadDataThird,
      required this.distance});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final List<Widget> tabs = [
    const Tab(
      child: Text(
        'What a deals yumm!',
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Tab(
      child: Text(
        '2nd most delicious deals wow',
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Tab(
      child: Text(
        'Delicious deal of the month',
        style: TextStyle(color: Colors.black),
      ),
    ),
    // Add more tabs as needed
  ];

  ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= 100) {
          _appBarOpacity = 1.0 - (_scrollController.offset / 100);
        } else {
          // Apply a delay before making the leading widget fully transparent
          Future.delayed(const Duration(seconds: 20), () {
            setState(() {
              _appBarOpacity = 0.0;
            });
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build( BuildContext context) {
     final count = ref.watch(objectListProvider).length;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        bottomSheet: (count > 0)
              ? Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 60,
                  color: Colors.white,
                  child: Center(
                      child: Center(
                          child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 30,
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 124, 189, 241),
                              Color.fromARGB(255, 72, 113, 146),
                            ])),
                        alignment: const Alignment(200, 100),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                //'RS. ${count * quantity}',
                                'items selected. ${count}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                                    return CartScreen();
                                  }));
                                },
                                child: const Text(
                                  'review the content',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))))
              : null,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              //automaticallyImplyLeading: true,
              //elevation: 0,
              elevation: 2,
              expandedHeight: 500.0,
              backgroundColor: Colors.transparent,
              floating: false,
              clipBehavior: Clip.hardEdge,
              pinned: false,
              snap: false,
              leading:  IconButton(
                    onPressed:  () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) { 
                          return MyApp();
                        }
                        ));
                    },
                    icon: const Icon(Icons.arrow_back)),
              flexibleSpace: FlexibleSpaceBar(
                title: Stack(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(seconds: 6),
                      opacity: _appBarOpacity,
                      child: const Text(''),
                    ),
                    Positioned.fill(
                      child: Container(
                        width: 25,
                        child: Center(
                          child: Opacity(
                            opacity: 1.0 - _appBarOpacity,
                            child: const Text(
                              'idk',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle
                ],
                background: Rectangle2(
                  photo: widget.topImage,
                  title: widget.title,
                  rating: widget.rating,
                  distance: widget.distance,
                  loadData: widget.loadData,
                  loadDataSecond: widget.loadDataSecond,
                  loadDataThird: widget.loadDataThird,
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  tabs: tabs,
                  isScrollable: true,  // Important for horizontal scrolling
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  MyStatelessWidgetSubMenu(
                    restaurantMenuList: widget.loadData,
                  ),
                  MyStatelessWidgetSubMenu(
                    restaurantMenuList: widget.loadDataSecond,
                  ),
                  MyStatelessWidgetSubMenu(
                    restaurantMenuList: widget.loadDataThird,
                  ),

                  // const Center(child: Text('Content for Tab 2')),
                  // const Center(child: Text('Content for Tab 3')),
                ],
              ),
            ),
        
        ],
          
       
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
