import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
 
 
import 'package:flutter_application_golootlo_clone/project/model/golootloModel.dart';
 
 
import 'package:flutter_application_golootlo_clone/project/screens/Page2ndGolootlo.dart';
 
import 'package:flutter_application_golootlo_clone/project/widgets/dummyCart.dart';
 

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final itemsNav = const [
    Icon(Icons.home_rounded, size: 30),
    Icon(Icons.delivery_dining, size: 30),
    Icon(Icons.search_rounded, size: 30),
    Icon(Icons.person, size: 30),
  ];

  int indexNav = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:  ThemeData.light().copyWith(
      //     scaffoldBackgroundColor: const Color.fromARGB(255, 246, 247, 248),
      //   ),
      home: ClipRRect(
        child: SafeArea(
          top: false,
          child: Scaffold(
             
              extendBody: true,
              backgroundColor: const Color.fromARGB(255, 111, 150, 182),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 19.9,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                child: CurvedNavigationBar(
                  color: Colors.white70,
                  //
                  items: itemsNav,
                  index: indexNav,
                  onTap: (selectedIndex) {
                    setState(() {
                      indexNav = selectedIndex;
                    });
                  },
                  height: 45,
                  buttonBackgroundColor: Colors.yellow,
                  backgroundColor: Colors.transparent,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              body: getSelectedWidget(
                  // it will decide to the bottom bar
                  index: indexNav)),
        ),
      ),
    );
  }
}

// options for bottom bar
Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = CarouselWithRow();
      break;
    case 1:
      widget = CartScreen();
      break;
    default:
      widget = CarouselWithRow();
      break;
  }
  return widget;
}

// below is the carousel
class CarouselWithRow extends StatefulWidget {
  @override
  _CarouselWithRowState createState() => _CarouselWithRowState();
}

class _CarouselWithRowState extends State<CarouselWithRow> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> sampleStrings = ["first", "second", "third", "fourth"];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 150, 182),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 205, 243),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        title: const Text('user name'),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.location_on_outlined)),
        // below is the code for leading (start of the appbar)
        /* leading:  Builder(builder: (BuildContext context) {
                  return   Row(
                    children: [
                      IconButton(onPressed:  () {
              
                      }, icon: Icon(Icons.shop_two_rounded))
                    ],
                     
        
                  );
                }),*/
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Builder(
                      builder: (context) {
                        return CartScreen();
                      },
                    );
                  }),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined)),
          const SizedBox(
            width: 17,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          const SizedBox(
            width: 31,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: sampleStrings.map((item) {
                return theWidgets(_currentIndex);
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                pauseAutoPlayOnManualNavigate: true,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.7,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = (_currentIndex + 1) % sampleStrings.length;
                    //print(reason);
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),

            const SizedBox(height: 20),
            // the dotted indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(sampleStrings.length, (index) {
                return Container(
                  height: 10,
                  width: _currentIndex == index ? 15 : 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:
                        _currentIndex == index ? Colors.yellow : Colors.white,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const HomeScreen(),
          ],
        ),
      ),
    );
  }
}

// the images appears on the carousel

Widget theWidgets(int index) {
  return const Card(
      margin: EdgeInsets.all(16),
      child: Image(
        image: AssetImage(
          "assets/images/golootlo.png",
        ),
        fit: BoxFit.cover,
      ));
}

// this cnot be
class MyStatelessWidgetSubMenu extends StatelessWidget {
  final List restaurantMenuList;
  const MyStatelessWidgetSubMenu({super.key, required this.restaurantMenuList});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 690,
      ),
      child: ListView.builder(
        itemCount: restaurantMenuList.length,
        itemBuilder: (context, index) {
          return theBox(
            ood: restaurantMenuList[index],
          );
        },
      ),
    );
  }
}

// this is the one taking the image to the second screen
class theBox extends StatelessWidget {
  FoodData ood;
   

  theBox({super.key, required this.ood});

  void _letsSee(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => SecondScreen(
              decidedImageList: ood.getImage,
              description: ood.description,
              price: ood.getPrice,
              title: ood.getTitle,
              subDescription: ood.subDescription,
            )));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double productWidth = screenWidth / 2 + 169;

    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        _letsSee(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: productWidth,
        height: 116,
        decoration: const BoxDecoration(
           
          color:   Color(0xFFFBFBFB),
          boxShadow:   [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(5, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ood.getTitle,
                    style: const TextStyle(
                      color: Color(0xFF131010),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const TextSpan(
                    text: 'bowl\n\n',
                    style: TextStyle(
                      color: Color(0xFF130E0E),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: '\$ ${ood.getPrice}',
                    style: const TextStyle(
                      color: Color(0xFF867B7B),
                      fontSize: 10,
                      fontFamily: 'Inder',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: productWidth / 3,
              height: productWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ood.getImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// THIS BELOW IS THE LOST ONE

Widget textarea = Positioned(
  left: 44,
  //height: 20,

  top: 188,

  child: Container(
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Customize the shadow color
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(5, 4), // Controls the position of the shadow
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          //print("saad");
        },
        //print(" saad bin asad");
        // Add your onPressed logic here

        style: TextButton.styleFrom(
          shadowColor: Colors.blueAccent,
          iconColor: Colors.green,
          backgroundColor: const Color(0xFFFBFBFB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55),
          ),
        ),
        child: Container(
          width: 90,
          height: 20,
          alignment: Alignment.center,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.search, color: Colors.black),
              SizedBox(width: 6), // Adjust spacing as needed
              Text(
                'Search',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Inder',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      )),
);
