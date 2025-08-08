import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Cart_Provider.dart';



class productDetailsPage extends StatefulWidget {
  final product;
  const  productDetailsPage({
    required this.product,
    super.key});

  @override
  State<productDetailsPage> createState() => _productDetailsPageState();
}

class _productDetailsPageState extends State<productDetailsPage> {
   int selectedSize =0;

   void onTap(){
     print("clicked add to cart");
     if (selectedSize != 0) {
       context.read<cartProvider>().addProduct(
           {
         "id": widget.product['id'],
         "title": widget.product['title'],
         "price": widget.product['price'],
         "imageUrl": widget.product['imageUrl'],
         "company": widget.product['company'],
         "sizes": selectedSize,
       }
       );
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content:Text("Product Added to Cart",
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
           ),
         ),

       ),
       );
     }else{
       print("please select a size");
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
         content:Text("plese select size first!!",
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
           ),
         ),
       ),
       );
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
            style: Theme.of(context).textTheme.titleMedium),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
                Icons.arrow_back_ios,
            ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Men's Nike Shoes",
            style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
         Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage("${widget.product['imageUrl']}",
              ),
            ),
          ),
          Spacer(flex: 2),

          Container(
            height: 250,
            decoration: BoxDecoration(
              color:  Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("₹ ${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
                 SizedBox(height: 10,),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: widget.product['sizes'].length,
                        itemBuilder: (context, index){
                        final size= widget.product['sizes'][index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedSize== size ? Colors.yellow : null,
                                label: Text("${widget.product['sizes'][index]}"),
                              ),
                            ),
                          );
                    },
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: onTap,
                    icon: Icon(Icons.shopping_cart_outlined,
                    size: 25,),
                    label: Text("Add to Cart",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
