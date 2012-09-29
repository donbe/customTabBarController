//
//  DONBETabBarViewController.m
//  testtabbar
//
//  Created by Chu Mohua on 12-9-29.
//  Copyright (c) 2012年 Chu Mohua. All rights reserved.
//

#import "DONBETabBarViewController.h"

@interface DONBETabBarViewController ()

@property (nonatomic, retain) NSArray *tabbarButtons;

@end

@implementation DONBETabBarViewController

-(void)setupCustomElements:(NSArray *)buttons
{
    self.tabbarButtons = buttons;
    for (int i=0; i<[buttons count]; i++) {
        UIButton *button = [buttons objectAtIndex:i];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        button.frame = CGRectMake(320/[buttons count]*i, 0, 320/[buttons count], 49);
        button.adjustsImageWhenHighlighted = NO;
        [self.tabBar addSubview:button];
        
        if (i == self.selectedIndex) {
            button.selected = YES;
        }
    }
}

-(void)setupBackground:(NSString *)imageName
{
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageview.frame = CGRectMake(0, 0, 320, 49);
    
    if ([self.tabbarButtons count]) {
        UIButton *button = [self.tabbarButtons objectAtIndex:0];
        [self.tabBar insertSubview:imageview belowSubview:button];
    }else{
        [self.tabBar addSubview:imageview];
    }
}

- (void)buttonClicked:(UIButton *)sender
{
    [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(fire:) userInfo:[NSNumber numberWithInt:sender.tag] repeats:NO];
}

-(void)fire:(NSTimer *)timer{
    int tagNum = ((NSNumber *)timer.userInfo).integerValue;
    [self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
    for (UIButton *button in self.tabbarButtons) {
        button.selected = NO;
    }
    UIButton *button = [self.tabbarButtons objectAtIndex:tabID];
    button.selected = YES;
    self.selectedIndex = tabID;
}


- (void)showTabBar
{
    self.tabBarShowing = YES;
    [UIView animateWithDuration:0.3 animations:^{
        for(UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]]) {
                [view setFrame:CGRectMake(view.frame.origin.x, [UIScreen mainScreen].bounds.size.height - self.tabBar.frame.size.height, view.frame.size.width, view.frame.size.height)];
                
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, [UIScreen mainScreen].bounds.size.height - self.tabBar.frame.size.height)];
            }
        }
    }];
}

- (void)hideTabBar
{
    [UIView animateWithDuration:0.3 animations:^{
        for(UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]]) {
                [view setFrame:CGRectMake(view.frame.origin.x, [UIScreen mainScreen].bounds.size.height, view.frame.size.width, view.frame.size.height)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, [UIScreen mainScreen].bounds.size.height)];
            }
        }
    }];
    self.tabBarShowing = NO;
}

@end
