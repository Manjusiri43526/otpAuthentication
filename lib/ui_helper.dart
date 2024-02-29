import 'package:flutter/material.dart';

class UiHelper {
  static CustomeTextField(TextEditingController controller,String text,IconData iconData, bool toHide){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          )
        ),
      ),
    );
  }

  static CustomeButton(VoidCallback voidCallback,String text, ){
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: (){
          voidCallback();
        },style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
        child: Text(text,style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),),
      ),

    );
  }
  static CustomeAlertBox(BuildContext context,String text){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(text),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("ok",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))
          ],

        ),
    );
  }
}
