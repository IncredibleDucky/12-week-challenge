//
//  ViewController.m
//  trick
//
//  Created by Mattthew Bailey on 10/1/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

#import "ViewController.h"
#import "MatchesController.h"
#import "CustomTableViewCell.h"

static NSString *const cellID = @"cellID";

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomizButtonPressed:(id)sender {
    
    [[MatchesController sharedInstance] randomize];
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger cellCount = [MatchesController sharedInstance].matches.count;
    
    if (cellCount % 2 == 0) {//Even Matches
        cellCount = cellCount/2;
    } else { //Odd Matches
        cellCount = cellCount/2 + 1;
    }
    
    return cellCount;
}

-(CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    NSInteger rightMatchIndex = [MatchesController sharedInstance].matches.count;
    NSInteger matchesCount = [MatchesController sharedInstance].matches.count;
   
    if (rightMatchIndex % 2 == 0) {//Even Matches
        rightMatchIndex = rightMatchIndex/2;
    } else { //Odd Matches
        rightMatchIndex = rightMatchIndex/2 + 1;
    }
    
    
    NSString *leftMatch = [[NSString alloc] initWithFormat:@"%@", [MatchesController sharedInstance].matches[indexPath.row]];
    NSString *rightMatch = [NSString new];
   
    //Check to make sure a string exists at rightMatchIndex.
    if (rightMatchIndex + indexPath.row < matchesCount) {
  
        rightMatch = [[NSString alloc] initWithFormat:@"%@", [MatchesController sharedInstance].matches[rightMatchIndex + indexPath.row]];
    
    } else {
        
        rightMatch = [[NSString alloc] initWithFormat:@"Forever Alone"];
        
    }
    
    cell.leftLabel.text = leftMatch;
    cell.rightLabel.text = rightMatch;
    
    return cell;
}

@end
