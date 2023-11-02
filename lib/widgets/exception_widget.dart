import 'package:chirpp/pages/blocs/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ExceptionWidget extends StatefulWidget {
  const ExceptionWidget({super.key});

  @override
  State<ExceptionWidget> createState() => _ExceptionWidgetState();
}

class _ExceptionWidgetState extends State<ExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Icon(Icons.wifi_off , size: 100,color: Colors.grey,),
          const Text('Something Went Wrong' , style: TextStyle(color: Colors.black , fontSize: 20),),
          const SizedBox(height: 5,),
          const Text('Check Your Internet Connection And Try Again' , style: TextStyle(color: Colors.black , fontSize: 15),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            BlocProvider.of<SearchBloc>(context).add(
              SizeFetchEvent(),
            );
          }, style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey)), child:const Text('Retry') ,)
        ],
      ),
    );
  }
}