import 'package:caferia/buildmynavbar.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class NavigatedScreen extends StatefulWidget {
  const NavigatedScreen({super.key});

  @override
  State<NavigatedScreen> createState() => _NavigatedScreenState();
}

class _NavigatedScreenState extends State<NavigatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BuildMyNavBar(),
    );
  }
}
