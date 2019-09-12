import 'package:flutter/material.dart';
import 'package:ecommerce_app/presentation/custom_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      backgroundColor: Color(0xFF573dc0),
      selectedIndex: currentIndex,
      showElevation: false,
      onItemSelected: (index) => setState(() {
        currentIndex = index;
      }),
      items: [
        BottomNavyBarItem(
            icon: Icon(CustomIcons.home),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            activeColor: Color(0xFF9769d3),
            inactiveColor: Colors.black.withOpacity(0.5)),
        BottomNavyBarItem(
            icon: Icon(CustomIcons.messages),
            title: Text('Messages'),
            activeColor: Color(0xFF9769d3),
            inactiveColor: Colors.black.withOpacity(0.5)),
        BottomNavyBarItem(
            icon: Icon(CustomIcons.faV),
            title: Text('Wish List'),
            activeColor: Color(0xFF9769d3),
            inactiveColor: Colors.black.withOpacity(0.5)),
        BottomNavyBarItem(
            icon: Icon(CustomIcons.avatar),
            title: Text('Profile'),
            activeColor: Color(0xFF9769d3),
            inactiveColor: Colors.black.withOpacity(0.5)),
      ],
    );
  }
}

class BottomNavyBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;

  BottomNavyBar(
      {Key key,
      this.selectedIndex = 0,
      this.showElevation = true,
      this.iconSize = 24,
      this.backgroundColor,
      this.animationDuration = const Duration(milliseconds: 270),
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
  }

  Widget _buildItem(BottomNavyBarItem item, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: AnimatedContainer(
        width: isSelected ? 120 : 50,
        height: double.maxFinite,
        duration: animationDuration,
        padding: EdgeInsets.only(left: 13),
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.8) : backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconTheme(
                    data: IconThemeData(
                        size: iconSize, color: item.inactiveColor),
                    child: item.icon,
                  ),
                ),
                isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(
                            color: item.inactiveColor,
                            fontWeight: FontWeight.w700,
                          fontFamily: "JosefinSans",),
                        child: item.title,
                      )
                    : SizedBox.shrink()
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      decoration: BoxDecoration(color: bgColor, boxShadow: [
        if (showElevation) BoxShadow(color: Colors.black12, blurRadius: 2)
      ]),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 56,
          padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavyBarItem(
      {@required this.icon,
      @required this.title,
      this.activeColor = Colors.blue,
      this.inactiveColor}) {
    assert(icon != null);
    assert(title != null);
  }
}
