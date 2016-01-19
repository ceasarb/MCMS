//
//  MonsterViewController.m
//  MCMS
//
//  Created by Brett Tau on 1/19/16.
//  Copyright © 2016 MobileMakers. All rights reserved.
//

#import "MonsterViewController.h"

@interface MonsterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *monsterNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *monsterNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *monsterDetailLabel;

@end

@implementation MonsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.monster.monsterName;
    self.monsterNameLabel.text = self.monster.monsterName;
    self.editing = false;
}


- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if(self.editing)
    {
        self.editing = false;
//        [sender setEnabled: YES];
//        sender.style = UIBarButtonItemStylePlain;
        sender.titleLabel.text = @"Edit";
    }
    else
    {
        self.editing = true;
//        [sender setEnabled: YES];
//        sender.style = UIBarButtonItemStyleDone;
        sender.titleLabel.text = @"Done";
    }
}

@end
