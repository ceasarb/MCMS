//
//  ViewController.m
//  MCMS
//
//  Created by Ceasar Barbosa on 1/19/16.
//  Copyright © 2016 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "MagicalMonster.h"
#import "MonsterViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *monsterNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *monsterDetailTextField;

@property NSMutableArray *monsters;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalMonster *monster1 = [[MagicalMonster alloc]init];
    MagicalMonster *monster2 = [[MagicalMonster alloc]init];
    MagicalMonster *monster3 = [[MagicalMonster alloc]init];
    
    monster1.monsterName = @"Monster1";
    monster2.monsterName = @"Monster2";
    monster3.monsterName = @"Monster3";
    
    self.monsters = [NSMutableArray arrayWithObjects:monster1, monster2, monster3, nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.monsters.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalMonster *monster = [self.monsters objectAtIndex:indexPath.row];
    cell.textLabel.text = monster.monsterName;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MonsterViewController *mvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    mvc.monster = [self.monsters objectAtIndex:indexPath.row];
}


- (IBAction)onAddButtonTapped:(UIButton *)sender {
    MagicalMonster *monster =[[MagicalMonster alloc]init];
    monster.monsterName = self.monsterNameTextField.text;
    [self.monsters addObject:monster];
    [self.tableView reloadData];
    
    self.monsterNameTextField.text = @"";
    [self.monsterNameTextField endEditing:YES];
}

@end
