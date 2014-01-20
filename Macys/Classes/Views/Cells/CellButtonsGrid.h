//
//  GridButtonsCell.h
//  Macys
//
//  Created by Alexandre on 20/01/14.
//  Copyright (c) 2014 Avenue Code. All rights reserved.
//

#import "CellBase.h"

@interface CellButtonsGrid : CellBase

/** Sets all buttons target.
 * @param target The target object.
 * @param action The action selector implemented by the target.
 * @param controlEvents Control events to be associated with the action.
 */
- (void) setButtonsTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
