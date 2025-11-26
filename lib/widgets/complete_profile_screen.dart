import 'package:crafts/screens/aadhaar_verification_screen.dart';
import 'package:crafts/widgets/reusable_logo_uploader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/profile/profile_cubit.dart';

import '../widgets/input/app_input.dart';
import '../widgets/input/app_dropdown.dart';
import '../widgets/input/social_input.dart';
import '../widgets/input/gender_selector.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final galleryImages = <String>[];

  final facebookCtrl = TextEditingController();
  final instaCtrl = TextEditingController();
  final linkedCtrl = TextEditingController();

  Future pickImage() async {
    setState(() {
      galleryImages.add("sample.jpg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Complete Profile"),
          centerTitle: true,
        ),

        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  AppInput(
                    label: "Full Name *",
                    hint: "Enter your full name",
                    controller: fullNameController,
                  ),
                  const SizedBox(height: 20),

                  AppInput(
                    label: "Email ID *",
                    hint: "your@email.com",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),

                  AppInput(
                    label: "Phone Number *",
                    hint: "+1 (123) 456-7890",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),

                  AppInput(
                    label: "Alternate Phone",
                    hint: "your@email.com",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),

                  AppInput(
                    label: "MAA Association",
                    hint: "Enter association name",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),

                  // 🎉 Reusable Gender Component
                  GenderSelector(
                    selected: state.gender,
                    onChanged: cubit.setGender,
                  ),
                  const SizedBox(height: 20),

                  AppDropdown(
                    label: "Department *",
                    hint: "Select Department",
                    value: state.department,
                    items: ["IT", "HR", "Finance", "Admin", "Marketing"],
                    onChanged: cubit.setDepartment,
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Company Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  AppInput(
                    label: "Company Name *",
                    hint: "Enter company name",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),
                  AppInput(
                    label: "Company Address *",
                    hint: "Enter company address",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),
                  AppInput(
                    label: "Company Phone",
                    hint: "+1 (123) 456-7890",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),
                  ReusableLogoUploader(
                    title: "Company Logo",
                    hintText: "Tap to upload logo",
                    width: 380,
                    height: 150,
                    onPicked: (file) {
                      if (file != null) print("Logo: ${file.path}");
                    },
                  ),
                  // AppDropdown(
                  //   label: "State *",
                  //   hint: "Select State",
                  //   value: state.department,
                  //   items: [
                  //     "West Bengal",
                  //     "Bihar",
                  //     "Delhi",
                  //     "Tamil Nadu",
                  //     "Karnataka",
                  //     "Uttar Pradesh",
                  //     "Goa",
                  //     "Punjab",
                  //   ],
                  //   onChanged: cubit.setDepartment,
                  // ),
                  const SizedBox(height: 20),
                  AppInput(
                    label: "City/Town *",
                    hint: "Enter city or town",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Media & Links",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Gallery Images",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ...galleryImages.map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image, size: 32),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: const Icon(Icons.add, size: 28),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                  AppInput(
                    label: "Website",
                    hint: "https://yourwebsite.com",
                    controller: userNameController,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Social Media Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  SocialInput(
                    icon: Icons.facebook,
                    label: "Facebook URL",
                    controller: facebookCtrl,
                  ),
                  const SizedBox(height: 12),

                  SocialInput(
                    icon: Icons.camera_alt,
                    label: "Instagram URL",
                    controller: instaCtrl,
                  ),
                  const SizedBox(height: 12),

                  SocialInput(
                    icon: Icons.link,
                    label: "LinkedIn URL",
                    controller: linkedCtrl,
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Profile saved as draft!"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(color: Colors.grey.shade600),
                          ),
                          child: const Text("Save Draft"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AadhaarVerificationScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.purple,
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white, // ✅ FIXED
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
