import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/Hadeth.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';


class AhadethDetailsScreen extends StatelessWidget {
  static const String routeName = "ahadeth";
  const AhadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
              settingsProvider.themeMode == ThemeMode.dark
              ?"assets/images/home_dark_background.png"
              : "assets/images/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
      appBar: AppBar(title: Text(args.title),),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: SingleChildScrollView(
                child: Text(args.content,style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
