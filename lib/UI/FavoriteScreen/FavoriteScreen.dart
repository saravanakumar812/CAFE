import 'dart:ffi';

import 'package:cafe/Controllers/FavoriteController/FavoriteScreenController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/CartCommonComponent.dart';
import '../../Utils/theme.dart';

class FavoriteScreen extends GetView<FavoriteScreenController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    FavoriteScreenController controller = Get.put(FavoriteScreenController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controller.searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppTheme.buttonColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 1, color: AppTheme.buttonColor),
                ),
                hintText: "Search",
                hintStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                contentPadding: const EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppTheme.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(
                  decoration: TextDecoration.none,
                  decorationThickness: 0,
                  color: AppTheme.containerBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //   child: Container(
          //     width: width,
          //     height: height * 0.135,
          //     decoration: BoxDecoration(
          //         // color: Colors.black,
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color: Colors.black)),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 10),
          //           child: Container(
          //             width: width * 0.33,
          //             height: height * 0.1,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 image: DecorationImage(
          //                     image: AssetImage(
          //                       "assets/images/cappuccino.png",
          //                     ),
          //                     fit: BoxFit.cover)),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 10),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 12),
          //                 child: Text(
          //                   'Cappuccino'.tr,
          //                   style: GoogleFonts.poppins(
          //                     color: AppTheme.appBlack,
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding:
          //                     EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          //                 child: Text(
          //                   "2\$",
          //                   style: GoogleFonts.poppins(
          //                     color: Colors.black,
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding:
          //                     EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          //                 child: Container(
          //                   width: width * 0.43,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       // Text(
          //                       //   "2\$",
          //                       //   style: GoogleFonts.poppins(
          //                       //     color: Colors.black,
          //                       //     fontSize: 14,
          //                       //     fontWeight: FontWeight.w600,
          //                       //   ),
          //                       // ),
          //                       Icon(Icons.favorite_border),
          //                       InkWell(
          //                         onTap: () {},
          //                         child: Container(
          //                           padding: EdgeInsets.all(5),
          //                           decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(100),
          //                               color: AppTheme.buttonColor),
          //                           child: Icon(
          //                             Icons.add,
          //                             color: Colors.white,
          //                             size: 15,
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // Expanded(
          //     child: ListView.builder(
          //         itemCount: controller.favoritesData.length,
          //         itemBuilder: (context, index) {
          //           return CartCommonComponent(
          //             productImage: controller
          //                 .favoritesData[
          //             index]
          //                 .images ??
          //                 "",
          //             productName: controller
          //                 .favoritesData[
          //             index]
          //                 .title ??
          //                 "",
          //             productQty: controller
          //                 .favoritesData[
          //             index]
          //                 .ratings ??
          //                 "",
          //             productPrice: controller
          //                 .favoritesData[
          //             index]
          //                 .amount
          //                 .toString() ??
          //                 "",
          //
          //
          //             OnPressed: () {
          //
          //             },
          //             decrementCounter: () {
          //               controller
          //                   .decrementCounter(
          //                   index);
          //               // controller
          //               //     .onClickCounterList[
          //               // index];
          //             },
          //             incrementCounter: () {
          //               controller
          //                   .incrementCounter(
          //                   index);
          //               // controller
          //               //     .onClickCounterList[
          //               // index];
          //             },
          //             counter: controller
          //                 .counter[index]
          //                 .value,
          //           );
          //         })),

          Expanded(
              child: ListView.builder(
                  itemCount: controller.favoritesData.length,
                  itemBuilder: (context, index,) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Container(
                        width: width,
                        height: height * 0.157,
                        decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                width: width * 0.33,
                                height: height * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          controller.favoritesData[index].images
                                              .toString(),
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Container(
                                      width: width * 0.43,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.favoritesData[index].title
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              color: AppTheme.appBlack,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/Vector.png"),
                                              Text(
                                                controller.favoritesData[index].ratings
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  color: AppTheme.appBlack,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Text(
                                      controller.favoritesData[index].amount
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Container(
                                      width: width * 0.43,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller.toggleFavorite(index);
                                            },
                                            icon: Obx(() => Icon(
                                              controller.favoritesData[index].isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: controller.favoritesData[index].isFavorite
                                                  ? Colors.red
                                                  : Colors.grey,
                                            )),
                                          ),

                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: AppTheme.buttonColor),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))

        ],
      ),
    );
  }
}
