import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subway_app/model/model.dart';
import 'package:subway_app/service/subway_service.dart';

class Home extends StatelessWidget {
  String str = "";
  Home({Key? key, required this.str}) : super(key: key);

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
          'Home',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(0, 137, 56, 1),
        elevation: 1,
      ),
      body: SafeArea(
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
                margin: EdgeInsets.only(left: 28, top: 30),
                child: Text(
                  'Hello, $str!',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, top: 5, bottom: 20),
                child: Text(
                  'What do you want to chew',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, top: 12),
                child: Text(
                  'Sandwich',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 137, 56, 1)),
                ),
              ),
              Container(
                height: 3000,
                width: screenWidth,
                child: FutureBuilder<List<Subway>>(
                    future: SubwayService.getDataSubway(),
                    builder: (context, snapshot) {
                      //loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Masih Loading...');
                      } else {
                        //error
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          //berhasil
                          // return Text(snapshot.data.toString());
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 28,
                              right: 28,
                            ),
                            child: GridView.builder(
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Image.network(
                                          "${snapshot.data![index].img}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            child: Text(
                                              "${snapshot.data![index].nama}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "${snapshot.data![index].harga}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  color: Color.fromRGBO(
                                                      242, 183, 0, 1),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          );
                        }
                      }
                    }),
              )
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
