import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_universe/constants.dart';
import 'package:flutter_universe/data.dart';
import 'package:flutter_universe/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7]),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                          fontFamily: "Avenir",
                          fontSize: 35,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                              child: Text(
                            "Solar System",
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 20,
                              color: Color(0x7CFBF1FF),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ))
                        ],
                        onChanged: (value) {},
                        icon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset("assets/drop_down_icon.png"),
                        ),
                        underline: SizedBox(),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 450,
                  padding: EdgeInsets.only(left: 32),
                  child: Swiper(
                    itemCount: planets.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        size: 5,
                        activeSize: 10,
                        space: 10,
                        color: Colors.white,
                        activeColor: Colors.blue,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailScreen(
                                planetInfo: planets[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 100),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 100),
                                        Text(
                                          planets[index].name,
                                          style: TextStyle(
                                            fontFamily: "Avenir",
                                            fontSize: 35,
                                            color: Color(0xFF47455F),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "Solar System",
                                          style: TextStyle(
                                            fontFamily: "Avenir",
                                            fontSize: 18,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 32),
                                        Row(
                                          children: [
                                            Text(
                                              "Know more",
                                              style: TextStyle(
                                                fontFamily: "Avenir",
                                                fontSize: 14,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Hero(
                              tag: planets[index].position,
                              child: Image.asset(planets[index].iconImage),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(36),
              ),
              color: navigationColor),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Image.asset('assets/menu_icon.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/search_icon.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/profile_icon.png'),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
