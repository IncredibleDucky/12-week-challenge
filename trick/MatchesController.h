//
//  MatchesController.h
//  trick
//
//  Created by Mattthew Bailey on 10/1/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchesController : NSObject

@property (strong, nonatomic, readonly) NSArray *matches;

+ (instancetype) sharedInstance;

- (void) randomize;

- (void) addMatch:(NSString *)match;

- (void) save;

@end
