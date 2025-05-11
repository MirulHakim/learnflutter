import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/base/res/media.dart';
import 'package:learning/base/res/styles/app_styles.dart';
import 'package:learning/base/utils/all_json.dart';
import 'package:learning/base/widgets/app_column_text_layout.dart';
import 'package:learning/base/widgets/app_layoutbuilder_widget.dart';
import 'package:learning/base/widgets/ticket_view.dart';
import 'package:learning/screens/search/widgets/app_ticket_tabs.dart';
import 'package:learning/screens/ticket/widgets/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  late int ticketIndex=0;

  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)!.settings.arguments!=null){
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    ticketIndex = args["index"];
    }
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            children: [
              Text("Tickets", style: AppStyles.headLineStyle1,),
              SizedBox(height: 20,),
              AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous",),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex], isColor: true),
              ),
              SizedBox(height: 1,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketWhite,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(topText: "Flutter DB", bottomText: "Passenger", align: CrossAxisAlignment.start, isColor: true,),
                        AppColumnTextLayout(topText: "5221 36869", bottomText: "passport", align: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLayoutbuilderWidget(randomDivider: 15, width: 5, isColor: false,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(topText: "2465 6584940", bottomText: "Number of E-ticket", align: CrossAxisAlignment.start, isColor: true,),
                        AppColumnTextLayout(topText: "846859", bottomText: "Booking code", align: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    AppLayoutbuilderWidget(randomDivider: 15, width: 5, isColor: false,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AppMedia.visa, scale: 11,),
                                Text(" *** 2462", style: AppStyles.headLineStyle3,)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("Payment method", style: AppStyles.headLineStyle4,)
                          ],
                        ),
                        AppColumnTextLayout(topText: "\$299.99", bottomText: "Price", align: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1,),
              //bottom of the ticket detail section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketWhite,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21)
                  )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                      child: BarcodeWidget(
                        height: 70,
                        barcode: Barcode.code128(),
                        data: 'https://www.dbestech.com',
                        drawText: false,
                        color: AppStyles.textColor,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20,),
              //colorful ticket
              Container(
                padding: EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex]),
              ),
            ],
          ),
          TicketPositionedCircle(pos: true,),
          TicketPositionedCircle(pos: false,),
          
        ],
      ),
    );
  }
}