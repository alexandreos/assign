//
//  GridButtonsCell.m
//  Macys
//
//  Created by Alexandre on 20/01/14.
//  Copyright (c) 2014 Avenue Code. All rights reserved.
//

#import "CellButtonsGrid.h"

@interface CellButtonsGrid ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation CellButtonsGrid

#pragma mark - Public Methods

- (void) setButtonsTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    for (UIButton *button in self.buttons) {
        // Remove all old targets for these control events
        [button removeTarget:nil action:nil forControlEvents:controlEvents];
        [button addTarget:target action:action forControlEvents:controlEvents];
    }
}

@end
