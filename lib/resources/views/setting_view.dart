import 'package:flutter/material.dart';
import 'package:preferencias_usuario/resources/prefs/user_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:preferencias_usuario/resources/widgets/menu.dart';

class SettingView extends StatefulWidget {
	const SettingView({Key? key}) : super(key: key);

  	static final String routeName = 'setting';

	@override
	State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

	bool? _secondaryColor;
	int? _gender;
	String _name = 'Jesus';

	TextEditingController? _textController;
	
	final prefs = UserPreferences();

	@override
  	void initState() {
		// TODO: implement initState
		super.initState();
		_gender = prefs.gender;
		_secondaryColor = prefs.secondaryColor;
		_name = prefs.name;
		_textController = TextEditingController(text: _name);
		
		prefs.lastView = SettingView.routeName;
  	}

	_setSelectedGender(int? value)  {
		setState(() { 
			prefs.gender = value!;
			_gender = value; 
		}); 
	}

  	@override
  	Widget build(BuildContext context) {
		return Scaffold(
	  		appBar: AppBar(
				title: Text('Ajustes de usuario'),
				backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.purple,
	  		),
	  		drawer: const Menu(),
	  		body: ListView(
				children: [
					Container(
						padding: EdgeInsets.all(5.0),
						child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
					),
					
					Divider(),

					SwitchListTile(
						value: _secondaryColor ?? false, 
						title: Text('Color secundario'), 
						onChanged: (value){
							setState(() {
								_secondaryColor = value;
								prefs.secondaryColor = value;
							});
						}
					),

					RadioListTile<int>(
						value: 1,
						title: Text('Masculino'),
						groupValue: _gender,
						onChanged: _setSelectedGender,
					),

					RadioListTile<int>(
						value: 2,
						title: Text('Femenino'),
						groupValue: _gender,
						onChanged: _setSelectedGender,
					),

					Divider(),

					Container(
						padding: EdgeInsets.symmetric(horizontal: 20.0),
						child: TextField(
							controller: _textController,
							decoration: const InputDecoration(
								labelText: 'Nombre',
								helperText: 'Nombre de la persona usando el telefono',
							),
							onChanged: (value){
								prefs.name = value;
							},
						),
					)
				],
			)
		);
  	}
}