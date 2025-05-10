import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:learning/base/res/media.dart';
import 'package:learning/base/res/styles/app_styles.dart';
import 'package:learning/base/widgets/app_double_text.dart';
import 'package:learning/screens/search/widgets/app_text_icon.dart';
import 'package:learning/screens/search/widgets/app_ticket_tabs.dart';
import 'package:learning/screens/search/widgets/find_tickets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40,),
          Text("What are\n you looking for?", style: AppStyles.headLineStyle1.copyWith(fontSize: 35),),
          SizedBox(height: 20,),
          const AppTicketTabs(),
          SizedBox(height: 25,),
          AppTextIcon(icon: Icons.flight_takeoff_rounded, text: "Departure",),
          SizedBox(height: 20,),
          AppTextIcon(icon: Icons.flight_land_rounded, text: "Arrival",),
          SizedBox(height: 25,),
          const FindTickets(),
          SizedBox(height: 40,),
          AppDoubleText(bigText: 'Upcoming Flights', smallText: 'View all', func: () => print("hello there"),),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}