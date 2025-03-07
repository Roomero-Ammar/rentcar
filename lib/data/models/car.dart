class Car {
  final String? image;
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car( {this.image,required this.model, required this.distance, required this.fuelCapacity, required this.pricePerHour});

factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      image: map['image'],
      model: map['model'],
      distance: map['distance'],
      fuelCapacity: map['fuelCapacity'],
      pricePerHour: map['pricePerHour']
    );
  }

}