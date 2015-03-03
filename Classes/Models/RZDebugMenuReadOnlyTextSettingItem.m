//
//  RZDebugMenuTitleItem.m
//  RZDebugMenu
//
//  Created by Michael Gorbach on 2/25/15.
//  Copyright (c) 2015 Raizlabs. All rights reserved.
//

#import "RZDebugMenuReadOnlyTextSettingItem.h"

#import <FXForms/FXForms.h>

@interface RZDebugMenuReadOnlyTextSettingItem ()

@property (copy, nonatomic, readwrite) NSArray *values;
@property (copy, nonatomic, readwrite) NSArray *titles;

@end

@implementation RZDebugMenuReadOnlyTextSettingItem

- (instancetype)initWithValue:(id)value key:(NSString *)key title:(NSString *)title values:(NSArray *)values titles:(NSArray *)titles
{
    self = [super initWithValue:value key:key title:title];
    if ( self ) {
        self.values = values;
        self.titles = titles;
    }

    return self;
}

- (instancetype)initWithValue:(id)value key:(NSString *)key title:(NSString *)title
{
    return [self initWithValue:value key:key title:title values:nil titles:nil];
}

- (NSDictionary *)fxFormsFieldDictionary
{
    NSMutableDictionary *mutableFieldDictionary = [[super fxFormsFieldDictionary] mutableCopy];

    mutableFieldDictionary[FXFormFieldType] = FXFormFieldTypeDefault;

    NSArray *values = self.values;
    NSArray *titles = self.titles;

    mutableFieldDictionary[FXFormFieldValueTransformer] = ^(id input) {
        NSString *valueToReturn = @"";

        if ( input != nil ) {
            NSUInteger index = [values indexOfObject:input];
            NSAssert(index < NSNotFound && index >= 0, @"");
            valueToReturn = titles[index];
        }

        return valueToReturn;
    };

    return [mutableFieldDictionary copy];
}

@end