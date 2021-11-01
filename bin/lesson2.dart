abstract class Vehicle { // abstract is used for restrict creating an obj of this class
  final String? manufacturer;
  final double? fuelCapacity;
  double? fuelRemaining;

  static const double pi = 3.14; // main() { pi = Vehicle.pi; } (without creating an obj)
  static void sayHello() {
    print('Hello');
  }

  String showInfo() {
    return '$manufacturer: $fuelRemaining of $fuelCapacity (critical: $criticalFuelLevel)';
  }

  double get criticalFuelLevel => fuelCapacity! * 0.1;
  set newFuelRemaining(double val) => fuelRemaining = val;

  // default constructor
  Vehicle({this.manufacturer, this.fuelCapacity, this.fuelRemaining});

  // named constructor
  // Vehicle.fromMap(Map<String, String> map) {
  //   this.manufacturer = map['manufacturer'];
  //   this.fuelCapacity = double.parse(map['fuelCapacity'] as String);
  //   this.fuelRemaining = double.parse(map['fuelRemaining'] as String);
  // }

  // Initializer list
  Vehicle.fromMap2(Map<String, String> map)
  : this.manufacturer = map['manufacturer'],
    this.fuelCapacity = double.parse(map['fuelCapacity'] as String)
    {
      this.fuelRemaining = double.parse(map['fuelRemaining'] as String);
    }
  // 1) Initializer list
  // 2) Base class default constructor
  // 3) Default constructor

  // Factory constructor
  // factory Vehicle.build(bool isBMW) {
  //   return isBMW ? Vehicle(manufacturer: 'BMW', fuelCapacity: 55, fuelRemaining: 10) :
  //   Vehicle(manufacturer: 'Honda', fuelCapacity: 50, fuelRemaining: 10);
  // }

  // Abstract method
  void move();
}

// Inheritance extends
class Car extends Vehicle {
  final int? _seats;

  Car(this._seats, Map<String, String> map) : super.fromMap2(map);


  @override
  void move() {
    print('I can ride!'); // TODO: implement move
  }
}

// Implicit interfaces
class Rocket with Spaceship implements Vehicle {
  @override
  final String? manufacturer;
  @override
  final double? fuelCapacity;
  @override
  double? fuelRemaining;

  Rocket(this.manufacturer, this.fuelCapacity, this.fuelRemaining);


  @override
  double get criticalFuelLevel => fuelCapacity! * 0.3;
  @override
  set newFuelRemaining(double val) => fuelRemaining = val;

  @override
  String showInfo() {
    return 'The Rocket runs on ${fuelRemaining! / fuelCapacity! * 100}% of fuel';
  }

  @override
  void move() {
    print('I can fly!');
  }
  // Callable class
  void call(String? message) {
    print(message);
  }
}

// Mixin
mixin Spaceship{
  bool? isInterspace;
  void leaveOrbit() {
    print('I can leave Earth Orbit');
  }
}

class Color {
  final int? colorCode;
  const Color({this.colorCode});
}


void main() {
  // var vehicle = Vehicle(manufacturer: 'BMW', fuelCapacity: 55, fuelRemaining: 10);
  // vehicle.newFuelRemaining = 20;
  //
  // var vehicle2 = Vehicle.fromMap2({
  //                                 'manufacturer': 'KIA',
  //                                 'fuelCapacity': '50',
  //                                 'fuelRemaining': '0'
  //                                });
  //
  // var vehicle3 = Vehicle.build(true);

  // Vehicle.sayHello();
  // print(vehicle3.showInfo());
  var rocket = Rocket('Nasa', 5000, 3000);
  rocket.move();
  print(rocket.showInfo());
  rocket.leaveOrbit();
  rocket('Go!');
  var color = const Color(colorCode: 0x16ff15);
  print(color.colorCode);
}
