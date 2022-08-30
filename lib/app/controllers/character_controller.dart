import 'package:flutter/cupertino.dart';
import '../data/models/character_model.dart';
import '../data/network/services/api_services.dart';

class CharacterController extends ChangeNotifier {
  bool isLoading = false;
  List<Character> characters = [];
  CharacterController() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    isLoading = true;
    notifyListeners();
    characters = await RemoteServices.fetchCharacters();
    isLoading = false;
    notifyListeners();
  }
}