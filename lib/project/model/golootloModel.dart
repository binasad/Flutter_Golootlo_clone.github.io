class FoodData {
  final String title;
  final String image;
  final double price;
  final String description;
  final String subDescription;

  FoodData(
      {required this.title,
      required this.image,
      required this.price,
      required this.description,
      required this.subDescription});
  double get getPrice {
    return price;
  }

  String get getImage {
    return image;
  }

  String get getDescription {
    return description;
  }

  String get getSubDescription {
    return subDescription;
  }

  String get getTitle {
    return title;
  }
}

class restaurantMenu {
  final String name;
  final String image;
  final double price;
  final double percent;
  final double delivery;
  final double rating;
  final double distance;
  final String id;
  final List<FoodData> loadData;
  final List<FoodData> loadDataSecond;
  final List<FoodData> loadDataThird;

  restaurantMenu({
    required this.name,
    required this.image,
    required this.price,
    required this.percent,
    required this.delivery,
    required this.rating,
    required this.distance,
    required this.loadData,
    required this.loadDataSecond,
    required this.loadDataThird,
    this.id = '1',
    //required this.huga,
  });

  double get getPrice {
    return price;
  }

  double get getDelivery {
    return delivery;
  }

  double get getRating {
    return rating;
  }

  double get getDistance {
    return distance;
  }

  String get getImage {
    return image;
  }

  String get getName {
    return name;
  }

  List<FoodData> get getLoadData {
    return loadData;
  }

  List<FoodData> get getLoadDataSecond {
    return loadDataSecond;
  }

  List<FoodData> get getLoadDataThird {
    return loadDataThird;
  }
}

class SecondScreenImagesIds {
  final String image;
  final String id;
  SecondScreenImagesIds({required this.image, this.id = '0'});
  String get getImage {
    return image;
  }
}

