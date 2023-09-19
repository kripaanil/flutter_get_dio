import 'package:flutter/material.dart';
import 'package:super_heros/api.dart';
import 'package:super_heros/model.dart';

void main(List<String> args) {
  runApp(MyApp());
}
  @override


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homescreen(
        
      ),
    );
  }
}

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ApiClass.instance.getProducts();
    });
    
    return  Scaffold(
   
      appBar: AppBar(backgroundColor: Colors.amber,),
      body: ValueListenableBuilder(
        valueListenable: ApiClass.instance.productNotifier,
         builder: (context, List<Superheross> newProduct, _) {
          print("**************$newProduct");
          return ListView.builder(
            
            itemCount: newProduct.length,
            itemBuilder: (context,index){
final product = ApiClass.instance.productNotifier.value[index];
 
                return ListTile(title: Text("${product.name}"),);
               
          });
    }
    
      ) ,
    );
  }
}