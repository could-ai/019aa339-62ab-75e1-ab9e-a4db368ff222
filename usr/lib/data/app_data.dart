import 'package:flutter/material.dart';

class AppData {
  static final List<Province> provinces = [
    Province(
      name: 'Punjab',
      cities: [
        'Lahore', 'Faisalabad', 'Multan', 'Rawalpindi', 'Gujranwala',
        'Sialkot', 'Bahawalpur', 'Sargodha', 'Sheikhupura'
      ],
      icon: Icons.location_city,
      color: Colors.green.shade800,
    ),
    Province(
      name: 'Sindh',
      cities: [
        'Karachi', 'Hyderabad', 'Sukkur', 'Larkana', 'Nawabshah',
        'Mirpurkhas', 'Khairpur', 'Shikarpur', 'Jacobabad'
      ],
      icon: Icons.waves,
      color: Colors.blue.shade800,
    ),
    Province(
      name: 'Khyber Pakhtunkhwa',
      cities: [
        'Peshawar', 'Mardan', 'Abbottabad', 'Kohat', 'D.I. Khan',
        'Swat', 'Charsadda', 'Bannu', 'Mingora'
      ],
      icon: Icons.landscape,
      color: Colors.teal.shade800,
    ),
    Province(
      name: 'Balochistan',
      cities: [
        'Quetta', 'Gwadar', 'Turbat', 'Khuzdar', 'Chaman',
        'Sibi', 'Zhob', 'Mastung', 'Panjgur'
      ],
      icon: Icons.terrain,
      color: Colors.brown.shade800,
    ),
    Province(
      name: 'Islamabad',
      cities: [], // Direct to categories
      icon: Icons.star,
      color: Colors.indigo.shade800,
    ),
  ];

  static final List<CategoryItem> categories = [
    CategoryItem('Hospitals', Icons.local_hospital, Colors.redAccent),
    CategoryItem('Schools', Icons.school, Colors.orangeAccent),
    CategoryItem('Colleges', Icons.account_balance, Colors.amber),
    CategoryItem('Universities', Icons.school_outlined, Colors.deepPurpleAccent),
    CategoryItem('Shopping Malls', Icons.shopping_bag, Colors.pinkAccent),
    CategoryItem('Restaurants', Icons.restaurant, Colors.deepOrange),
    CategoryItem('Police Stations', Icons.local_police, Colors.blueGrey),
    CategoryItem('Fire Brigade', Icons.local_fire_department, Colors.red),
    CategoryItem('Ambulance Service', Icons.medical_services, Colors.redAccent),
    CategoryItem('Airports', Icons.flight, Colors.blue),
  ];
}

class Province {
  final String name;
  final List<String> cities;
  final IconData icon;
  final Color color;

  Province({
    required this.name,
    required this.cities,
    required this.icon,
    required this.color,
  });
}

class CategoryItem {
  final String name;
  final IconData icon;
  final Color color;

  CategoryItem(this.name, this.icon, this.color);
}