// final List<SecondScreenImagesIds> SecondScreenImagesIds_List = [
//   SecondScreenImagesIds(
//       image:
//           "https://media.istockphoto.com/id/1495561807/photo/fresh-raw-ground-beef-burger-patty-with-salt-and-spices.webp?b=1&s=170667a&w=0&k=20&c=JIRaXP6_B8fD84NI_3kQIMSgvmLMHhu_BfqZohsAdyE=",
//       id: '1'),
//   SecondScreenImagesIds(
//       image:
//           "https://media.istockphoto.com/id/1308168818/photo/sausage-with-knife-over-cutting-board.webp?b=1&s=170667a&w=0&k=20&c=Ycx6laJpP1B_Pl3AmmWxHwQmVroKLWN7YayPcAn2X5E=",
//       id: '2'),
//   SecondScreenImagesIds(
//       image:
//           "https://images.unsplash.com/photo-1585325701165-351af916e581?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2F1c2FnZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
//       id: '3'),
//   SecondScreenImagesIds(
//       image:
//           "https://media.istockphoto.com/id/1289684657/photo/breakfast-with-fried-turkish-sucuk-fried-sausage-stock-photo.webp?b=1&s=170667a&w=0&k=20&c=df55VYdQeYll6VQbcREBfBu7ff0KEx72lJTj5rmaUQo=",
//       id: '4'),
//   SecondScreenImagesIds(
//       image:
//           "https://media.istockphoto.com/id/1289684657/photo/breakfast-with-fried-turkish-sucuk-fried-sausage-stock-photo.webp?b=1&s=170667a&w=0&k=20&c=df55VYdQeYll6VQbcREBfBu7ff0KEx72lJTj5rmaUQo=",
//       id: '5'),
// ];
class CartItemClass {
  final String title;
  final double price;
   final int noProduct;
   final String id;
  final String description;
  const CartItemClass({required this.id, required this.title, required this.price, required this.description, required this.noProduct});
  String get getTitle {
    return  title;
  }

}
final List<FoodData> idk = [
  FoodData(
    title: "Chicken Parmesan",
    image:
        "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    price: 12.99,
    description:
        "A classic Italian dish with breaded chicken, tomato sauce, and mozzarella cheese.",
    subDescription: "Served with spaghetti and garlic bread.",
  ),
  FoodData(
    title: "Vegetable Stir-Fry",
    image:
        "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    price: 9.99,
    description: "A healthy stir-fry loaded with colorful vegetables and tofu.",
    subDescription: "Served with steamed rice.",
  ),
  FoodData(
    title: "Pepperoni Pizza",
    image:
        "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    price: 10.99,
    description: "A classic pepperoni pizza with a thin and crispy crust.",
    subDescription: "Available in small, medium, and large sizes.",
  ),
  FoodData(
    title: "Chocolate Brownie",
    image:
        "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    price: 4.99,
    description:
        "A decadent chocolate brownie topped with vanilla ice cream and hot fudge sauce.",
    subDescription: "Perfect for dessert lovers!",
  ),
];
final List<restaurantMenu> restaurantList = [
  restaurantMenu(
      loadData: idk,
      loadDataSecond: idk,
      loadDataThird: idk,
      name: "Ranchers",
      image:
          'https://media.istockphoto.com/id/1398630614/photo/bacon-cheeseburger-on-a-toasted-bun.webp?b=1&s=170667a&w=0&k=20&c=Aq7Dg29n3DDE3gqgT2cWSh9LYxZnr-8SFu0crRQxArA=',
      price: 900,
      percent: 45,
      delivery: 40,
      rating: 2.5,
      distance: 2.0,
      id: "1"),
  restaurantMenu(
      loadData: idk,
      loadDataSecond: idk,
      loadDataThird: idk,
      name: "California pizza",
      image:
          'https://media.istockphoto.com/id/1364747500/photo/the-perfect-toppings.webp?b=1&s=170667a&w=0&k=20&c=8QskuCdIPh-lj5VAxcHyBYVtEPTmjKnaSWDaJTTy_ec=',
      price: 3000,
      percent: 35,
      delivery: 120,
      rating: 3.5,
      distance: 3.0,
      id: "2"),
  restaurantMenu(
      loadData: idk,
      loadDataSecond: idk,
      loadDataThird: idk,
      name: "Tahzeeb Bakery",
      image:
          "https://media.istockphoto.com/id/1412492973/photo/butter-chicken-pizza-with-raw-cherry-tomato-black-pepper-garlic-and-mushroom-isolated-on.webp?b=1&s=170667a&w=0&k=20&c=yIX0z4HvmlPBiuEN-cQVoyloUDUtdaWm4sCP0q5AhEg=",
      price: 2500,
      percent: 10,
      delivery: 120,
      rating: 3,
      distance: 1,
      id: "2"),
  restaurantMenu(
      loadData: idk,
      loadDataSecond: idk,
      loadDataThird: idk,
      name: "Hardees",
      image:
          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnVyZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      price: 9000,
      percent: 15,
      delivery: 12,
      rating: 1.5,
      distance: 3.0,
      id: "3"),
  restaurantMenu(
      loadData: idk,
      loadDataSecond: idk,
      loadDataThird: idk,
      name: "Alnoor",
      image:
          'https://images.unsplash.com/photo-1606131731446-5568d87113aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 1220,
      percent: 25,
      delivery: 10,
      rating: 4,
      distance: 9.0,
      id: "4"),
  restaurantMenu(
      loadData: idk,
      loadDataSecond: idk,
      loadDataThird: idk,
      name: "Subway",
      image:
          'https://media.istockphoto.com/id/1347277460/photo/sandwich-with-smoked-meat-turkey-and-cheese-sandwich-bacon-cheeseburger-ham-hamburger-beef.webp?b=1&s=170667a&w=0&k=20&c=sNxXqPyPdNuU2ChBAnc1iIL4jl-cpxsGIA5N9Il7LN4=',
      price: 50,
      percent: 5,
      delivery: 20,
      rating: 5,
      distance: 1.0,
      id: "5"),
];
