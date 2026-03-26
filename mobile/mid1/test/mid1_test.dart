// import 'package:mid1/mid1.dart';
// import 'package:test/test.dart';
abstract class SmartDevice{
  String _deviceName;
  void performAction();
  SmartDevice(String this.deviceName);

  String get DeviceName => deviceName;
}
class SmartLight extends SmartDevice {
  SmartLight({required String deviceName}) : super(deviceName);
  @override
  void performAction() {
    print("Adjusting brightness...");
  }
}
class SmartThermostat extends SmartDevice {
  SmartThermostat({required String deviceName}) : super(deviceName);
  @override
  void performAction() {
    print("Setting temperature...");
  }
}

void main() {
  List<SmartDevice> d = [
    SmartLight(deviceName: "Light 1"),
    SmartThermostat(deviceName: "Thermostat 1")
  ];
  for(int i = 0; i < d.length; i++){
    d[i].performAction();
  }

}
