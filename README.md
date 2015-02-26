RZDebugMenu
===========

[![Build Status](https://travis-ci.org/Raizlabs/RZDebugMenu.svg)](https://travis-ci.org/Raizlabs/RZDebugMenu)

`RZDebugMenu` gives you an easy way to add tweakable, debug-only preferences or settings to your application. This is useful for many settings you often want to change during development, but never in producgtion, such as whether you are using a staging or production API endpoint.

`RZDebugMenu` is configured via Settings Bundle plist file, just like the ones you create for adding production settings to Settings.app. It supports almost all the Settings Bundle schema defined [here] (https://developer.apple.com/library/prerelease/ios/documentation/PreferenceSettings/Conceptual/SettingsApplicationSchemaReference).

`RZDebugMenu` creates a "magic button" that gives you access to your debug settings. The button is hidden by default. To unhide it, use a four-finger tap gesture. You can also unhide it programatically if you want it visible by default.

## Usage

### Setup

`RZDebugMenu` is driven off of a Settings bundle plist file, so the first thing you should is create this Plist and add it to your project.

To set up RZDebugMenu, add the following code to your Applcation Delegate's `application:didFinishLaunchingWithOptions:` method.

```objc
	#if (DEBUG)
	    // To activate the debug menu, call this method with the name of the settings plist you want to use. It should be included in your application bundle.
	    [RZDebugMenu enableMenuWithSettingsPlistName:@"debug_settings"];
	#endif
```
	
Once you have your window, to set up the four-tap gesture to show the menu, add the following code:

```objc
	#if (DEBUG)
	    // To configure automatic show and hide of the debug menu via a 4-tap gesture, call this method with your app's primary window.
	    [[RZDebugMenu sharedDebugMenu] configureAutomaticShowHideOnWindow:self.window];
	#endif
```
	
### Accessing Settings
	
You can now access your debug settings via `RZDebugMenuSettings`.

```objc
	[RZDebugMenuSettings sharedSettings][@"my_setting_key"]
```
	
You can also use standard KVO on `RZDebugMenuSettings` to access settings, and to watch for changes.

```objc
	NSNumber *namePreference = [[RZDebugMenuSettings sharedSettings] valueForKey:@"name_preference"];
	[[RZDebugMenuSettings sharedSettings] addObserver:self forKeyPath:@"name_preference" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:NULL];
```
	
Finally, you can detect changes in settings via a Notification too, if you prefer that over KVO.

```objc
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settingsChanged:) name:kRZDebugMenuSettingChangedNotification object:nil];
```

This notification will contain keys that describe the setting that has been changed, as well as the previous and new values.

### Advanced Usage

Check the sample application for some patterns of advanced usage. Including:

- Changing the way settings are stored (whether they are isolated from or connected to your normal `NSUserDefaults.`)
- Manually hiding and showing the magic button.

## Try It

To try `RZDebugMenu`, install [CocoaPods](http://cocoapods.org) and run

	pod try RZDebugMenu

## Installation

`RZDebugMenu` is available through [CocoaPods](http://cocoapods.org). To install, simple add the following line to your Podfile:

	pod RZDebugMenu
  
## Authors

Current Maintainer:

- Michael Gorbach, michael.gorbach@raizlabs.com

Previous Maintainers:

- Clayton Reick
- Nicholas Donaldson
