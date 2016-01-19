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
    MagicalMonster *monster1 = [[MagicalMonster alloc]initWithMonsterName:@"The Blob" andMonsterDetails:@"Blobby" andAccessories:[NSMutableArray arrayWithObjects:@"Belt", @"Hat", nil]];
    MagicalMonster *monster2 = [[MagicalMonster alloc]initWithMonsterName:@"Frankenstein" andMonsterDetails:@"He's a stiff" andAccessories:[NSMutableArray arrayWithObjects:@"Bolts", @"Scars", nil]];
    MagicalMonster *monster3 = [[MagicalMonster alloc]initWithMonsterName:@"Dracula" andMonsterDetails:@"Has sharp fangs" andAccessories:[NSMutableArray arrayWithObjects:@"Cape", @"Coffin", nil]];
    
    self.monsters = [NSMutableArray arrayWithObjects:monster1, monster2, monster3, nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.monsters.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalMonster *monster = [self.monsters objectAtIndex:indexPath.row];
    cell.textLabel.text = monster.monsterName;
    cell.detailTextLabel.text = monster.monsterDetail;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MonsterViewController *mvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    mvc.monster = [self.monsters objectAtIndex:indexPath.row];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.monsters removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *monster = [self.monsters objectAtIndex:sourceIndexPath.row];
    [self.monsters removeObject:monster];
    [self.monsters insertObject:monster atIndex:destinationIndexPath.row];
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {
    if(self.editing)
    {
        self.editing = false;
        [self.tableView setEditing:false animated:true];
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
    }
    else
    {
        self.editing = true;
        [self.tableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
    }
}

- (IBAction)onAddButtonTapped:(UIButton *)sender {
    MagicalMonster *monster =[[MagicalMonster alloc]init];
    monster.monsterName = self.monsterNameTextField.text;
    monster.monsterDetail = self.monsterDetailTextField.text;
    [self.monsters addObject:monster];
    [self.tableView reloadData];
    
    self.monsterNameTextField.text = @"";
    [self.monsterNameTextField endEditing:YES];
}

@end
