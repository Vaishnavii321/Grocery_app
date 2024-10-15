import 'package:flutter/material.dart';
import 'package:grocery_app/models/items_model.dart';
import 'package:grocery_app/utils/colors.dart';

class ItemsDetailPage extends StatefulWidget {
  const ItemsDetailPage({super.key, required this.food});
  final FoodDetail food;

  @override
  State<ItemsDetailPage> createState() => _ItemsDetailPageState();
}
int quantity = 1;

class _ItemsDetailPageState extends State<ItemsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
      body: ListView(
        children: [
          const SizedBox(height: 15),
          itemsDetailsPageHeader(),
          detailImage(),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.food.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\$${widget.food.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: primaryColors,
                            ),
                          ),
                        ],
                      )
                    ),
                    Material(
                      color: primaryColors,
                      borderRadius: BorderRadius.circular(20),
                      child:Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              quantity -= 1;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$quantity', 
                            style: const TextStyle(
                              color: Colors.white, 
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(width: 4),
                          IconButton(
                            onPressed: (){
                              quantity += 1;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
                const SizedBox(height: 27),
                Row(
                  children: [
                    //for rating
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      widget.food.rate.toString(),
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    //for calories 
                    const Icon(Icons.fiber_manual_record, color: Colors.red,),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.food.kcal}kcal',
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    //for time
                    const Icon(Icons.access_time_filled, color: Colors.amber,),
                    const SizedBox(width: 4),
                    Text(
                      widget.food.cookingTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //food description
                const Text("About food", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(height: 6),
                Text(
                  widget.food.description,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                //for add to cart
                Material(
                  color: primaryColors,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      child:const Text("Add to Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color:Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  )
                ),
                const SizedBox(height: 25),
              ],
            )
          )
        ]
      )
    );
  }

  SizedBox detailImage() {
    return SizedBox(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green[400]!,
                        blurRadius: 15,
                        offset: const Offset(0, 8)
                      )
                    ],
                    borderRadius: BorderRadius.circular(250),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(250),
                    child: Image.network(widget.food.image, height: 250, width: 250, fit: BoxFit.cover,)
                  )
                ),
              ),
            ]
          ),
        );
  }

  Padding itemsDetailsPageHeader() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Material(
                color: Colors.white.withOpacity(0.21),
                borderRadius: BorderRadius.circular(10),
                child: const BackButton(color: Colors.white),
              ),
              const Spacer(),
              const Text('Details Food',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.white.withOpacity(0.21),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: const Icon(Icons.favorite_border, color: Colors.white),
                  )
                )
              ),

            ],
          ),
        );
  }
}