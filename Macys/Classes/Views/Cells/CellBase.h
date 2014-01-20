//
//  CellBase.h
//  Macys
//
//  Created by Alexandre on 20/01/14.
//  Copyright (c) 2014 Avenue Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellBase : UITableViewCell

/** Creates an instance of the calling subclass from a nib file with the same name
 * @discussion I would create these instances from storyboard, but the code assigment required them to be created from nib files or directly from the implemention code.
 */
+ (instancetype) cellFromNib;

@end
