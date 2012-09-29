//
//  ViewController.m
//  testtabbar
//
//  Created by Chu Mohua on 12-9-29.
//  Copyright (c) 2012年 Chu Mohua. All rights reserved.
//

#import "ViewController.h"
#import "DONBETabBarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"balabala";
}

-(IBAction)show:(id)sender{
    [(DONBETabBarViewController *)self.tabBarController showTabBar];
}
-(IBAction)hide:(id)sender{
    [(DONBETabBarViewController *)self.tabBarController hideTabBar];
}
@end
