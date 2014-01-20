//
//  HomeViewControllerTests.m
//  Macys
//
//  Created by Alexandre on 20/01/14.
//  Copyright (c) 2014 Avenue Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeViewController.h"
#import "CellAd.h"
#import "CellButtonsGrid.h"

@interface HomeViewControllerTests : XCTestCase

@property (nonatomic, strong) HomeViewController *homeViewController;

@end

@implementation HomeViewControllerTests

- (void)setUp {
    [super setUp];
    
    self.homeViewController = [[HomeViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#pragma mark - Class Tests

- (void)testViewControllerClass {
    XCTAssertTrue([HomeViewController isSubclassOfClass:[UITableViewController class]], @"HomeViewController should be subclass of UITableViewController");
}

#pragma mark - UITableViewDataSource Tests

- (void)testTableViewDataSource {
    NSInteger numberOfSections = [self.homeViewController numberOfSectionsInTableView:self.homeViewController.tableView];
    
    XCTAssertTrue(numberOfSections == 3, @"HomeViewController's tableview should have 3 sections");
    
    NSInteger numberOfRowsFirstSection = [self.homeViewController tableView:self.homeViewController.tableView numberOfRowsInSection:0];
    NSInteger numberOfRowsSecondSection = [self.homeViewController tableView:self.homeViewController.tableView numberOfRowsInSection:1];
    NSInteger numberOfRowsThirdSection = [self.homeViewController tableView:self.homeViewController.tableView numberOfRowsInSection:2];
    
    XCTAssertTrue(numberOfRowsFirstSection == 1, @"HomeViewController's tableview should have 1 row in section: 0");
    XCTAssertTrue(numberOfRowsSecondSection == 1, @"HomeViewController's tableview should have 1 row in section: 1");
    XCTAssertTrue(numberOfRowsThirdSection == 2, @"HomeViewController's tableview should have 2 rows in section: 2");
}

- (void)testTableViewDataSourceCells {
    
    // CellAd
    UITableViewCell *cellAd = [self.homeViewController tableView:self.homeViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertTrue([cellAd isKindOfClass:[CellAd class]], @"Cell at indexPath(0, 0) should be an instance of CellAd");
    cellAd = [self.homeViewController tableView:self.homeViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    XCTAssertTrue([cellAd isKindOfClass:[CellAd class]], @"Cell at indexPath(2, 0) should be an instance of CellAd");
    
    // CellButtonsGrid
    UITableViewCell *cellButtonsGrid = [self.homeViewController tableView:self.homeViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    XCTAssertTrue([cellButtonsGrid isKindOfClass:[CellButtonsGrid class]], @"Cell at indexPath(0, 0) should be an instance of CellButtonsGrid");
}

#pragma mark - UITableViewDelegate Tests

- (void)testTableViewDelegate {
    XCTAssertTrue([self.homeViewController respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)], @"HomeViewController should implement -tableView:didSelectRowAtIndexPath: method");
    
    XCTAssertNoThrow([self.homeViewController tableView:self.homeViewController.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]], @"HomeViewController should not throw exceptions in -tableView:didSelectRowAtIndexPath: method");
}

@end
