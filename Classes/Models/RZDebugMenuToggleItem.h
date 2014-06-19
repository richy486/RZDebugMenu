//
//  RZDebugMenuToggleItem.h
//  RZDebugMenu
//
//  Created by Clayton Rieck on 6/6/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RZDebugMenuSettingsItem.h"

@interface RZDebugMenuToggleItem : RZDebugMenuSettingsItem

@property (readonly, assign) BOOL toggleCellDefaultValue;

- (id)initWithTitle:(NSString *)title andValue:(BOOL)value;

@end