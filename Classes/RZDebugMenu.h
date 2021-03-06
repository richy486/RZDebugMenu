//
//  RZDebugMenu.h
//  RZDebugMenu
//
//  Created by Clayton Rieck on 6/11/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

/**
 *  Observer notification name constant. Notification with this name sent on a change in the Debug Menu. The userInfo on the Notification sent contains the setting's key:value pair that was changed.
 */
OBJC_EXTERN NSString* const kRZDebugMenuSettingChangedNotification;

/**
 *  RZDebug Menu Class
 *
 *  @warning Can not call 'init' on this class, otherwise app will throw exception
 */
@interface RZDebugMenu : NSObject
/** @name RZDebugMenu Interface */

/**
 *  Enables the debug menu with a specified settings plist
 *
 *  @param fileName Name of the plist which defines the debug settings to be used. The plist should conform to the standard Settings Bundle plist format.
 */
+ (void)enableMenuWithSettingsPlistName:(NSString *)plistName;

/**
 *  Access the shared debug menu.
 *
 *  @return If yopu have called enableMenuWithSettingsPlistName:, this will return the shared debug debug.
 */
+ (instancetype)sharedDebugMenu;

/**
 *  Configure presentation of the debug menu button with a 3-finger, 3-tap gesture on the specified view.
 *
 *  @param view   The view on which to set up the presentation gesture.
 */
- (void)registerDebugMenuPresentationGestureOnView:(UIView *)view;

/**
 *  Manually present the debug menu on the root view controller of the presentation's main window, or the deepest presented view controller if a presentation is already active.
 */
- (void)presentDebugMenu;

/**
 *  Manually dismiss the debug menu, if it is currently presented.
 */
- (void)dismissDebugMenu;

/**
 *  The top-level view controller for the debug menu to present (in case you want to present it manually yourself).
 */
@property (strong, nonatomic, readonly) UIViewController *debugMenuViewControllerToPresent;

@end
