import 'package:flutter/material.dart';
import 'package:preferencias_usuario/resources/prefs/user_prefs.dart';
import 'package:preferencias_usuario/resources/widgets/menu.dart';

class HomeView extends StatelessWidget {
	HomeView({Key? key}) : super(key: key);

	static final String routeName = 'home';
	final prefs = UserPreferences();

	@override
	Widget build(BuildContext context) {

		prefs.lastView = HomeView.routeName;

		return Scaffold(
			appBar: AppBar(
				title: Text('Preferencias de usuario'),
        		backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.purple,
			),
			drawer: Menu(),
			body: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Text('Color secundario: ${prefs.secondaryColor}'),
					Divider(),
					Text('Género: ${ prefs.gender }'),
					Divider(),
					Text('Nombre de usuario: ${prefs.name}'),
				],
			),
		);
	}
}