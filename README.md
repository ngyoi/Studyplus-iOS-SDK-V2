StudyplusSDK-V2
=======

StudyplusSDK-V2 is [Studyplus iOS SDK](https://github.com/studyplus/Studyplus-iOS-SDK) for Swift.

## Requirements

 * iOS 8.0 or above
 * Swift 3.0 or above

## Dependency
 * [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess)

## Install

### CocoaPods

```ruby
# Edit your podfile
use_frameworks!
pod 'StudyplusSDK-V2'
```
and run
```pod install ```

### Carthage

- comming soon

### Manual install

- comming soon

## Usage

- If you don't have consumerKey and consumerSecret, please contact https://info.studyplus.jp/api/index.php

### Set up custom URL scheme

- set __studyplus-*{your consumer key}*__ to URL Types. (ex. studyplus-MIoh79q7pfMbTUVA3BNsSeTaZRcOK3yg )

![xcode](https://github.com/studyplus/Studyplus-iOS-SDK-V2/blob/master/docs/set_url_scheme.png)

### Set up consumerKey and consumerSecret

- set __consumerKey__ and __consumerSecret__ in your Info.plist.

```plist
<key>StudyplusSDK</key>
<dict>
  <key>consumerKey</key>
  <string>set_your_consumerKey</string>
  <key>consumerSecret</key>
  <string>set_your_consumerSecret</string>
</dict>
```

### Initialize

```Swift
import StudyplusSDK

class ViewController: UIViewController, StudyplusLoginDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        Studyplus.shared.delegate = self
    }

    // ...
}
```

### Login
```Swift
import StudyplusSDK

class AppDelegate: UIResponder, UIApplicationDelegate {

    // ...

    // MARK: - iOS8

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return Studyplus.shared.handle(appDelegateUrl: url)
    }

    // MARK: - iOS9 or above

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return Studyplus.shared.handle(appDelegateUrl: url)
    }
}
```

```Swift
import StudyplusSDK

class ViewController: UIViewController, StudyplusLoginDelegate {

    // ...

    // MARK: - Login

    @IBAction func loginButton(_ sender: UIButton) {
        Studyplus.shared.login()
    }

    // MARK: - StudyplusLoginDelegate

    func studyplusDidSuccessToLogin() {
        // do something
    }

    func studyplusDidFailToLogin(error: StudyplusError) {
        // do something
    }

    func studyplusDidCancelToLogin() {
        // do something
    }
}
```

### Post studyRecord to Studyplus

```Swift
import StudyplusSDK

class ViewController: UIViewController, StudyplusLoginDelegate {

    // ...

    // MARK: - Post studyRecord to Studyplus

    @IBAction func postStudyRecordButton(_ sender: UIButton) {
        let recordAmount: StudyplusRecordAmount = StudyplusRecordAmount(amount: 10)
        let record: StudyplusRecord = StudyplusRecord(duration: duration, recordedAt: Date(), amount: recordAmount, comment: "Today, I studied like anything.")

        Studyplus.shared.post(studyRecord: record, success: {

            // do something

        }, failure: { error in

            print("Error Code: \(error.code()), Message: \(error.message())")
        })
    }
}
```

## Demo app

![demo](https://github.com/studyplus/Studyplus-iOS-SDK-V2/blob/master/docs/demoapp_v2.jpg)

- Set __studyplus-*{your consumer key}*__ to URL Types in Demo.
- Set __consumerKey__ and __consumerSecret__ in Info.plist of Demo.
- Select Demo Scheme and Run.

## License

- [MIT License.](http://opensource.org/licenses/mit-license.php)