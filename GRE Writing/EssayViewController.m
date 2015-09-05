//
//  EssayViewController.m
//  GRE Writing
//
//  Created by Aditya Tannu on 10/5/14.
//  Copyright (c) 2014 Aditya Tannu. All rights reserved.
//

#import "EssayViewController.h"

@interface EssayViewController ()

@end

@implementation EssayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nextTopic;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)nextTopic{
    
    int randomIndex;
    
    // Path to the plist (in the application bundle)
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"GRE149" ofType:@"plist"];
    
    // Build the array from the plist
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithContentsOfFile:path1];
    
    // Generate random index
    randomIndex = arc4random() % 149;
    
    // Lookup topic and hint
    NSString *myTopic = [array1 objectAtIndex:randomIndex*2];
    NSString *myHint = [array1 objectAtIndex:(randomIndex*2-1)];
    
    // Populate card with word and meaning
    
    CATransition *animation = [CATransition animation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionFromLeft;
    animation.duration = 0.75;
    [topicView.layer addAnimation:animation forKey:@"kCATransitionFromLeft"];
    
    CATransition *animation2 = [CATransition animation];
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation2.type = kCATransitionFromLeft;
    animation2.duration = 0.75;
    [hintView.layer addAnimation:animation forKey:@"kCATransitionFromLeft"];
    
    
    [topicView setText:[[NSString alloc] initWithFormat:@"%@", myTopic ] ];
    [hintView setText:[[NSString alloc] initWithFormat:@"%@", myHint]];
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
