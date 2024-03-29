import 'package:flutter/material.dart';
import 'package:gabbar_chai/components/button.dart';
import 'package:gabbar_chai/models/food.dart';
import 'package:gabbar_chai/models/shop.dart';
import 'package:gabbar_chai/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity

  int quantityCount = 0;

  // decrement Quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                //pop oce to remove dialog box
                Navigator.pop(context);

                // pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),

                  //rating
                  Row(
                    children: [
                      //star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),
                      //rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  //description
                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Indulge in the delightful harmony of flavors with our Veg Cheese Grill. This mouthwatering creation is a celebration of wholesome goodness and cheesy indulgence. Picture this: a medley of fresh, crisp vegetables, carefully selected for their vibrant colors and robust flavors, generously layered between slices of warm, toasted bread.",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //price + quantity + add to cart button
          Container(
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  //price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${widget.food.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          //minus button
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),

                          //quantity count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),

                          //plus button
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  //add to cart button
                  MyButton(text: "Add To Cart", onTap: addToCart)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
