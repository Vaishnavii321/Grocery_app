import 'package:flutter/material.dart';
import 'package:grocery_app/utils/colors.dart';

class HeaderParts extends StatefulWidget {
  const HeaderParts({super.key});

  @override
  State<HeaderParts> createState() => _HeaderPartsState();
}

int selectedIndex = 0;
class _HeaderPartsState extends State<HeaderParts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        topHeader(),
        const SizedBox(height: 30),
        title(),
        const SizedBox(height: 21),
        searchBar(),
        const SizedBox(height: 30),
        categorySelection(),
        
      ]
    );
  }

  Padding categorySelection() {
    //list of items
    List list = ['All', 'Food', 'Friuts', 'Vegetables', 'Grocery'];
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
          height: 35,
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Text(list[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedIndex == index ? const Color.fromARGB(218, 4, 151, 9) : Colors.black45,
                      fontWeight: selectedIndex == index ? FontWeight.bold : null,
                      )
                    ),
                  )
                )
              );
            }
          )
        ),
    );
  }

  Container searchBar() {
    return Container(
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green[50],
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: primaryColors),
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.black38),
                ),
              )
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: primaryColors,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: const Icon(Icons.insert_emoticon_sharp, color: Colors.white),
                ),
              )
            )
          ],
        )
      );
  }

  Padding title() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColors,
                fontSize: 20,
              )
            ),
            Text('Find your food', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
              )
            ),
          ],
        ),
      );
  }

  Padding topHeader() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Material(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: const Icon(Icons.menu_open_rounded)
                ),
              )
            ),
            const Spacer(),
            const Icon(
              Icons.location_on,
              color: primaryColors,
              size: 18
            ),
            const Text('Kanpur, UP', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              )
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/profile_img.jpg', height: 50, width: 50),
            )
          ],
        ),
      );
  }
}