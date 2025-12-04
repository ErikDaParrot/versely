import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
      // textTheme: TextTheme(
      //   titleLarge: TextStyle(
      //     color: Colors.white,
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold
      //   )
      // )
      // brightness: Brightness.dark,
    ),
    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Verses = ["Giăng 3:1-14", "1 Phi-e-rơ 5:9-11", "Tê-sa-lo-ni-ca 3:14-20", "Ê-phê-sô 8:1-2"];

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 12.0,
              color: Colors.white54,
            ),
          ),
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
    (Set<MaterialState> states) {
              return IconThemeData(color: states.contains(MaterialState.selected) ? Colors.white : Colors.white54);
            }
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.black87,
          indicatorColor: Colors.black12,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmarks),
              icon: Icon(Icons.bookmarks_outlined),
              label: 'Memorizers',
            ),
            NavigationDestination(
              // selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Versely", style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Memorizers", style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              // fontWeight: FontWeight.bold
            )),
            Expanded(child: ListView.builder(
              itemCount: Verses.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(height: 20),
                  ListTile(
                    onTap: () {},
                    dense: true,
                    contentPadding: EdgeInsetsGeometry.all(20),
                    tileColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    title: Text(Verses[index], style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54
                    )),
                    subtitle: Text(Verses[index], style: TextStyle(
                      color: Colors.white30
                    )),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.navigate_next_rounded, size: 40, color: Colors.white54)],
                    ),
                  )
                ]);
              }
            ))
          ],
        )
      )
    );
  }
}
