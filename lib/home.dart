import 'package:flutter/material.dart';
import 'package:flutter_ui_coffe/coffee_tile.dart';
import 'package:flutter_ui_coffe/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List coffeeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];

  void coffeTypeSelected(int index){
    setState(() {
      for(int i=0; i <coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue().copyWith(fontSize: 56, ),
            ),
          ),
          SizedBox(height: 25,),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                  )
              ),
            ),
          ),
          SizedBox(height: 25,),

          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index){
                return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: (){
                        coffeTypeSelected(index);
                      }
                  );
              },
            ),
          ),

          Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'images/capuccino.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'images/cof.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'images/coffee.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '4.20',
                  ),
                ],
              )
          )

        ],
      ),
    );
  }
}
