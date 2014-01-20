//
//  ViewController.m
//  Macys
//
//  Created by Alexandre on 20/01/14.
//  Copyright (c) 2014 Avenue Code. All rights reserved.
//

#import "HomeViewController.h"
#import "CellAd.h"
#import "CellButtonsGrid.h"
#import "DetailsViewController.h"

@interface HomeViewController ()

@property (nonatomic) uint buttonTapCounter;

@end

@implementation HomeViewController

typedef NS_ENUM(NSInteger, kSections) {
    kSectionTopAds = 0,
    kSectionButtonsGrid,
    kSectionBottomAds,
    kSectionsCount
};

#pragma mark - View Lifecicle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Actions

- (void) presentDetailsViewController
{
    // Increment the counter and Show the modal view controller
    self.buttonTapCounter++;
    
    DetailsViewController *detailsViewController = [[DetailsViewController alloc] init];
    detailsViewController.tapCounter = self.buttonTapCounter;
    
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

- (IBAction) buttonTapped:(id) sender {
    [self presentDetailsViewController];
}

#pragma mark - Cell Instantiation

- (UITableViewCell *) cellForAdAtIndexPath:(NSIndexPath *) indexPath {
    static NSString * const CellIdentifier = @"CellAdId";
    CellAd *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [CellAd cellFromNib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    switch (indexPath.section) {
        case kSectionTopAds:
            cell.backgroundImageView.image = [UIImage imageNamed:@"topAd"];
            break;
            
        case kSectionBottomAds:
            cell.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"bottomAd%d", indexPath.row+1]];
            break;
    }
    
    return cell;
}

- (UITableViewCell *) cellForButtonsGridAtIndexPath:(NSIndexPath *) indexPath {
    static NSString * const CellIdentifier = @"CellButtonsGridId";
    CellButtonsGrid *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [CellButtonsGrid cellFromNib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setButtonsTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kSectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case kSectionTopAds:
            return 1;
        case kSectionButtonsGrid:
            return 1;
        case kSectionBottomAds:
            return 2;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case kSectionTopAds:
            return 94.0f;
        case kSectionBottomAds:
            if(indexPath.row == 0)
                return 104.0f;
            else
                return 94.0f;
        case kSectionButtonsGrid:
            return 200.0f;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case kSectionTopAds:
        case kSectionBottomAds:
            cell = [self cellForAdAtIndexPath:indexPath];
            break;
        case kSectionButtonsGrid:
            cell = [self cellForButtonsGridAtIndexPath:indexPath];
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self presentDetailsViewController];
}

@end
