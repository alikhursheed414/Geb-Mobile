

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geb_mobile_1/Views/HomePage/HomaPage.dart';
import 'package:geb_mobile_1/Views/ProjectHistory/ProjectHistory.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:geb_mobile_1/Views/Projects/projects.dart';

import 'Widgets/Drawers.dart';
import 'Views/Notifications/Notifications.dart';
import 'Views/Projects/ProjectDetails.dart';


class HomeBottomBar extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeBottomBar> {
  int _selectedIndex = 0;

  late Function(BuildContext) openDrawer;
  late Function(BuildContext) openEndDrawer;

  @override
  void initState() {
    super.initState();
    openDrawer = (BuildContext context) {
      Scaffold.of(context).openDrawer();
    };

    openEndDrawer = (BuildContext context) {
      Scaffold.of(context).openEndDrawer();
    };
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    final List<Widget> _page = [
      HomePage(
        openDrawer: openDrawer,
        openEndDrawer: openEndDrawer,
      ),
      Projects(),
      ProjectHistory(),
      Notifications(),
    ];
    return Scaffold(
      drawer: ProfileDrawerScreen(),
      endDrawer: RightSideDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(// Adjust this to control the space for the bottom bar
                child:SafeArea(child: _page[_selectedIndex])
            ),
            Positioned(
              left: 21,
              right: 21,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                width: 316.w,
                margin: EdgeInsets.all(21.w),
                decoration: BoxDecoration(
        
                  color: PrimaryColors.customebutton,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                        color: PrimaryColors.background1.withOpacity(0.1),
                        spreadRadius: 0.r,
                        blurRadius: 4.r,
                        offset: Offset(0,4)
                    ),
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      4, (index) => _buildNavItem(index)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    String Svgpath;
    switch (index) {
      case 0:
        Svgpath = "assets/icons/home.svg";
        break;
      case 1:
        Svgpath = "assets/icons/doc.svg";
        break;
      case 2:
        Svgpath = "assets/icons/calender.svg";
        break;
      case 3:
        Svgpath = "assets/icons/notify.svg";
        break;
      default:
        Svgpath = "assets/icons/home.svg";// fallback
    }

    return GestureDetector(
      onTap: () => setState(() {
        _selectedIndex = index;
      }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: _selectedIndex == index ?BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                  color: PrimaryColors.background1.withOpacity(0.25),
                    spreadRadius: -7.r,
                    blurRadius: 4.r,
                    offset: Offset(0,1)
                    ),
                   ],
                ):BoxDecoration(),
              child: SvgPicture.asset(Svgpath, color: _selectedIndex == index ? PrimaryColors.whitetext : Colors.white)),
          if (_selectedIndex == index)
            Container(
              margin: EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: PrimaryColors.background1.withOpacity(0.20),
                    blurRadius: 4.r,
                    offset: Offset(0,4)
                  ),
                ],
                borderRadius: BorderRadius.circular(2.r),
                color: PrimaryColors.whitetext,
              ),
              height: 2,
              width: 11,

            ),
        ],
      ),
    );
  }
}


