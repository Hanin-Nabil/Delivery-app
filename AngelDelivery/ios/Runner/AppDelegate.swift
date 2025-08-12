import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCtjkfoA29PPUGOnJDH5vpnBJvQG8cItfA")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  
  // Bool {
  //   GeneratedPluginRegistrant.register(with: self)
  //   return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  //   - (BOOL)application:(UIApplication *)application
  //   didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // [GMSServices provideAPIKey:@"AIzaSyCtjkfoA29PPUGOnJDH5vpnBJvQG8cItfA"];
  // [GeneratedPluginRegistrant registerWithRegistry:self];
  // return [super application:application didFinishLaunchingWithOptions:launchOptions];
  //}

}


// @implementation AppDelegate


// }
// @end
