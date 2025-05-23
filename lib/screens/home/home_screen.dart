import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:learning/base/res/media.dart';
import 'package:learning/base/res/styles/app_styles.dart';
import 'package:learning/base/utils/all_json.dart';
import 'package:learning/base/utils/app_routes.dart';
import 'package:learning/base/widgets/app_double_text.dart';
import 'package:learning/base/widgets/ticket_view.dart';
import 'package:learning/screens/home/widgets/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //Column
    //ListView
    //ListView.Builder
    //Expand
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        image: DecorationImage(image: AssetImage(AppMedia.logo)),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD),
                  ),
                  child: const Row(
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205)),
                      Text("Search")
                    ]
                    ),
                ),
                const SizedBox(height:40),
                AppDoubleText(bigText: 'Upcoming Flights', smallText: 'View all', func: () => Navigator.pushNamed(context, AppRoutes.allTickets)),
                const SizedBox(height:20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ticketList.map((singleTicket) => GestureDetector(
                                onTap: () {
                                  var index = ticketList.indexOf(singleTicket);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.ticketScreen,
                                    arguments: {"index": index},
                                  );
                                },
                                child: TicketView(ticket: singleTicket),
                              ),
                            ).toList(),
                  )
                  ),
                const SizedBox(height:40),
                AppDoubleText(bigText: 'Hotels', smallText: 'View all', func: () => Navigator.pushNamed(context, AppRoutes.allHotels)),
                const SizedBox(height:20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: hotelList.map((singleHotel) => GestureDetector(
                                onTap: () {
                                  var index = hotelList.indexOf(singleHotel);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.hotelDetail,
                                    arguments: {"index": index},
                                  );
                                },
                                child: Hotel(hotel: singleHotel),
                              ),
                            ).toList(),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}