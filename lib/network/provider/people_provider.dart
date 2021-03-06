import 'dart:convert';
import 'package:bedouin/models/user_choise.dart';
import 'package:bedouin/network/models/autogenerated.dart';
import 'package:bedouin/network/models/result.dart';
import 'package:http/http.dart' as http;

class PersonProvider {
  static const String peopleEndpoint = 'https://randomuser.me/api/';

  Future<Results> getRandomPerson(PersonGenders gender, String country) async {
    String gen = getGender(gender);
    String countr = country;
    http.Response response = await http.get('$peopleEndpoint?gender=$gen&nat=$countr');
    print(response.statusCode);
    dynamic jsonResult = json.decode(response.body);
    Autogenerated autogenerated = Autogenerated.fromJson(jsonResult);
    return autogenerated.results.first;
  }
  String getCountry(Countries country){
    switch(country){
      case Countries.australia: return 'AU';
      case Countries.brazil: return 'BR';
      case Countries.canada: return 'CA';
      case Countries.switzerland: return 'CH';
      case Countries.germany : return 'DE';
      case Countries.denmark: return 'DK';
      case Countries.spain : return 'ES';
      case Countries.finland : return 'FI';
      case Countries.france: return 'FR';
      case Countries.greatBritain: return 'GB';
      case Countries.ireland: return 'IE';
      case Countries.iran: return 'IR';
      case Countries.norway: return 'NO';
      case Countries.netherlands: return 'NL';
      case Countries.newzealand: return 'NZ';
      case Countries.turkey: return 'TR';
      case Countries.unitedstates: return 'US';
    }
    throw Exception('Invalid country');
  }
  String getGender(PersonGenders gender) {
    if (gender == PersonGenders.male) {
      return 'male';
    } else if (gender == PersonGenders.female) {
      return 'female';
    }
    throw Exception('Invalid gender');
  }
}
