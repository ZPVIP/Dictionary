//
//  IXAppDelegate.h
//  Dictionary
//
//  Created by Javier García Gallego on 28/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IXWordsModel, IXWordsTableViewController, IXDefinitionViewController;

@interface IXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IXWordsModel *wordsModel;
@property (strong, nonatomic) IXDefinitionViewController *wordDefinitionVC;
@property (strong, nonatomic) IXWordsTableViewController *wordsTableVC;
@property (strong, nonatomic) UINavigationController *wordsTableNC;
@property (weak, nonatomic) id delegate;

@end
