import 'package:flutter/material.dart';

/*
* Note:
* I have Created all required data and and color in variables
* just changes the data in variable it will change the ui
* */

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  // Todo : Change Colors from Here
  /// Text Color
  Color textColor = const Color(0xff97a1ab);

  /// Primary Color
  Color primaryColor = Colors.white;

  /// Secondary Color
  Color secondaryColor = Colors.blueAccent;

  /// Background Color
  Color backgroundColor = const Color(0xfff1f4f9);

  /// Avatar Background Color
  Color avatarBackgroundColor = const Color(0xfff3f4f6);

  /// Selected Avatar Background Color
  Color selectedAvatarBackgroundColor = Colors.blueAccent.withOpacity(0.2);

  //59b0a7

  // Todo : Change Popular City Data from Here
  /// List Of Popular Cities
  List<PopularCity> popularCityList = [
    PopularCity(title: "Delhi-NCR", image: "assets/delhi.png"),
    PopularCity(title: "Hyderabad", image: "assets/hyderabad.png"),
    PopularCity(title: "Bangalore", image: "assets/bangalore.png"),
    PopularCity(title: "Mumbai", image: "assets/mumbai.png"),
    PopularCity(title: "Chennai", image: "assets/chennai.png"),
    PopularCity(title: "Pune", image: "assets/pune.png"),
  ];

  /// Selected Popular City
  PopularCity? selectedCity;

  /// Other Cities List
  List<String> otherCitiesList = [
    "Goa",
    "Ahmedabad",
    "Bhubaneshwar",
    "Chandigarh",
    "Coimbatore"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      /// *** App Bar *** ///
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          "Select City",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// *** Popular Cities Title *** ///
            Text(
              "Popular Cities",
              style: Theme.of(context).textTheme.titleLarge?.copyWith( fontWeight: FontWeight.w500, color: textColor),
            ),
            /// *** Popular Cities Gird *** ///
            GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: popularCityList
                    .map(
                      (item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedCity == item) {
                              selectedCity = null;
                            } else {
                              selectedCity = item;
                            }
                          });
                        },
                        child: Card(
                          elevation: 2,
                          color: primaryColor,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 2,
                                    color: selectedCity == item
                                        ? secondaryColor
                                        : Colors.transparent)),
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: selectedCity == item
                                      ? selectedAvatarBackgroundColor
                                      : avatarBackgroundColor,
                                  backgroundImage: AssetImage(
                                    item.image,
                                  ),
                                  child: ClipOval(
                                      child: Image.asset(item.image,
                                          color: selectedCity == item
                                              ? secondaryColor
                                              : Colors.black)),
                                ),
                                Text(
                                  item.title,
                                  style:Theme.of(context).textTheme.titleMedium?.copyWith( color: selectedCity == item
                                      ? secondaryColor
                                      : Colors.black,)),

                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()),
            const SizedBox(
              height: 20,
            ),
            /// *** Other Cities Title *** ///
            Text(
              "Other Cities",
              style: Theme.of(context).textTheme.titleLarge?.copyWith( fontWeight: FontWeight.w500, color: textColor),

            ),
            const SizedBox(
              height: 20,
            ),
            /// *** Other Cities List *** ///
            Card(
                elevation: 2,
                color: primaryColor,
                child: Column(
                    children: otherCitiesList
                        .map(
                          (element) => GestureDetector(
                            onTap: (){},
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300))),
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                element,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                        .toList()))
          ],
        ),
      ),
    );
  }
}

/// Model Class For PopularCity
class PopularCity {
  final String title;
  final String image;
  PopularCity({required this.title, required this.image});
}
