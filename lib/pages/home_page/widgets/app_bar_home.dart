import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 13, right: 5),
                              child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Pokedex",
                              style: TextStyle(
                                fontFamily: 'Google',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]                  ),
                  height: 120,
                  // color: (Color.fromARGB(200, 240, 245, 210)),
                );
  }
}