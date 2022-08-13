import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

	static final UserPreferences _instance = UserPreferences._internal();
	
	factory UserPreferences(){
		return _instance;
	}

	UserPreferences._internal();

	late SharedPreferences _prefs;

	initPrefs() async {
		_prefs = await SharedPreferences.getInstance();
	}
	
	// GET & SET gender
	int get gender {
		return _prefs.getInt('gender') ?? 1;
	}
  
	set gender(int value){
		_prefs.setInt('gender', value);
	}

  // GET & SET secondaryColor
	bool get secondaryColor {
		return _prefs.getBool('secondaryColor') ?? false;
	}
  
	set secondaryColor(bool value){
		_prefs.setBool('secondaryColor', value);
	}

  // GET & SET userName
	String get name {
		return _prefs.getString('name') ?? '';
	}
  
	set name(String value){
		_prefs.setString('name', value);
	}

  // GET & SET lastView
	String get lastView {
		return _prefs.getString('lastView') ?? 'home';
	}
  
	set lastView(String value){
		_prefs.setString('lastView', value);
	}

}