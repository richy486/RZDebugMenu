//
//  RZToggleResetTableViewCell.h
//  RZDebugMenuDemo
//
//  Created by Clayton Rieck on 6/3/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RZToggleTableViewCell : UITableViewCell

@property(nonatomic, strong) UISwitch *applySettingsSwitch;

- (id)initWithStyle:(UITableViewCellStyle)style cellTitle:(NSString *)title andSwitchValue:(BOOL)value;

@end
