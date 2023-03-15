import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {

  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTile({required this.coffeeImagePath, required this.coffeeName, required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeeImagePath),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName, style: TextStyle(fontSize: 20),),
                  SizedBox(height: 4,),
                  Text('With Almond Milk', style: TextStyle(color: Colors.grey[700]),),
                ],
              ),
            ),
            SizedBox(height: 8,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$'+coffeePrice, style: TextStyle(fontSize: 18),),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
