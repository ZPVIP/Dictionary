//
//  IXWordsTableViewControllerDelegate.h
//  Dictionary
//
//  Created by Javier García Gallego on 29/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IXWordsTableViewController;

@protocol IXWordsTableViewControllerDelegate <NSObject>
@optional

- (void)wordTableViewController:(IXWordsTableViewController *) sender didSelectWord:(NSString *) word;

@end
