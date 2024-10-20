import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/{{feature_name.snakeCase()}}_page_view.dart';

class {{feature_name.pascalCase()}}Page extends StatefulWidget {
  const {{feature_name.pascalCase()}}Page({ Key? key }) : super(key: key);

  @override
  _{{feature_name.pascalCase()}}PageState createState() => _{{feature_name.pascalCase()}}PageState();
}

class _{{feature_name.pascalCase()}}PageState extends State<{{feature_name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (BuildContext context) => {{feature_name.pascalCase()}}Bloc(),
    //     ),
    //   ], 
    //   child: const {{feature_name.pascalCase()}}PageView()
    // );
    return const {{feature_name.pascalCase()}}PageView();
  }
}