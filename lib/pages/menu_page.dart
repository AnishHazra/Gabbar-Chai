import 'package:flutter/material.dart';
import 'package:gabbar_chai/components/button.dart';
import 'package:gabbar_chai/components/food_tile.dart';
import 'package:gabbar_chai/models/food.dart';
import 'package:gabbar_chai/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu
  List foodMenu = [
    //sandwich
    Food(
      name: "Veg Cheese Grill Sandwich",
      price: "120",
      imagePath: "lib/images/sandwich1.png",
      rating: "4.5",
    ),
    Food(
      name: "Chilli Cheese Sandwich",
      price: "120",
      imagePath: "lib/images/sandwich2.png",
      rating: "4.5",
    ),
    Food(
      name: "Chicken Tikka Sandwich",
      price: "150",
      imagePath: "lib/images/sandwich3.png",
      rating: "4.8",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "Gabbar Chai",
          style: TextStyle(color: Colors.grey[900]),
        ),
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
                  'lib/images/img1.png',
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
              ),
            ),
          ),
          const SizedBox(height: 25),
          //menu list

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
            ),
          )),

          //popular food
        ],
      ),
    );
  }
}