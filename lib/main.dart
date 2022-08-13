import 'package:flutter/material.dart';
import 'package:preferencias_usuario/resources/prefs/user_prefs.dart';
import 'package:preferencias_usuario/resources/views/home_view.dart';
import 'package:preferencias_usuario/resources/views/setting_view.dart';

void main() async { 
	WidgetsFlutterBinding.ensureInitialized();
	final prefs = UserPreferences();
	await prefs.initPrefs();

	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	final prefs = UserPreferences();

  	@override
  	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
	  		title: 'Preferencias',
	  		initialRoute: prefs.lastView,
			routes: {
				HomeView.routeName : (BuildContext context) => HomeView(),
				SettingView.routeName : (BuildContext context) => SettingView(),
			},
		);
  	}
}