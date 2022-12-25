# :dizzy: FlashChat-Firebase
This is a chat application. Users can register, login and logout. They can send messages to each other. Made with Google Firebase as backend server. All transactions such as registration, login, logout, sending messages are recorded in Firebase. In this way, old messages will be loaded when the user opens the application again. I used Swift Package Manager to use on Firebase. I also used IQKeyboardManagerSwift from Cocoapods to design the functionality of the keyboard in the app. I also used .xib file to customize cells in UITableView.

<p float="left">
<img width="666" src="/Udemy-Dr.Angela_Yu/Projects/015-Flash-Chat-Firebase/gif/preview.gif">
</p>

## :hammer: Tools

* Swift Package Manager
* Cocoapods
* Realm

## :rocket: Installing guide

On your project directory, run:

```
pod install
```

## :bangbang: Note
I deleted the GoogleService-Info.plist file for security reasons. If you want to use this application, you must download your own GoogleService-Info.plist file from Firebase.


