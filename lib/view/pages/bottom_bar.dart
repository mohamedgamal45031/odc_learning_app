import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_workshop/viewmodel/bloc/app_state.dart';
import 'package:odc_workshop/viewmodel/bloc/bottom_cubit.dart';

import '../components/core/constants.dart';
class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {} ,
      builder: (context,state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: cubit.currentIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index){
                cubit.changeBottom(index);
              },
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home_outlined),
                  title: Text('Home'),
                  activeColor: mainColor,
                    inactiveColor: Colors.black
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.newspaper_outlined),
                    title: Text('News'),
                    activeColor: mainColor,
                    inactiveColor: Colors.black
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.settings_outlined),
                    title: Text('Settings'),
                    activeColor: mainColor,
                  inactiveColor: Colors.black
                ),
              ],
            )
        );
      },
    );
  }
}