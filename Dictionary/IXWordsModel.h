//
//  IXWordsModel.h
//  Dictionary
//
//  Created by Javier García Gallego on 28/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IXWordsModel : NSObject

@property (strong) NSDictionary *words;

-(NSArray *) letters;
-(NSString *) letterAtIndex: (NSInteger) aLetterIndex;
-(NSString *) wordAtIndex:(NSInteger) aWordIndex inLetterAtIndex:(NSInteger) aLetterIndex;
-(NSArray *) wordsAtIndex:(NSInteger) anIndex;

@end
