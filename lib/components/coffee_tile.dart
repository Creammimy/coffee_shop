import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatefulWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;

  CoffeeTile({
    Key? key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  _CoffeeTileState createState() => _CoffeeTileState();
}

class _CoffeeTileState extends State<CoffeeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(widget.coffee.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: ${(widget.coffee.price).toString()} ฿'),
              ],
            ),
            leading: Image.asset(widget.coffee.image),
            trailing: IconButton(
              icon: widget.icon,
              onPressed: widget.onPressed,
            ),
          ),
          SizedBox(height: 8),
          Text('Sweet Level :',style: TextStyle(fontSize: 12),),
          SizedBox(height: 8),
          Row(
  //mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(width: 10),
    SweetnessButton(
      percentage: 25,
      selected: widget.coffee.sweetnessLevel == 25,
      onPressed: () {
        setState(() {
          widget.coffee.setSweetnessLevel(25);
        });
      },
    ),
    SizedBox(width: 10),
    SweetnessButton(
      percentage: 50,
      selected: widget.coffee.sweetnessLevel == 50,
      onPressed: () {
        setState(() {
          widget.coffee.setSweetnessLevel(50);
        });
      },
    ),
    SizedBox(width: 10),
    SweetnessButton(
      percentage: 75,
      selected: widget.coffee.sweetnessLevel == 75,
      onPressed: () {
        setState(() {
          widget.coffee.setSweetnessLevel(75);
        });
      },
    ),
    SizedBox(width: 10),
    SweetnessButton(
      percentage: 100,
      selected: widget.coffee.sweetnessLevel == 100,
      onPressed: () {
        setState(() {
          widget.coffee.setSweetnessLevel(100);
        });
      },
    ),
  ],
),
Row(
  //mainAxisAlignment: MainAxisAlignment.center,
  
  children: [
    SizedBox(width: 10),
    IconButton(
      icon: Icon(Icons.remove),
      onPressed: () {
        setState(() {
          widget.coffee.decrementQuantity();
        });
      },
    ),
    SizedBox(width: 10),
    Text(
      'Quantity: ${widget.coffee.quantity}',
      style: TextStyle(
        fontSize: 12,
        color: Colors.brown,
      ),
    ),
    SizedBox(width: 10),
    IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        setState(() {
          widget.coffee.incrementQuantity();
        });
      },
    ),
  ],
),
        ],
      ),
    );
  }
}

class SweetnessButton extends StatelessWidget {
  final int percentage;
  final bool selected;
  final void Function()? onPressed;

  SweetnessButton({
    required this.percentage,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: selected ? Colors.brown : Colors.grey[200], // กำหนดสีพื้นหลัง
        onPrimary: Colors.brown, // กำหนดสีของตัวหนังสือ
        side: BorderSide(color: Colors.brown), // กำหนดสีขอบ
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        '$percentage%',
        style: TextStyle(
          color: selected ? Colors.white : Colors.brown, // กำหนดสีของตัวหนังสือ
        ),
      ),
    );
  }
}