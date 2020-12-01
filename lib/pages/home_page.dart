import 'package:mandeepsingh/config/assets.dart';
import 'package:mandeepsingh/tabs/about_tab.dart';
//import 'package:mandeepsingh/tabs/blog_tab.dart';
import 'package:mandeepsingh/tabs/projects_tab.dart';
import 'package:mandeepsingh/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> tabWidgets = <Widget>[
    AboutTab(),
    //BlogTab(),
    ProjectsTab(),
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: ThemeSwitcher.of(context).isDarkModeOn?Icon(Icons.wb_sunny):Image.asset(Assets.moon,height: 20,width: 20,),
              onPressed: ()=> ThemeSwitcher.of(context).switchDarkMode(),
            )
          ],
        ),
        body: Center(
          child: tabWidgets.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "About",
            ),
          /*  BottomNavigationBarItem(
              
              label: "Blog",
              icon: Icon(Icons.book
              ),
            ),*/
            BottomNavigationBarItem(
              icon: Icon(Icons.mobile_screen_share),
              label: "Projects",
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (index)=> setState(() => _selectedIndex = index),
          selectedItemColor: Theme.of(context).accentColor,
        ),
    );
  }

}
