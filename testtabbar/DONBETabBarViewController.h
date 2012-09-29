//
//  DONBETabBarViewController.h
//  testtabbar
//
//  Created by Chu Mohua on 12-9-29.
//  Copyright (c) 2012年 Chu Mohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DONBETabBarViewController : UITabBarController{

}

@property(nonatomic) BOOL tabBarShowing;

-(void)selectTab:(int)tabID;

-(void)setupCustomElements:(NSArray *)buttons;
-(void)setupBackground:(NSString *)imageName;

- (void)showTabBar;
- (void)hideTabBar;

-(void)hideTopShadow:(BOOL)flag;
@end
