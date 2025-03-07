import 'package:flutter/material.dart';
import 'package:rentcar/data/models/car.dart';
import 'package:rentcar/presentation/pages/maps_details_page.dart';
import 'package:rentcar/presentation/widgets/car_card.dart';
import 'package:rentcar/presentation/widgets/more_card.dart';

class CardDetailsPage extends StatefulWidget {
  final Car car;

  const CardDetailsPage({super.key, required this.car});

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(' Information')],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(
              car:  Car(
                         image: widget.car.image??'assets/car_image.png',
                          model: widget.car.model,
                          distance: widget.car.distance ,
                          fuelCapacity: widget.car.fuelCapacity,
                          pricePerHour: widget.car.pricePerHour,
                          ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5)
                          ],),
                          child: Column(children: [
                            CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/user.png'),),
                          SizedBox(height: 10,),
                          Text('Jane Cooper',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('\$4,253',style: TextStyle(color: Colors.grey),),
                          ],
                          ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapsDetailsPage(
                              car: widget.car
                              ),),
                        );
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 5
                              )
                            ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/maps.png',fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding:EdgeInsets.all(20),
              child: Column(
                children: [
                  MoreCard(car: 
                  Car(
                          model: "${widget.car.model}-1",
                          distance: widget.car.distance + 100 ,
                          fuelCapacity: widget.car.fuelCapacity + 150,
                          pricePerHour: widget.car.pricePerHour + 10,
                          ),
                  ),
                  
            SizedBox(
              height: 5,
            ),
                   MoreCard(car: 
                 Car(
                              model: "${widget.car.model}-2",
                          distance: widget.car.distance + 200 ,
                          fuelCapacity: widget.car.fuelCapacity + 250,
                          pricePerHour: widget.car.pricePerHour + 20,
                      ),
                  ),
                  SizedBox(
              height: 5,
            ),
                   MoreCard(car: 
                  Car(
                            model: "${widget.car.model}-3",
                          distance: widget.car.distance + 300 ,
                          fuelCapacity: widget.car.fuelCapacity + 350,
                          pricePerHour: widget.car.pricePerHour + 30,
                        ),
                  ),
                   SizedBox(
              height: 5,
            ),
                   MoreCard(car: 
                  Car(
                            model: "${widget.car.model}-3",
                          distance: widget.car.distance + 300 ,
                          fuelCapacity: widget.car.fuelCapacity + 350,
                          pricePerHour: widget.car.pricePerHour + 30,
                        ),
                  ),
                   SizedBox(
              height: 5,
            ),
                   MoreCard(car: 
                  Car(
                            model: "${widget.car.model}-3",
                          distance: widget.car.distance + 300 ,
                          fuelCapacity: widget.car.fuelCapacity + 350,
                          pricePerHour: widget.car.pricePerHour + 30,
                        ),
                  ),
                   SizedBox(
              height: 5,
            ),
                   MoreCard(car: 
                  Car(
                            model: "${widget.car.model}-3",
                          distance: widget.car.distance + 300 ,
                          fuelCapacity: widget.car.fuelCapacity + 350,
                          pricePerHour: widget.car.pricePerHour + 30,
                        ),
                  ),
                ],
              ),
            ),
                
                ],
              ),
      ),
            
    );
  }
}