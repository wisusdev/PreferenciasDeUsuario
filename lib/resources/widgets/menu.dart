import 'package:flutter/material.dart';
import 'package:preferencias_usuario/resources/views/home_view.dart';
import 'package:preferencias_usuario/resources/views/setting_view.dart';

class Menu extends StatelessWidget {
  	const Menu({Key? key}) : super(key: key);

  	@override
  	Widget build(BuildContext context) {
    	return Drawer(
			child: ListView(
				padding: EdgeInsets.zero,
				children: [
					DrawerHeader(
						margin: EdgeInsets.zero,
						padding: EdgeInsets.zero,
						decoration: BoxDecoration(
				 			image: DecorationImage(
								fit: BoxFit.fill,
						 		image:  AssetImage('assets/img/menu-img.jpeg')
							)
						),
		 				child: Stack(children: <Widget>[
			 				Positioned(
					 			bottom: 12.0,
					 			left: 16.0,
					 			child: Text("Welcome to Flutter",
							 	style: TextStyle(
									color: Colors.white,
									fontSize: 20.0,
									fontWeight: FontWeight.w500))),
		 				])
					),

					ListTile(
						leading: Icon(Icons.pages, color: Colors.blue,),
						title: Text('Home'),
						onTap: () => Navigator.pushReplacementNamed(context, HomeView.routeName),
					),

					ListTile(
						leading: Icon(Icons.people, color: Colors.blue,),
						title: Text('People'),
						onTap: (){},
					),

					ListTile(
						leading: Icon(Icons.settings, color: Colors.blue,),
						title: Text('Settings'),
						onTap: (){ 
							Navigator.pushReplacementNamed(context, SettingView.routeName);
						}
					),
				],
			),
		);
  	}
}