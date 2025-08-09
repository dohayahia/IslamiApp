import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' hide Radio;
import 'package:islami_c12_maadi/Models/radio_response_model.dart';
import 'package:islami_c12_maadi/widgets/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 6, child: Image.asset('assets/images/radio_image.png')),
        Expanded(
          flex: 4,
          child: FutureBuilder(
            future: getRadios(),
            builder: (context , snapShot) {
              List<Radio> radio =snapShot.data?.radio ?? [];
              if (snapShot.hasData)
              {return ListView.builder(
                itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child:  RadioItem(
                    radio: radio[index],),
                ),
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemCount: radio.length,
              );
              }else if (snapShot.hasError){
                return const Center(child: Text("something went wrong"));
              }else{
                return Center(child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
                );
              }

            }
          ),
        ),
      ],
    );
  }
}

 Future<RadioResponse> getRadios() async{
   Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios");
   final response = await http.get(uri);


   if (response.statusCode == 200) {
   var json = jsonDecode(response.body);
   RadioResponse radioResponse = RadioResponse.fromJson(json);

   return radioResponse;
   }else{
     throw Exception("something went wrong!");
   }
}

