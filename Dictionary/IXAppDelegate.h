//
//  IXAppDelegate.h
//  Dictionary
//
//  Created by Javier García Gallego on 28/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IXViewController;

@interface IXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IXViewController *viewController;

@end
