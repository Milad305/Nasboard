import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/widgets/maincustomappbar.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';

class Payment extends StatefulWidget {
  static const routeName = '/payment';

  @override
  _PaymentState createState() => _PaymentState();
}

FocusNode myFocusNode = new FocusNode();

class _PaymentState extends State<Payment> {
  bool _value =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.darkgrey,
      body: Container(
        child:Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .17,
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(

                        child:Text(
                          "مجموع خرید:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ) ,

                        margin: EdgeInsets.only(right: 20,top: 20),
                      ),
                      Spacer(),
                      Container(

                        child:Text(
                          "200,000 تومان",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ) ,

                        margin: EdgeInsets.only(left: 20,top: 18),
                      ),

                    ],
                  ),
                  SizedBox(height:5),
                  Row(
                    children: [
                      Container(

                        child:Text(
                          "تعداد محصول:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ) ,

                        margin: EdgeInsets.only(right: 20,top: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Spacer(),
                      Container(

                        child:Text(
                          "5 ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ) ,

                        margin: EdgeInsets.only(left: 20,top: 18),
                      ),

                    ],
                  ),

                ],

              ),

            ),
         ///Form
         Expanded(child:Container(
             height: MediaQuery.of(context).size.height*.772,
             margin: EdgeInsets.only(top: 5),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                   topLeft:Radius.circular(20),
                   topRight: Radius.circular(20)
               ),



             ),
             width: MediaQuery.of(context).size.width,
             padding: EdgeInsets.only(right: 40, left: 40, top: 10),
             child:SingleChildScrollView(
               scrollDirection: Axis.vertical,
               child:  Column(
                 children: [
                   Padding(
                     padding: EdgeInsets.only(top: 10),
                   ),
                   Theme(
                     data: Theme.of(context).copyWith(

                       primaryColor: LightColor.grey,
                     ),
                     child:TextFormField(
                       cursorColor: Theme.of(context).cursorColor,
                       keyboardType: TextInputType.name,

                       decoration: InputDecoration(
                         icon: Icon(Icons.person,),

                         labelText: 'نام و نام خانوادگی',
                         labelStyle: TextStyle(
                           color: LightColor.orange,
                         ),

                         // suffixIcon: Icon(

                         // ),
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: LightColor.orange),
                         ),
                         focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: LightColor.grey)
                         ),

                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Theme(
                     data: Theme.of(context).copyWith(

                       primaryColor: LightColor.grey,
                     ),
                     child:TextFormField(
                       cursorColor: Theme.of(context).cursorColor,


                       decoration: InputDecoration(
                         icon: Icon(Icons.home,),

                         labelText: 'آدرس',
                         labelStyle: TextStyle(
                           color: LightColor.orange,
                         ),

                         // suffixIcon: Icon(

                         // ),
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: LightColor.orange),
                         ),
                         focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: LightColor.grey)
                         ),

                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Theme(
                     data: Theme.of(context).copyWith(

                       primaryColor: LightColor.grey,
                     ),
                     child:TextFormField(
                       cursorColor: Theme.of(context).cursorColor,
                       keyboardType: TextInputType.number,

                       decoration: InputDecoration(
                         icon: Icon(Icons.location_on,),

                         labelText: 'کدپستی',
                         labelStyle: TextStyle(
                           color: LightColor.orange,
                         ),

                         // suffixIcon: Icon(

                         // ),
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: LightColor.orange),
                         ),
                         focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: LightColor.grey)
                         ),

                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Theme(
                     data: Theme.of(context).copyWith(

                       primaryColor: LightColor.grey,
                     ),
                     child:TextFormField(
                       cursorColor: Theme.of(context).cursorColor,
                       keyboardType: TextInputType.number,

                       decoration: InputDecoration(
                         icon: Icon(Icons.phone,),

                         labelText: 'شماره تماس',
                         labelStyle: TextStyle(
                           color: LightColor.orange,
                         ),

                         // suffixIcon: Icon(

                         // ),
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: LightColor.orange),
                         ),
                         focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: LightColor.grey)
                         ),

                       ),
                     ),
                   ),
                   SizedBox(height: 50,),
                   Row(
                     children: [
                       Text(
                         "نحوه پرداخت:",
                         style: TextStyle(
                             fontSize: 17,
                             fontWeight: FontWeight.bold,
                             color: LightColor.lightblack
                         ),
                       ),
                       Text(
                         " درگاه بانک ملت",
                         style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                             color: LightColor.orange
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           setState(() {
                             _value = true;//!_value;
                           });
                         },
                         child: Container(
                           margin: EdgeInsets.only(right: 30),
                           decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                           child: Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: _value
                                 ? Icon(
                               Icons.check,
                               size: 20.0,
                               color: Colors.white,
                             )
                                 : Icon(
                               Icons.check_box_outline_blank,
                               size: 30.0,
                               color: Colors.blue,
                             ),
                           ),
                         ),
                       )
                     ],
                   ),


                   SizedBox(
                     height: 40,
                   ),
                   FlatButton(

                     onPressed: (){
                       print("clicked");
                     },
                     height: 50,
                     minWidth: 120,

                     color: LightColor.orange,
                     child: Text(
                       "پرداخت",
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                       ),
                     ),

                   ),
                   SizedBox(height: 100,)

                 ],

               ),
             ) ,

         )
         ),


      ]
        )
                ),

      appBar:CustomAppBar("سبدخرید",LightColor.darkgrey),

    );
  }
}
