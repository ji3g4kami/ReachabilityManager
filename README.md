# ReachabilityManager

``ReachabilityManager.shared`` is the singleton that will kept on monitoring the connection status. To apply your changes according to the connection status, register your listener class, such as ``ViewController``, to ``ReachabilityManager.shared``.    

[NOTE] This pod has dependencies with [Reachability](https://github.com/ashleymills/Reachability.swift/blob/master/README.md). You can use Reachability if you want.

## Installation

To integrate ReachabilityManager into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
use_frameworks!

target '<Your Target Name>' do
    pod 'ReachabilityManager'
end
```
Then, run the following command:
```
$ pod install
```

## Set Up
In your AppDelegate.swift, add the following tree lines, and choose whether you want console log of the network status.

```swift
import ReachabilityManager

@UIApplicationMain
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    ReachabilityManager.shared.startMonitoring(withlog: false)
    return true
}

func applicationWillEnterForeground(_ application: UIApplication) {
    ReachabilityManager.shared.stopMonitoring()
}

func applicationDidBecomeActive(_ application: UIApplication) {
    ReachabilityManager.shared.startMonitoring(withlog: false)
}
```
## Usage

Conform to `ConnectionListener` delegate for the reactive way, or call `isReachable(success:failure:)` for the imperative way.    

[NOTE] Since we want network responses to reflect on the UI, the methods will be performed on the main thread.

### Imperative Function

The function will only be called once and run on the main thread.

```swift
@IBAction func printNeteorkStatus(_ sender: UIButton) {
  ReachabilityManager.shared.isReachable(success: {
    print("It is now reachable")
  }, failure: {
    print("It is now NOT reachable")
  })
}
```

### Reactive Delegate

1. Add listener in `viewDidLoad` and remove listener in `deinit`

```swift
import ReachabilityManager

class ViewController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    ReachabilityManager.shared.addListener(listener: self)
  }
    
  deinit {
    ReachabilityManager.shared.removeListener(listener: self)
  }
}
```

2. Conform your UIViewContrller(or other classes) to the ``ConnectionListener`` protocol to use listener functions.

`status` has three connection status for use: `.cellular`(3G, 4G), `.wifi`, `.unavailable`

```swift
extension ViewController: ConnectionListener {
  func connectionChanged(status: Reachability.Connection) {
    switch status {
    case .cellular:
      networkLabel.text = "Cellular"
      print("Cellular")
    case .wifi:
      networkLabel.text = "Wifi"
      print("Wifi")
    case .unavailable:
      networkLabel.text = "Unavailable"
      print("Unavailable")
    default:
      networkLabel.text = String(describing: status)
    }
  }
}
```
