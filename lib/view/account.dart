import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subway_app/model/model.dart';
import 'package:subway_app/service/subway_service.dart';

class Account extends StatelessWidget {
  String str = "";
  Account({Key? key, required this.str}) : super(key: key);

  final List<Widget> _children = [
    // Library(),
    // Store(),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    print(str);
    // int _selectedIndex = 0;

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 28,
        title: Text(
          'Account',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(0, 137, 56, 1),
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // set min
                children: <Widget>[
              // Container(
              //   padding: EdgeInsets.only(left: 12, top: 35, bottom: 24),
              //   alignment: Alignment.topLeft,
              //   child: IconButton(
              //     icon: Icon(
              //       Icons.arrow_back,
              //     ),
              //     iconSize: 25,
              //     color: Colors.black,
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Your Account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/user.png",
                      height: 200,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.only(left: 28, top: 30),
                child: Text(
                  '$str',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(242, 183, 0, 1),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, top: 15),
                child: Text(
                  'Email : ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, bottom: 20),
                child: Text(
                  'Password : ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ),
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {},
                child: Text("Edit",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 137, 56, 1),
                    minimumSize: const Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
            ])),
      ),

//         bottomNavigationBar: FlashyTabBar(
//         animationCurve: Curves.linear,
//         selectedIndex: _selectedIndex,
//         showElevation: true,
//         onItemSelected: (index) => setState(() {
//           _selectedIndex = index;
//         }),
//         items: [
//           FlashyTabBarItem(
//             icon: const Icon(Icons.account_box),
//             title: const Text('Challenger'),
//           ),
//           FlashyTabBarItem(
//             icon: const Icon(Icons.phone),
//             title: const Text('Contact'),
//           ),
//           FlashyTabBarItem(
//             icon: const Icon(Icons.dashboard_rounded),
//             title: const Text('Events'),
//           ),
//           FlashyTabBarItem(
//             icon: const Icon(Icons.badge),
//             title: const Text('Quick Scan'),
//           ),
//         ],
//       ),
// //you have to just do changes here...
//     body: pageList.elementAt(_selectedIndex)
    );
  }
}
