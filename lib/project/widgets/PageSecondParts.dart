import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// page 2 parts

class Rectangle2 extends StatelessWidget {
  final String photo;
  final String title;
  final double rating;
  final double distance;
  final List loadData;
  final List loadDataSecond;
  final List loadDataThird;
  const Rectangle2({
    super.key,
    required this.distance,
    required this.rating,
    required this.loadData,
    required this.loadDataSecond,
    required this.loadDataThird,
    this.photo =
        "https://images.unsplash.com/photo-1633424234673-c8cd0f4df77b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJ1cmdlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return    Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: 350,
               
              child: FadeInImage(
                 
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(photo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 400 - 150,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavButton(
                    icon: Icons.money_off_csred_sharp,
                  ), // Y
                  //our column content goes here
    
                  NavButton(
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    data: "Delivery",
                    icon: Icons.delivery_dining,
                  ), // Your column content goes here
    
                  NavButton(
                    data: 'info',
                    icon: Icons.info_outline_rounded,
                  ), // Your column content goes here
                ],
              ),
            ),
          ),
          Positioned(
            top: 330,
            child: Container(
              width: width,
              padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
              height: 200,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF00000F),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                      Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                       const  SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$rating(10) . $distance km',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const SizedBox(
                      width: 87,
                      child: SizedBox(
                        width: 4,
                        child: Text(
                          'Food & Beverages',
                          style: TextStyle(
                            color: Color(0xD8A6A3A3),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      );
     
  }
}

class NavButton extends StatelessWidget {
  final String data;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  const NavButton(
      {super.key,
      this.backgroundColor = Colors.white,
      this.iconColor = Colors.blue,
      this.data = "Offers",
      this.icon = Icons.airplane_ticket_rounded});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('saad');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        width: 107,
        height: 33.78,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                //Icons.airplane_ticket_rounded,
                icon,
                color: iconColor),
            const Spacer(),
            Text(
              data,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
