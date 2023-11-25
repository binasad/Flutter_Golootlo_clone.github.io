//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_application_1/iverpod.dart';
import 'package:flutter_application_golootlo_clone/project/model/golootloModel.dart';
  
import 'package:flutter_application_golootlo_clone/project/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:http/http.dart' as http;

class CartScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  List<CartItemClass> hoopP = [];
  var isLoading = false ; // true when data is fetched from databases
  String? _error;
  @override
  void initState() {
   // _dummyData();
    //print( hoopP.length);

  }
  // below code get data from real time data bases

        /*  void _dummyData() async {
    final url = Uri.https(
        "pakis-8f258-default-rtdb.firebaseio.com", 'shopping-list.json');
    final responseTwo = await http.get(url);
    if (responseTwo.statusCode >= 400) {
      setState(() {
        _error = 'failed to fetch data';
      });
    }
    if (responseTwo.body == 'null') {
      setState(() {
        isLoading = false;
      });
      return;
    }
    final Map<String, dynamic> listData = json.decode(responseTwo.body);
     
    List<CartItemClass> hoop = [];
    listData.forEach((key, value) {
      hoop.add(CartItemClass(
        id: key,
        title: value['title'],
        noProduct: value['no of products'],
        price: value['price'],
        description: value['Description'],
      ));
    });

    setState(() {
      hoopP = hoop;
      isLoading = false;
    });
    print(hoop[0].id.toString());
  }
 */
  
  @override
   
   Widget build(BuildContext context,  ) {
    hoopP = ref.watch(objectListProvider);
 
     
    Widget content = const Center(
       
      child: Text('no items added yet'),
    );
     
    if (isLoading) {
      content = const Center(

        child: CircularProgressIndicator(),
      );
    }
    if (_error != null) {

      content = Center(child: Text(_error!));

    }

    return Scaffold(
       
      appBar: AppBar(

        title: const Text('Cart'),

        leading: IconButton(

          icon: const Icon(Icons.arrow_back),

          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: isLoading
          ? content
          : ListView.builder(

              itemCount: hoopP.length,
              itemBuilder: (BuildContext context, int index) {
                final product = hoopP[index];
                return Dismissible(
                  background: 
                  Container(

              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child:   const Center(child: Icon(Icons.delete)),
            ),
                  /*   confirmDismiss: (direction) {
                //     showDialog(context: context, builder: (_)=>AlertDialog(title: Text('are u sure'),));
              }  */
                  key: Key(product.title),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) async {
           // Remove the item from the datasource when dismissed

                           /* final url = Uri.https(
                                "pakis-8f258-default-rtdb.firebaseio.com",
                'shopping-list/${hoopP[index].id}.json');
                    */

                    hoopP.removeAt(index);

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.title} dismissed')));

     // it is deleted from databases
             /*          final response = await http.delete(url);

                    if (response.statusCode >= 400) {
                      hoopP.insert(index, product);
                    }
                    */
                  },
                   
                  child:
                   
                  Container(
                    margin: const EdgeInsets.all(13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          
                        const Icon(Icons.local_grocery_store),

                        const SizedBox(width: 5,),

                         Text('${product.title}'),

                         const Spacer(),
                             
                         Text('\$${(product.price * product.noProduct).toStringAsFixed(2)}')
                          ,const  Spacer()
                        ,Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            ref.read(objectListProvider.notifier).decreaseItem(product.id);
                          },  

                          icon: const Text('-')
                          ),

                          const SizedBox(width: 2,),

                          Text('${product.noProduct}'),

                          const SizedBox(width: 2,),

                          IconButton(onPressed:  () {
                            ref.read(objectListProvider.notifier).increaseItem(product.id);
                          }, 
                          icon:  const Text('+'))
                  
                        ],
                      ),
                      ],
                    ),
                  ) 
                  
                   
                  
                );
              },
            ),
    );
  }
}
