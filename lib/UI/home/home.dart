import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Scaffold(
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/Mask Group 440.png"))),
          child: Column(
            children: [
              ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: Colors.red,
                ),
              )
            ],
          ),
        )),
      ),
      Center(
        child: Text("Hello"),
      ),
      Center(
        child: Text("Hello1"),
      ),
      Center(
        child: Text("Hello2"),
      ),
    ];
    return Scaffold(
        body: screens[0],
        bottomNavigationBar: Stack(
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.red,
              ),
            ),
            BottomNavigationBar1()
          ],
        ));
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path1 = Path();
    path1.moveTo(size.width * 0.5028571, size.height * 0.7500000);
    path1.lineTo(size.width * 0.9971429, size.height * 0.9900000);
    path1.lineTo(size.width * 0.9942857, size.height * 0.0033333);
    path1.lineTo(size.width * 0.0057143, size.height * 0.0100000);
    path1.lineTo(size.width * 0.0057143, size.height * 0.9966667);
    return path1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.5028571, size.height * 0.0700000);
    path0.lineTo(size.width * 0.0057143, size.height * 0.1733333);
    path0.lineTo(size.width * 0.0057143, size.height * 0.9933333);
    path0.lineTo(size.width * 0.9971429, size.height * 0.9933333);
    path0.lineTo(size.width * 0.9942857, size.height * 0.1633333);
    path0.lineTo(size.width * 0.5028571, size.height * 0.0700000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({super.key});

  @override
  State<BottomNavigationBar1> createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      color: Colors.transparent,
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                    text: "Home",
                    icon: Icons.home,
                    selected: selected == 0,
                    onPressed: () {
                      setState(() {
                        selected = 0;
                      });
                    }),
                IconBottomBar(
                    text: "Search",
                    icon: Icons.search,
                    selected: selected == 1,
                    onPressed: () {
                      setState(() {
                        selected = 1;
                      });
                    }),
                IconBottomBar(
                    text: "Add",
                    icon: Icons.add,
                    selected: selected == 2,
                    onPressed: () {
                      setState(() {
                        selected = 2;
                      });
                    }),
                IconBottomBar(
                    text: "Cart",
                    icon: Icons.local_grocery_store,
                    selected: selected == 3,
                    onPressed: () {
                      setState(() {
                        selected = 3;
                      });
                    }),
              ],
            )),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      super.key});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 25,
              color: selected ? Colors.white : Colors.black,
            )),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: 0.1,
              color: selected ? Colors.white : Colors.black),
        )
      ],
    );
  }
}
