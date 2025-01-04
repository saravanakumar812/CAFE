
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Modal/FavoritesResponseModal.dart';

class FavoriteScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  // RxList<FavoritesResponseModel> favoritesData = RxList();
  var favoritesData = <FavoritesResponseModel>[].obs;
  RxList<RxInt> counter = RxList<RxInt>([RxInt(1)]);
  RxInt count = RxInt(1);
  RxBool isLoading = RxBool(false);
  // RxBool isFavorite = RxBool(false);

  void incrementCounter(int index) {
    isLoading.value = true;
    if (index >= 0 && index < counter.length) {
      counter[index].value++;
    }
    // int price =
    //     int.tryParse(CartProdct[index].productPriceDuplicate ?? '0') ?? 0;
    // int result = price * counter[index].value;
    // UpdatePrice.value = result.toString();
    // CartProdct[index].productPrice = UpdatePrice.value;
    //
    // log(json.encode(CartProdct));

    isLoading.value = false;
  }

  // void updatePrice(int index) {
  //   if (index >= 0 && index < CartProdct.length && index < counter.length) {}
  // }

  void decrementCounter(int index) {
    isLoading.value = true;

    if (index >= 0 && index < counter.length && counter[index].value > 1) {
      counter[index].value--;
    }
    // int price =
    //     int.tryParse(CartProdct[index].productPriceDuplicate ?? '0') ?? 0;
    // int result = price * counter[index].value;
    // UpdatePrice.value = result.toString();
    // CartProdct[index].productPrice = UpdatePrice.value;
    //
    // log(json.encode(CartProdct));

    isLoading.value = false;
  }




  var pass = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    favoritesList();
  }
  favoritesList() {
    FavoritesResponseModel card1 = FavoritesResponseModel(
        title: 'Cappuccino', images: 'assets/images/cappuccino.png', ratings: '3.5', amount: '2\$');
    FavoritesResponseModel card2 = FavoritesResponseModel(
        title: 'Espresso', images: 'assets/images/Espresso.png', ratings: '4.5', amount: '3\$');
    FavoritesResponseModel card3 = FavoritesResponseModel(
        title: 'Americano', images: 'assets/images/Americano.png', ratings: '2.5', amount: '2.55\$');
    FavoritesResponseModel card4 = FavoritesResponseModel(
        title: 'Latte', images: 'assets/images/Latte.png', ratings: '44.3', amount: '4\$');


    // card1.title = "";
    // card1.images = "";
    // card1.amount = "";
    // card1.ratings = "";
    favoritesData.add(card1);

    // card2.title = "Espresso";
    // card2.images = "assets/images/Espresso.png";
    // card2.amount = "3\$";
    // card2.ratings = "4.5";
    favoritesData.add(card2);

    // card3.title = "Americano";
    // card3.images = "assets/images/Americano.png";
    // card3.amount = "2.55\$";
    // card3.ratings = "4";
    favoritesData.add(card3);

    // card4.title = "Latte";
    // card4.images = "assets/images/Latte.png";
    // card4.amount = "4\$";
    // card4.ratings = "4.3";
    favoritesData.add(card4);


  }

//   void updateFavorite() {
//     isFavorite.value = !isFavorite.value;
// }
  void toggleFavorite(int index) {
    var currentStatus = favoritesData[index].isFavorite ?? false;
    favoritesData[index] = favoritesData[index]
        .copyWith(isFavorite: !currentStatus);
  }

  void increment() {
    count++;
  }
  void decrement() {
    count--;
  }
}