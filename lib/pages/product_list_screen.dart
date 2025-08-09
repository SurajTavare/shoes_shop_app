import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_card_screen.dart';
import 'package:shop_app/pages/product_details_screen.dart';
import '../data.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  TextEditingController myControlar = TextEditingController();
  final List<String> filters = const [
    "All",
    "Adidas",
    "Nike",
    "Puma",
    "Jordan",
    "Cr7",
    "Sketchers",
    "Converse",
    "Reebok",
  ];

  late String selectedFilter;
  String search = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    var filteredProducts = products.where((product) {
      return selectedFilter == 'All' ||
          product['company'] == selectedFilter ||
          product['title'] == myControlar.text;
    }).toList();
    print(filteredProducts);
    if (search.isNotEmpty) {
      for (var product in products) {
        if (product['title'].toString().toLowerCase().contains(search.toLowerCase())) {
          filteredProducts.insert(0, product);
          // filteredProducts.add(product);
        }

      }

    }

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "shoes \nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: myControlar,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    setState(() {
                      search = value;
                    });
                  },

                  decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                    ),
                    // border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      elevation: 5,
                      backgroundColor: selectedFilter == filter
                          ? Colors.yellow
                          : Color.fromRGBO(245, 247, 249, 1),
                      side: BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      label: Text(filter),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        // color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      "No Product Added Yet",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return productDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: Productcard(
                          title: product['title'].toString(),
                          price: product['price'].toString(),
                          imageUrl: product['imageUrl'].toString(),
                          color: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
