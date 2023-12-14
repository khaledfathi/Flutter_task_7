import 'package:flutter/material.dart';

class EventViewBox extends StatelessWidget {
  const EventViewBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 87, 34, 1),
              Color.fromRGBO(255, 144, 93, 1)
            ]),
      ),
      child: Column(
        children: [
          //bar
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Watch youtube',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //divider
          const Divider(
            color: Colors.white,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          //box body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15 , left: 10 , bottom: 8),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.date_range_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Jue 11 , 2022', style: _eventBoxTextStyle(),),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('10:25' , style: _eventBoxTextStyle(),),
                    )
                  ],
                )
              ],
                        ),
            )),
        ],
      ),
    );
  }

  TextStyle _eventBoxTextStyle (){
    return TextStyle(
      fontSize: 18, 
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ); 
  }
}
