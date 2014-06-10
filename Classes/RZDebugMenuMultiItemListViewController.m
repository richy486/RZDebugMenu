//
//  RZDebugMenuEnvironmentsListViewController.m
//  RZDebugMenu
//
//  Created by Clayton Rieck on 6/3/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

#import "RZDebugMenuMultiItemListViewController.h"

static NSString * const kRZCellReuseIdentifier = @"Cell";

@interface RZDebugMenuMultiItemListViewController ()

@property(nonatomic, strong) UITableView *selectionsTableView;
@property(nonatomic, strong) NSArray *cellTitles;

@end

static NSString * const kRZNavigationBarTitle = @"Environments";

@implementation RZDebugMenuMultiItemListViewController

- (id)initWithCellTitles:(NSArray *)titles
{
    self = [super init];
    if ( self ) {
        _cellTitles = [[NSArray alloc] initWithArray:titles];
        self.title = kRZNavigationBarTitle;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    self.selectionsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    [self.selectionsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kRZCellReuseIdentifier];
    self.selectionsTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.selectionsTableView];
    
    self.selectionsTableView.delegate = self;
    self.selectionsTableView.dataSource = self;
}

#pragma mark - table view delegate methods

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.selectionsTableView dequeueReusableCellWithIdentifier:kRZCellReuseIdentifier];
    if ( cell ) {
        cell.textLabel.text = [self.cellTitles objectAtIndex:indexPath.row];
    }
    return cell;
}

@end
