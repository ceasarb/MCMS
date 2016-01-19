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
    self.monsterDetailLabel.text = self.monster.monsterDetail;
    self.monsterNameLabel.text = self.monster.monsterName;
    self.monsterNameTextField.hidden = YES;
}



- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Edit"]) {
        self.monsterNameTextField.hidden = NO;
        self.monsterNameLabel.hidden = YES;
        self.monsterNameLabel.text = self.monsterNameTextField.text;
        sender.titleLabel.text = @"Done";
    } else {
        self.monsterNameTextField.hidden = YES;
        self.monsterNameLabel.hidden = NO;
        sender.titleLabel.text = @"Edit";
    }
}

@end
