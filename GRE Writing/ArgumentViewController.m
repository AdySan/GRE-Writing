//
//  ArgumentViewController.m
//  GRE Writing
//
//  Created by Aditya Tannu on 10/5/14.
//  Copyright (c) 2014 Aditya Tannu. All rights reserved.
//

#import "ArgumentViewController.h"

@interface ArgumentViewController ()

@end

@implementation ArgumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nextArgument;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)nextArgument{
    
    int randomIndex;
    
    // Path to the plist (in the application bundle)
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"GRE174" ofType:@"plist"];
    
    // Build the array from the plist
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithContentsOfFile:path1];
    
    // Generate random index
    randomIndex = arc4random() % 174;
    
    // Lookup topic and hint
    NSString *myargument = [array1 objectAtIndex:randomIndex];
    
    // Populate card with word and meaning
    
    CATransition *animation = [CATransition animation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionFromRight;
    animation.duration = 0.75;
    [argumentView.layer addAnimation:animation forKey:@"kCATransitionFromRight"];
    
    [argumentView setText:[[NSString alloc] initWithFormat:@"%@", myargument ] ];
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
