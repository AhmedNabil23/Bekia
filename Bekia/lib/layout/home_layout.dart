import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logeen/shared/components/components.dart';
import 'package:logeen/shared/cubit/cubit.dart';
import 'package:logeen/shared/cubit/states.dart';

 class HomeLayout extends StatelessWidget {

   //عشان اعمل validation
   var scaffoldKay = GlobalKey<ScaffoldState>();
   var formKey = GlobalKey<FormState>();


   var nameController = TextEditingController();
   var permissionsController = TextEditingController();
   var statusController = TextEditingController();


   @override
   Widget build(BuildContext context) {
     return
       BlocProvider(
           create: (BuildContext context) => AppCubit(),
           child: BlocConsumer<AppCubit, AppStates>(
               listener: (BuildContext context, AppStates state) {

               },
               builder: (BuildContext context, AppStates state) {
                 return Scaffold(
                     key: scaffoldKay,
                     appBar: AppBar(
                       title:
                       Text('Bekia'),
                     ),
                     body:
                     state is! AppGetDatabaseLoadingState ? AppCubit
                         .get(context)
                         .screens[AppCubit
                         .get(context)
                         .currentIndex] : CircularProgressIndicator(),

                     bottomNavigationBar: BottomNavigationBar(
                     type: BottomNavigationBarType.fixed,
                     currentIndex: AppCubit.get(context).currentIndex,
                     onTap: (index)
                     {
                       AppCubit.get(context).ChangeIndex(index);

                     },
                     items:[
                       BottomNavigationBarItem(
                         icon: Icon(Icons.folder_shared_outlined),
                         label: 'Informations',
                       ),
                       BottomNavigationBarItem(
                         icon: Icon(Icons.fastfood_rounded),
                         label: 'Organic',
                       ),
                       BottomNavigationBarItem(
                         icon: Icon(Icons.local_drink_rounded),
                         label: 'Nonorganic',
                       ),

                     ],
                   ),
                    drawer: Drawer(
                     child: ListView(
                       padding: EdgeInsets.zero,
                       children:[
                         //for list view
                         UserAccountsDrawerHeader(
                           accountName: Text("user 1"),
                           accountEmail: Text("bekia@gmail.com"),
                           currentAccountPicture: CircleAvatar(
                             backgroundColor: Colors.green,
                             child: Text(
                               "B",
                               style: TextStyle(fontSize: 40.0),
                             ),
                           ),
                         ),
                         //for paypal
                         MaterialButton(
                           onPressed: (){},
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.paypal_outlined,
                               color: Colors.grey,

                               ),
                             ],
                           ),


                         ),

                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             //for settings
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 8),
                               child: Row(
                                 children: [
                                   Expanded(
                                       child: Text(
                                         "Settings",
                                         style: TextStyle(
                                             fontWeight:FontWeight.bold,
                                             fontSize: 20),
                                       )),
                                   MaterialButton(
                                     onPressed: (){},
                                     child: Icon(Icons.settings,
                                       color: Colors.grey,
                                       size: 30,
                                     ),


                                   ),

                                 ],
                               ),
                             ),
                             //for logout
                             Row(
                               children: [
                                 Expanded(
                                     child: Text(
                                       "Log out",
                                       style: TextStyle(
                                           fontWeight:FontWeight.bold,
                                           fontSize: 20),
                                     )),
                                 MaterialButton(
                                   onPressed: (){},
                                   child: Icon(Icons.logout_outlined,
                                     color: Colors.grey,
                                     size: 30,
                                   ),


                                 ),

                               ],
                             )
                           ],
                           ),
                         ),

                       ],
                     ),

                   ),
                 );
               }
           )
       );
   }
 }
