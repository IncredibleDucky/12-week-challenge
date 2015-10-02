//
//  CustomTableViewCell.h
//  trick
//
//  Created by Mattthew Bailey on 10/1/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end