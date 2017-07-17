//
//  ViewController.h
//  MAMapKit_3D_Demo
//
//  Created by 翁乐 on 8/9/16.
//  Copyright © 2016 Autonavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@protocol ViewControllerDelegate <NSObject>

- (BOOL)viewController:(ViewController*)vc itemSelected:(NSString *)itemClassName title:(NSString *)title;
- (NSString *)viewController:(ViewController*)vc displayTileOf:(NSString *)itemClassName;


@end

@interface ViewController : UIViewController

@property (nonatomic, weak) id<ViewControllerDelegate> delegate;

@end

