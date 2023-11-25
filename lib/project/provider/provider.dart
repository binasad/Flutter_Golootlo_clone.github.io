 
import 'package:flutter_application_golootlo_clone/project/model/golootloModel.dart';
import 'package:riverpod/riverpod.dart';

 
final modelProvider = Provider((ref) => restaurantList);

final objectListProvider =
    StateNotifierProvider<CartNotifier, List<CartItemClass>>((ref) {
  return CartNotifier();
});  

class CartNotifier extends StateNotifier<List<CartItemClass>> {
  CartNotifier() : super([]);

  void addItem(CartItemClass item) {

    state = [...state, item];

  }

  void increaseItem(String id) {
    state = [
      for (var item in state)

        if (item.id == id)
          CartItemClass(
              id: item.id,
              title: item.title,
              price: item.price,
              description: item.description,
              noProduct: item.noProduct + 1)

        else
          item

    ];
  }

  void decreaseItem(String id) {

    state = [

      for (var item in state)

        if (item.id == id && item.noProduct > 0)
          CartItemClass(
              id: item.id,
              title: item.title,
              price: item.price,
              description: item.description,
              noProduct: item.noProduct - 1)
              
        else
          item
    ];
  }
}
