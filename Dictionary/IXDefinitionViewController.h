//
//  IXDefinitionViewController.h
//  Dictionary
//
//  Created by Javier García Gallego on 29/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXWordsTableViewControllerDelegate.h"

@interface IXDefinitionViewController : UIViewController <UISplitViewControllerDelegate,UIWebViewDelegate, IXWordsTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wordWebDefinition;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSString *model;

- (id) initWithModel:(NSString *) aModel;

-(NSURLRequest *) definitionRequestForWord:(NSString *) aWord;

@end
