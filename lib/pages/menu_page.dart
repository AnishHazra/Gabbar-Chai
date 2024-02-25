import 'package:flutter/material.dart';
import 'package:gabbar_chai/components/button.dart';
import 'package:gabbar_chai/components/food_tile.dart';
import 'package:gabbar_chai/models/shop.dart';
import 'package:gabbar_chai/pages/food_details_page.dart';
import 'package:gabbar_chai/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu

  //Navigate to food item details page
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          "Gabbar Chai",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          //cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cartpage");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //promo message
                Column(
                  children: [
                    Text(
                      "Get 30% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),
                    //redeem button
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),
                Image.asset(
                  'lib/images/tea5.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(height: 25),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here...",
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //menu list
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Tea Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //popular food
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //image
                    Image.asset(
                      "lib/images/tea1.png",
                      height: 60,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Green Tea",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        //price
                        const Text(
                          "₹40",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                //heart icon
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                  size: 28,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
