import 'package:flutter/material.dart';
import 'package:learning/base/res/media.dart';
import 'package:learning/base/res/styles/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //Column
    //ListView
    //ListView.Builder
    //Expand
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good morning", style: AppStyles.headLineStyle3),
                        SizedBox(height: 5,),
                        Text("Book Tickets", style: AppStyles.headLineStyle1),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage(AppMedia.logo)),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Search icon"), Text("Empty space")]
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}