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


- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Done";
        self.monsterNameTextField.hidden = NO;
        self.monsterNameLabel.hidden = YES;
    } else {
        sender.title = @"Edit";
        self.monsterNameTextField.hidden = YES;
        self.monsterNameLabel.hidden = NO;
        self.monsterNameLabel.text = self.monsterNameTextField.text;
        self.monster.monsterName = self.monsterNameTextField.text;
        self.title = self.monsterNameTextField.text;
    }
}



@end
