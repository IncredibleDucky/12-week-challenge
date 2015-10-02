//
//  DetailViewController.m
//  trick
//
//  Created by Mattthew Bailey on 10/1/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

#import "DetailViewController.h"
#import "MatchesController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTextField;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {
    
    //Check to make sure text field is not blank before saving match.
    if (![self.entryTextField.text isEqualToString: @""]) {
        
        [[MatchesController sharedInstance] addMatch:self.entryTextField.text];
        [self.navigationController popViewControllerAnimated:YES];
        [[MatchesController sharedInstance] save];
    }   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
