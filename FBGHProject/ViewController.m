//
//  ViewController.m
//  FBGHProject
//
//  Created by Anatoliy on 4/2/16.
//  Copyright © 2016 mobex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://fbghproject.firebaseio.com/"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
