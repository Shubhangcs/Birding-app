// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../register_bloc/bloc/register_bloc.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController _firstNameController = TextEditingController();
//   TextEditingController _lastNameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _otpController = TextEditingController();
//   bool _isPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFA4BE7B),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 "Register",
//                 style: GoogleFonts.varelaRound(
//                     color: const Color(0xFF285430),
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: Image.asset(
//                   'images/register-page.png',
//                   width: 200,
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               BlocBuilder<RegisterBloc, RegisterState>(
//                 builder: (context, state) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30),
//                     child: TextField(
//                       controller: _firstNameController,
//                       keyboardType: TextInputType.name,
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color(0xFFE5D9B6),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           hintText: 'First Name',
//                           hintStyle: const TextStyle(color: Color(0xFF285430)),
//                           errorText: (state is RegisterFirstNameErrorState)
//                               ? state.errorMessage
//                               : null),
//                       onSubmitted: (value) {
//                         BlocProvider.of<RegisterBloc>(context).add(
//                           RegisterFirstNameTextChangedEvent(
//                               firstName: _firstNameController.text),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//               BlocBuilder<RegisterBloc, RegisterState>(
//                 builder: (context, state) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(left: 30, right: 30, top: 20),
//                     child: TextField(
//                       controller: _lastNameController,
//                       keyboardType: TextInputType.name,
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color(0xFFE5D9B6),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           hintText: 'Last Name',
//                           hintStyle: const TextStyle(color: Color(0xFF285430)),
//                           errorText: (state is RegisterLastNameErrorState)
//                               ? state.errorMessage
//                               : null),
//                       onSubmitted: (value) {
//                         BlocProvider.of<RegisterBloc>(context).add(
//                           RegisterLastNameTextChangedEvent(
//                               lastName: _lastNameController.text),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//               BlocBuilder<RegisterBloc, RegisterState>(
//                 builder: (context, state) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(left: 30, right: 30, top: 20),
//                     child: TextField(
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFE5D9B6),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: 'Email',
//                         errorText: (state is RegisterEmailErrorState)
//                             ? state.errorMessage
//                             : null,
//                         hintStyle: const TextStyle(
//                           color: Color(0xFF285430),
//                         ),
//                       ),
//                       onSubmitted: (value) {
//                         BlocProvider.of<RegisterBloc>(context).add(
//                           RegisterEmailTextChangedEvent(
//                               emailValue: _emailController.text),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//               BlocBuilder<RegisterBloc, RegisterState>(
//                 builder: (context, state) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(left: 30, right: 30, top: 30),
//                     child: TextField(
//                       controller: _passwordController,
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFE5D9B6),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: 'Password',
//                         hintStyle: const TextStyle(color: Color(0xFF285430)),
//                         errorText: (state is RegisterPasswordErrorState)
//                             ? state.errorMessage
//                             : null,
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               _isPassword = !_isPassword;
//                             });
//                           },
//                           icon: _isPassword
//                               ? const Icon(
//                                   Icons.remove_red_eye,
//                                   color: Color(0xFF285430),
//                                 )
//                               : const Icon(
//                                   Icons.remove_red_eye_outlined,
//                                   color: Color(0xFF285430),
//                                 ),
//                         ),
//                       ),
//                       obscureText: _isPassword,
//                       onSubmitted: (value) {
//                         BlocProvider.of<RegisterBloc>(context).add(
//                             RegisterPasswordTextChangedEvent(
//                                 passwordValue: _passwordController.text));
//                       },
//                     ),
//                   );
//                 },
//               ),
//               BlocListener<RegisterBloc, RegisterState>(
//                 listener: (context, state) {
//                   if (state is RegisterOtpState) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return Center(
//                             child: Container(
//                               width: 300,
//                               height: 300,
//                               child: Card(
//                                 color: const Color(0xFFA4BE7B),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     const Text(
//                                       'OTP',
//                                       style: TextStyle(
//                                           color: Color(0xFF285430),
//                                           fontSize: 25,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const Text(
//                                       'An otp has been sent to your Email id',
//                                       style:
//                                           TextStyle(color: Color(0xFF285430)),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 30, right: 30),
//                                       child: TextField(
//                                         controller: _otpController,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                             hintText: 'OTP',
//                                             errorText: (state is RegisterOtpTextChangedErrorState)?"Enter a Valid otp":null,
//                                             filled: true,
//                                             fillColor: const Color(0xFFE5D9B6)),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         if(state is  RegisterOtpTextChangedErrorState){
                                          
//                                         }else{
//                                           registerUserOtp();
//                                           Navigator.pop(context);
//                                         } 
//                                       },
//                                       style: const ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStatePropertyAll(
//                                           Color(0xFF285430),
//                                         ),
//                                       ),
//                                       child: const Text('Verify'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         });
//                   } else if (state is RegisterLoadingState) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return const Center(
//                             child: CircularProgressIndicator(
//                               color: Color(0xFFA4BE7B),
//                             ),
//                           );
//                         });
//                   }else if(state is RegisterSuccessState){
//                     Navigator.pop(context);
//                     Navigator.pushReplacementNamed(context, "/login");
//                   }else if(state is RegisterFailedState){
//                     Navigator.pop(context);
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage , style:const TextStyle(color: Colors.black),), behavior: SnackBarBehavior.floating , backgroundColor: Colors.white , elevation: 5 , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),);
//                   }else if(state is RegisterOtpFailedState){
//                     Navigator.pop(context);
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage , style:const TextStyle(color: Colors.black),),behavior: SnackBarBehavior.floating , backgroundColor: Colors.white , elevation: 5 , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),);
//                   }
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
//                   child: SizedBox(
//                     width: double.maxFinite,
//                     height: 55,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         registerUser();
//                       },
//                       style: const ButtonStyle(
//                         backgroundColor:
//                             MaterialStatePropertyAll(Color(0xFF285430)),
//                       ),
//                       child: Text(
//                         'Register',
//                         style: GoogleFonts.varelaRound(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Already have an Account?',
//                       style: TextStyle(color: Color(0xFF285430)),
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     GestureDetector(
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                       onTap: () {
//                         Navigator.pushReplacementNamed(context, "/login");
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
    
//   }

//   Future<void> registerUserOtp() async {
//     BlocProvider.of<RegisterBloc>(context).add(
//       RegisterOtpEvent(
//         firstName: _firstNameController.text,
//         lastName: _lastNameController.text,
//         email: _emailController.text,
//         password: _passwordController.text,
//         otp: _otpController.text
//       ),
//     );
//   }

//     Future<void> registerUser() async {
//     BlocProvider.of<RegisterBloc>(context).add(
//       RegisterSubmitEvent(
//         firstName: _firstNameController.text,
//         lastName: _lastNameController.text,
//         email: _emailController.text,
//         password: _passwordController.text,
//       ),
//     );
//   }

//   Future<void> disposeController() async {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }
// }
