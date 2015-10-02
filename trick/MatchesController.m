//
//  MatchesController.m
//  trick
//
//  Created by Mattthew Bailey on 10/1/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

#import "MatchesController.h"

@interface MatchesController ()

@property (strong, nonatomic, readwrite) NSArray *matches;

@end

@implementation MatchesController


+ (instancetype)sharedInstance {
    static MatchesController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MatchesController new];
        sharedInstance.matches = [NSMutableArray new];
        [sharedInstance loadFromPersistentStorage];

    });
    return sharedInstance;
}

- (void) randomize {
    
    NSInteger index = self.matches.count;
    NSMutableArray *randomizedMatches = [[NSMutableArray alloc] initWithArray:self.matches];
    
    for (int i = 0; i < index - 1; i++) {
        NSInteger count = index - i;
        NSInteger exchangeIndex = i + arc4random_uniform((int)count);
        [randomizedMatches exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    self.matches = randomizedMatches;
}

- (void) addMatch:(NSString *)match {
    
    self.matches = [self.matches arrayByAddingObject:match];
    
}

- (void)saveToPersistentStorage {
    
    NSMutableArray *entitiesDictionaries = [[NSMutableArray alloc] initWithArray:self.matches];

    [[NSUserDefaults standardUserDefaults] setObject:entitiesDictionaries forKey:@"matches"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)save {
    [self saveToPersistentStorage];
}

- (void)loadFromPersistentStorage {

    self.matches = [[NSUserDefaults standardUserDefaults] objectForKey:@"matches"];

}

@end
