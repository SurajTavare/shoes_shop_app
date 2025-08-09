import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_list_screen.dart';
import 'cart_page_screen.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  int currentPage=0;
  List<Widget> pages=[
    ProductListScreen(),
    cartPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children:pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentPage=value;
          });
        },
        currentIndex: currentPage,
        iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "",
            )
          ]
      ),
    );
  }
}
