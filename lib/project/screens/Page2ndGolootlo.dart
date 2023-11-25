//import 'dart:convert';

//import 'package:flutter/foundation.dart';
//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
 
 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_golootlo_clone/project/widgets/tabbarNOappbar.dart';
import 'package:flutter_application_golootlo_clone/project/model/golootloModel.dart';
import 'package:flutter_application_golootlo_clone/project/provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:uuid/uuid.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  const newPage();
  }
}
 

// below class is the widget
class newPage extends ConsumerWidget {
  const newPage({super.key});

  @override
  Widget build(constext, WidgetRef ref) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal),
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
            ),
            child: ListView.builder(
                // physics:const  PageScrollPhysics(parent: null),

                shrinkWrap: true,
                itemCount: ref.read(modelProvider).length,
                itemBuilder: (context, index) {
                  return RestaurantCard(cardMenu: restaurantList[index]);
                }),
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final restaurantMenu cardMenu;

  RestaurantCard({super.key, required this.cardMenu});

  void _letsSee(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => pageOne(
              topImage: cardMenu.getImage,
              title: cardMenu.getName,
              loadData: cardMenu.getLoadData,
              loadDataSecond: cardMenu.getLoadDataSecond,
              loadDataThird: cardMenu.getLoadDataThird,
              distance: cardMenu.distance,
              rating: cardMenu.getRating,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _letsSee(context);
      },
      splashColor: const Color.fromARGB(255, 175, 175, 175),
      child: Card(
        elevation: 1.7,
        clipBehavior: Clip.none,
        color: const Color.fromRGBO(255, 255, 255, 0.884),
        margin: const EdgeInsets.only(bottom: 4),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 550 / 2,
          height: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: 119,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(cardMenu.getImage),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 9,
                          left: 14,
                          child: Container(
                            padding: const EdgeInsets.all(3.39),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  cardMenu.getDelivery.toString(),
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "mins",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.delivery_dining,
                                  color: Colors.blue,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 119,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(9, 4, 0, 0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'UP TO...\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${cardMenu.percent}%\n',
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 40, 97, 167)
                                              .withOpacity(0.7),
                                      fontSize: 24,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'off',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2.3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    cardMenu.getName,
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.delivery_dining,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Rs, ${cardMenu.getPrice} ',
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: const Color.fromARGB(127, 97, 83, 83),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 9,
                      ),
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 241, 218, 9),
                        size: 17,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        cardMenu.getRating.toStringAsFixed(1),
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: const Color.fromARGB(127, 97, 83, 83),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 9,
                      ),
                      const Icon(
                        Icons.navigation,
                        color: Colors.blue,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${cardMenu.getDistance.toStringAsFixed(2)} km',
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: const Color.fromARGB(127, 97, 83, 83),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Food & Beverages',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color.fromARGB(193, 131, 125, 125)),
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 5, 15, 5),
                    child: const Text(
                      'Delivery',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 13),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// it contains the bottom sheet
class SecondScreen extends ConsumerStatefulWidget {
  final String decidedImageList;
  final String description;
  final String subDescription;
  final double price;
  final String title;
  const SecondScreen(
      {super.key,
      required this.decidedImageList,
      required this.price,
      required this.title,
      required this.description,
      required this.subDescription});

