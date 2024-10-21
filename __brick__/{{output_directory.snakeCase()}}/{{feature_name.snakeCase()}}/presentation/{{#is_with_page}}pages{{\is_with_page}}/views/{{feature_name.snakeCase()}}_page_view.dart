import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}PageView extends StatefulWidget {
  const {{feature_name.pascalCase()}}PageView({ Key? key }) : super(key: key);

  @override
  _{{feature_name.pascalCase()}}PageViewState createState() => _{{feature_name.pascalCase()}}PageViewState();
}

class _{{feature_name.pascalCase()}}PageViewState extends State<{{feature_name.pascalCase()}}PageView> {
  @override
  Widget build(BuildContext context) {
    
    Widget buildBody() {
      return SafeArea(
        child: Container(),
      );
    }
    
    return Scaffold(
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }
}