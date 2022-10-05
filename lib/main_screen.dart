import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kuis/detail.dart';
import 'package:kuis/groceries.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _rating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26.withOpacity(0.8),
        appBar: AppBar(
          title: Text('List Belanjaan'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final Groceries groceries = groceryList[index];
            double rating;

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                          groceries: groceries,
                        )));
              },
              child: Card(
                elevation: 50,
                shadowColor: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      // width: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              Colors.green.withOpacity(0.6), BlendMode.dstOut),
                          image: NetworkImage(groceries.productImageUrls[0]),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            groceries.name,
                            style: TextStyle(
                              // backgroundColor: Colors.deepPurpleAccent,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Nama Toko : ${groceries.storeName}',
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Harga : Rp. ${groceries.price}',
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          RatingBar(
                              initialRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20.0,
                              ratingWidget: RatingWidget(
                                  full: const Icon(Icons.star, color: Colors.red,),
                                  half: const Icon(Icons.star_half, color: Colors.red,),
                                  empty: const Icon(Icons.star_outline, color: Colors.red,)),
                              onRatingUpdate: (value){
                                _rating = value;
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: groceryList.length,
        ));
  }
}