  @override
  ConsumerState<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ConsumerState<SecondScreen> {
  int counterNew = 0;   // it counts the number of items incremented or decremented
  int selectedButtonIndex = 0;
   var uuid = const Uuid();   // it generate different id for item of CartItemClass
  @override
  Widget build(BuildContext context) {
     

    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 247, 248),
      ),
      home: Scaffold(
          bottomSheet: (counterNew > 0)
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
                                'RS. ${counterNew * widget.price}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () async {
                           // below code works on the real time database (posts data )
                                  /* final url = Uri.https(
                                      "pakis-8f258-default-rtdb.firebaseio.com",
                                      'shopping-list.json');
                                    final response = await http.post(
                                    url,
                                    headers: {
                                      'Content-Type': 'application/json',
                                    },
                                    body: json.encode({
                                      'title': widget.title,
                                      'no of products': counterNew,
                                      'Description': widget.description,
                                      'price': widget.price,
                                    }),
                                  );
                                      final Map<String, dynamic> restData = json.decode(response.body); 
                                */
                              // the item is the object of CartItemClass that adds into the statemanagement 
 
                                 

                                  var item = CartItemClass(id: uuid.v4(), title: widget.title, price: widget.price, description: widget.description, noProduct: counterNew);
                                  ref.watch(objectListProvider.notifier).addItem(item);
                                   
                                  Future.delayed(const Duration(seconds: 1));

                                   

                    /*  print(response.body);
                    print(response.statusCode); */

                    if(!context.mounted) {
                       
                      return;
                    }
                    //Navigator.of(context).pop;
                    //Navigator.of(context).pop(CartItemClass(id : restData['name'], noProduct: counterNew,  title: widget.title, price: widget.price, description: widget.description));
                    Navigator.of(context).pop(CartItemClass(id : uuid.v4(), noProduct: counterNew,  title: widget.title, price: widget.price, description: widget.description));
                   
                                },
                                child: const Text(
                                  'Add to Chart',
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
          appBar: AppBar(

            backgroundColor: Colors.transparent.withOpacity(0),
            title: const Text('secondScreen', style: TextStyle(color: Colors.black),),
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),

          body: SafeArea(

              child: SingleChildScrollView(
            child: Column(
              children: [
                thirdPage(
                    counterNew: counterNew,
                    screenWidth: screenWidth,
                    selectedImage: widget.decidedImageList),
                 
                SizedBox(
                  height: 400,
                  width: 1200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    //mainAxisSize: MainAxisSize.min,

                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        width: 350,
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                            color: Color(0xFF0F0303),
                            fontSize: 16,
                            fontFamily: 'Hind',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13.70,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),

                        // left: 18,

                        // top: 28,

                        child: Text(
                          widget.subDescription,
                          style: const TextStyle(
                            color: Color(0xFF9E9A9A),
                            fontSize: 12,
                            fontFamily: 'JejuGothic',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //increment_decrement(counterNew: widget.counterNew), // this code can replace the below code
                      Container(
                        width: 456,
                        margin: const EdgeInsets.only(left: 55),
                        padding: const EdgeInsets.only(bottom: 13),
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            border: Border(
                                top: BorderSide.none,
                                bottom: BorderSide(
                                    width: .2, color: Colors.black54))),
                        child: Row(
                          children: [
                            Text(
                              'RS. ${widget.price * counterNew}',
                              style: const TextStyle(
                                color: Color(0xFF5A87FA),
                                fontSize: 15,
                                fontFamily: 'Hind Guntur',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                       
                                      setState(() {
                                         
                                        counterNew--;
                                         
                                      });
                                    },
                                    child: const Text('-')),
                                Text(counterNew.toString()),
                                TextButton(
                                    onPressed: () {
                                       
                                      setState(() {
                                         
                                        counterNew++;
                                         
                                      });
                                    },
                                    child: const Text('+')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                   
              ])
                ),
               
              ],
            ),
          ),),
          ),
    );
  }
}
class CircularButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;

  const CircularButton({
    required this.text,
    required this.isSelected,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
 class thirdPage extends StatefulWidget {
  final double screenWidth;
  final String selectedImage;
  final int counterNew;

  const thirdPage(
      {required this.counterNew,
      required this.screenWidth,
      required this.selectedImage,
      Key? key})
      : super(key: key);

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          width: double.infinity,
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(widget.selectedImage),
          height: 320,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: widget.screenWidth,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Color.fromRGBO(249, 249, 249, 1),
            ),
          ),
        ),
      ],
    );
  }
}
 