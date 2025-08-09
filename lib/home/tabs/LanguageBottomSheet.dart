import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/SelectedItem.dart';
import 'package:islami_c12_maadi/home/tabs/UnselectedItem.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem(settingsProvider.language=="ar"
              ? "العربية"
              :"English"),
          const SizedBox(height: 20,),
          InkWell(
              onTap: (){
                if(settingsProvider.language=="ar"){
                  settingsProvider.changeLanguage("en");
                }else{
                  settingsProvider.changeLanguage("ar");
                }
                Navigator.of(context).pop();
              },
              child: UnselectedItem(settingsProvider.language=="ar"
                  ?"English"
                  :"العربية"))
        ],
      ),
    );
  }
}
