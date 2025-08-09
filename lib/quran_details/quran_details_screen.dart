import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:islami_c12_maadi/quran_details/VerseWidget.dart';
import 'package:provider/provider.dart';


class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = "qurandetails";

  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context){
    QuranDetailsArgs args = ModalRoute.of(context)?.settings.arguments as QuranDetailsArgs;
    if(lines.isEmpty){
      loadFile(args.index);
    }
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
              settingsProvider.themeMode == ThemeMode.dark
              ?"assets/images/home_dark_background.png"
              : "assets/images/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name),
        ),
      body: Card(
        child: lines.isEmpty
            ?const Center(child: CircularProgressIndicator(),)
            :Column(
              children: [
                Expanded(
                  child: ListView.separated(
                  itemBuilder: (context, index) =>VerseWidget(
                    verse: lines[index],
                    verseNumber: index+1,
                  ) ,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: lines.length),
                ),
              ],
            ),
      ),
      ),
    );
  }

  add(int n1,int n2){
    return n1+n2;
  }

  List<String>lines = [];

  loadFile(int index)async{
    String fileContent = await rootBundle.loadString("assets/files/${index+1}.txt"); //non-blocking
    lines = fileContent.split("\n");
    setState(() {

    });
  }
}
class QuranDetailsArgs{
  String name;
  int index;
  QuranDetailsArgs({required this.name , required this.index});
}
