import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmiot/constants.dart';
import 'package:hmiot/models/api.dart';
import 'package:hmiot/widgets/room_item.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  Future allRoom;
  Future _getAllRoom() async {
    var data = await CallApi().getDataWithToken('getDeviceList');
    var roomData = json.decode(data.body);
    print(roomData);
    return roomData['0'];
  }

  void refreshRoom() {
    setState(() {
      allRoom = _getAllRoom();
    });
  }

  static const _indicatorSize = 70.0;
  bool _renderCompleteState = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    refreshRoom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
        elevation: 0,
      ),
      body: FutureBuilder(
          future: _getAllRoom(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomRefreshIndicator(
                offsetToArmed: _indicatorSize,
                onRefresh: () async {
                  refreshRoom();
                },
                completeStateDuration: const Duration(seconds: 2),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return RoomItem(
                        snapshot.data[index]["id"],
                        snapshot.data[index]["name"],
                        snapshot.data[index]["change"],
                        snapshot.data[index]["change"] > 50
                            ? colorOrangeRed
                            : colorGreen,
                        snapshot.data[index]["value"]);
                  },
                ),
                builder: (
                  BuildContext context,
                  Widget child,
                  IndicatorController controller,
                ) {
                  return Stack(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, _) {
                          /// set [_renderCompleteState] to true when controller.state become completed
                          if (controller.didStateChange(
                              to: IndicatorState.complete)) {
                            _renderCompleteState = true;

                            /// set [_renderCompleteState] to false when controller.state become idle
                          } else if (controller.didStateChange(
                              to: IndicatorState.idle)) {
                            _renderCompleteState = false;
                          }

                          final containerHeight =
                              controller.value * _indicatorSize;

                          return Container(
                            alignment: Alignment.center,
                            height: containerHeight,
                            child: OverflowBox(
                              maxHeight: 40,
                              minHeight: 40,
                              maxWidth: 40,
                              minWidth: 40,
                              alignment: Alignment.center,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                alignment: Alignment.center,
                                child: _renderCompleteState
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                          value: controller.isDragging ||
                                                  controller.isArmed
                                              ? controller.value.clamp(0.0, 1.0)
                                              : null,
                                        ),
                                      ),
                                decoration: BoxDecoration(
                                  color: _renderCompleteState
                                      ? colorGreen
                                      : colorPrimary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        builder: (context, _) {
                          return Transform.translate(
                            offset:
                                Offset(0.0, controller.value * _indicatorSize),
                            child: child,
                          );
                        },
                        animation: controller,
                      ),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
