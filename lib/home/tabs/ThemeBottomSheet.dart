import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import 'SelectedItem.dart';
import 'UnselectedItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem(settingsProvider.themeMode == ThemeMode.dark
              ?AppLocalizations.of(context)!.dark
              :AppLocalizations.of(context)!.light),
          const SizedBox(height: 20,),
          InkWell(
              onTap: (){
                if(settingsProvider.themeMode == ThemeMode.light){
                  settingsProvider.changeTheme(ThemeMode.dark);
                }else{
                  settingsProvider.changeTheme(ThemeMode.light);
                }
                Navigator.of(context).pop();
              },
              child: UnselectedItem(settingsProvider.themeMode != ThemeMode.dark
                  ?AppLocalizations.of(context)!.dark
                  :AppLocalizations.of(context)!.light))
        ],
      ),
    );
  }
}
