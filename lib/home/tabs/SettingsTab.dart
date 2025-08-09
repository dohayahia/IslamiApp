
import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/ThemeBottomSheet.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import 'LanguageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) =>const LanguageBottomSheet(),);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color:Theme.of(context).colorScheme.tertiary,
                      width: 2
                  )
              ),
              child: Text(settingsProvider.language=="ar"
                  ?"العربية"
                  :"English",style: const TextStyle(
                  fontSize: 20
              )),
            ),
          ),
          const SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.theme,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=>const ThemeBottomSheet());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: 2
                  )
              ),
              child: Text(settingsProvider.themeMode==ThemeMode.dark
                  ?AppLocalizations.of(context)!.dark
                  :AppLocalizations.of(context)!.light,style: const TextStyle(
                  fontSize: 20
              )),
            ),
          )
        ],
      ),
    );
  }
}
