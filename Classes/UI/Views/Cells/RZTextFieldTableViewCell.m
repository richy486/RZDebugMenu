//
//  RZTextFieldTableViewCell.m
//  RZDebugMenu
//
//  Created by Clayton Rieck on 6/30/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

#import "RZTextFieldTableViewCell.h"

static NSString * const textFieldPlaceHolder = @"Placeholder";

@implementation RZTextFieldTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if ( self ) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        _stringTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width/2, height)];
        _stringTextField.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _stringTextField.placeholder = textFieldPlaceHolder;
        
        
        self.accessoryView = [[UIView alloc] initWithFrame:_stringTextField.frame];
        [self.accessoryView addSubview:_stringTextField];
    }
    
    return self;
}

- (void)changeText
{
    [self.delegate didEditTextLabelOfCell:self];
}

@end
