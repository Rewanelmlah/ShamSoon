import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/settings/presentation/widgets/custome_text_feild.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, leading: IconButton(
    onPressed: () {
     Navigator.pop(context);    
    },
    icon: Icon(Icons.arrow_back_ios,size: 24.sp,),
      ),
       title:Text("Personal Info",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: EdgeInsets.all(16.w), // استخدم ScreenUtil للحصول على قيمة مرنة
        child: SingleChildScrollView(
          child: Column(
            children: [
               const CustomTextField(
                sufficon: Icons.edit_outlined,
                color: Color(0xFFBFDDD7),
                icon: Icons.account_circle_outlined, label: "Full Name", initialValue: "Alice Cooper"),
              SizedBox(height: 15.h,),
              const CustomTextField(
                sufficon: Icons.edit_outlined,
                color: Color(0xFFBFDDD7),icon: Icons.mail_outline, label: "Email", initialValue: "Alice122@gmail.com"),
              SizedBox(height: 15.h,),
              const CustomTextField(
                sufficon: Icons.edit_outlined,
                color: Color(0xFFBFDDD7),icon: Icons.call_outlined, label: "Phone number", initialValue: "+903432432890"),
             SizedBox(height: 15.h,),
               ],
          ),
        ),
      ),
    );
  }
}

