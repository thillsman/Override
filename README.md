# Override
A micro-library that makes it easy to override values in your iOS apps.

[![Pod Version](https://img.shields.io/cocoapods/v/Override.svg)](https://cocoapods.org/)
![Swift Version](https://img.shields.io/badge/Swift-4.0-brightgreen.svg)
![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)
![Plaform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)

## What it is

If your iOS app ever has a string or some other hard-coded data that - for whatever reason - you'd like to change, Override makes that possible easily. For example: if you change an endpoint, you can submit an update with the new URL, but what about users on older builds? Override those!

Simply stick a JSON file anywhere on the internet (HTTPS required because it's 2017), implement Override, and be able to flip switches in your app from afar.

## What it isn't

Override doesn't provide a server-side component, rather it allows you to bring your own (or simply upload a JSON file).

Override doesn't lock you into a specific data model, instead it uses UserDefaults, letting you use them directly or enhance them to fit your app.

## How you use it

Install with CocoaPods (`pod 'Override'`) or manually (download `Override.swift` into your project).

Put a flat JSON file on a server accessible with an HTTPS URL. Example:
```
{
  "endpointVersion": "v1",
  "offerFreeTrial": false
}
```

In `AppDelegate.swift`'s `didFinishLaunchingWithOptions` method (or another one if you'd prefer), initialize the class:
```
let override = Override()
```

Then (optionally) set your preferred UserDefaults instance:
```
override.userDefaultsInstance = UserDefaults.standard
```

Then (optionally, but recommended) set your initial values for each key:
```
override.initialValues = [
  "endpointVersion": "v1",
  "offerFreeTrial": false
]
```

Finally, request an update from your JSON file and (optionally) handle it:
```
override.update(from: "https://tylr.us/testing/override.json") {success in
  print(success)
}
```

Note: For maximum flexibility, you can include your JSON URL as a value in your initialValues/JSON file, passing the UserDefaults value for your assigned key in the `update` method.
