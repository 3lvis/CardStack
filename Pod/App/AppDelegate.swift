import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

        let layout = CardStackLayout()
        layout.actualCellHeight = Double(UIScreen.mainScreen().bounds.height - 120.0)
        layout.visibleCellHeight = 60.0
        self.window?.rootViewController = RootController(layout: layout)

        self.window!.makeKeyAndVisible()

        return true
    }
}

