//
//  MagicalMonster.m
//  MCMS
//
//  Created by Brett Tau on 1/19/16.
//  Copyright © 2016 MobileMakers. All rights reserved.
//

#import "MagicalMonster.h"

@implementation MagicalMonster

-(instancetype)initWithMonsterName:(NSString *)monsterName andMonsterDetails:(NSString *)monsterDetail andAccessories:(NSMutableArray *)accessories {
    self = [super init];
    if (self) {
        self.monsterName = monsterName;
        self.monsterDetail = monsterDetail;
        self.accessories = accessories;
    }
    return self;
}

@end
