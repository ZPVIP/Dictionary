//
//  IXWordsTableViewController.h
//  Dictionary
//
//  Created by Javier García Gallego on 28/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXWordsTableViewControllerDelegate.h"

#define NOTIFICATION_NAME @"wordHasChanged"
#define CHARACTER_KEY @"word"

@class IXWordsModel;

int numberOfSections;

@interface IXWordsTableViewController : UITableViewController <IXWordsTableViewControllerDelegate>

@property (strong, nonatomic) IXWordsModel *words;
@property (weak, nonatomic) id<IXWordsTableViewControllerDelegate> delegate;


-(id)initWithModel:(IXWordsModel *) aModel tableStyle:(UITableViewStyle) aStyle;

@end
