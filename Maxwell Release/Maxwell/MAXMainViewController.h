//
//  MAXMainViewController.h
//  Maxwell
//
//  Created by Notdbrand on 2/12/25.
//  Copyright (c) 2025 Notdbrand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAXMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *maxwellButton;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

- (IBAction)maxwellButtonPressed:(id)sender;

@end
