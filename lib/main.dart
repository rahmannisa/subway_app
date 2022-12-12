import 'package:flutter/material.dart';
import 'package:subway_app/view/login.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  /* WidgetFlutterBinding digunakan untuk berinteraksi dengan mesin Flutter.
  SharedPref.init() perlu memanggil kode asli untuk menginisialisasi, oleh karena itu
  perlu memanggil ensureInitialized() untuk memastikan terdapat instance yang bisa dijalankan */

  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPref.init();

  runApp(const MyApp());
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); //
//   await SharedPref.init();
//   runApp(const MyApp());
// }

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  /* fungsi mengubah tema sesuai inputan parameter */
  void setTheme(bool isDarkmode) {
    setState(() {
      /* jika isDarkmode true maka ThemeData adalah dark dan sebaliknya */
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();

      /* simpan nilai boolean pada shared preferences */
      // SharedPref.pref?.setBool('isDarkmode', isDarkmode);
    });
  }

  @override
  // void initState() {
  //   bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
  //   setTheme(isDarkmode);
  //   super.initState;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
