// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/station_controller.dart';

class MetroTab extends StatefulWidget {
  const MetroTab({super.key});

  @override
  State<MetroTab> createState() => _MetroTabState();
}

class _MetroTabState extends State<MetroTab> {
  var Busstations = Get.put(StationsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Busstations.stations_loading.isTrue
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Busstations.MetroStations.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          "No Bus Station Found",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: Busstations.MetroStations.length,
                    itemBuilder: ((context, index) => Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${Busstations.MetroStations[index]['Name']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black)),
                                Text(
                                    '${Busstations.MetrodistanceList[index].toPrecision(2)}km',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.black)),
                              ],
                            ),
                          ),
                        ))),
          ));
  }
}
