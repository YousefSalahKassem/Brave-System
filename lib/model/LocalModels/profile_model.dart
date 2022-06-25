import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountModel{
  String name;
  IconData icon;
  AccountModel(this.name, this.icon);
}

class SettingsModel{
  String name;
  IconData icon;
  SettingsModel(this.name, this.icon);
}

List<AccountModel> options=[
  AccountModel('My Cart', Icons.shopping_cart),
  AccountModel('My Bookings', Icons.bookmark),
  AccountModel('My Orders', FontAwesomeIcons.receipt),
  AccountModel('Tournaments', FontAwesomeIcons.medal),
];

List<SettingsModel> settings =[
  SettingsModel('Edit Information', Icons.person),
  SettingsModel('Light Mode', Icons.light_mode),
  SettingsModel('Language', Icons.language),
];