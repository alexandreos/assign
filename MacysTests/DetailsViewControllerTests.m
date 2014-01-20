//
//  DetailsViewControllerTests.m
//  Macys
//
//  Created by Alexandre on 20/01/14.
//  Copyright (c) 2014 Avenue Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetailsViewController.h"

@interface DetailsViewControllerTests : XCTestCase

@property (nonatomic, strong) DetailsViewController *detailsViewController;

@end

@implementation DetailsViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.detailsViewController = [[DetailsViewController alloc] init];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#pragma mark - View Lifecycle Tests

- (void)testViewDidLoad
{
    self.detailsViewController.tapCounter = 10;
    [self.detailsViewController viewDidLoad];
    
    NSArray *subviews = self.detailsViewController.view.subviews;
    UILabel *label = nil;
    for (UIView *v in subviews) {
        if([v isKindOfClass:[UILabel class]]) {
            label = (UILabel *) v;
            break;
        }
    }
    
    XCTAssert(label, @"No label found in detailsViewController's view");
    XCTAssertTrue([label.text isEqualToString:@"Tap #10"], @"wrong content in label: %@", label.text);
}

@end
