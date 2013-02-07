//
//  IXWordsModel.m
//  Dictionary
//
//  Created by Javier García Gallego on 28/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXWordsModel.h"

@implementation IXWordsModel

#pragma mark - Properties
@synthesize words;

#pragma mark - Init
-(id) init{
    if (self = [super init]) {
        NSURL *urlToFile = [[NSBundle mainBundle] URLForResource:@"vocabwords1" withExtension:@"txt"];
        self.words = [NSDictionary dictionaryWithContentsOfURL:urlToFile];
    }
    return self;
}

#pragma mark -

// Devuelve Array de todas las letras

-(NSArray *) letters{
    return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

// Devuelve la letra en el índice pasado

-(NSString *) letterAtIndex: (NSInteger) aLetterIndex{
    return [[self letters] objectAtIndex:aLetterIndex];
}

// Devuelve la palabra en el índice pasado de la sección pasada

-(NSString *) wordAtIndex:(NSInteger) aWordIndex
          inLetterAtIndex:(NSInteger) aLetterIndex{
    NSString *letter = [self letterAtIndex:aLetterIndex];
    NSArray *wordsThatStartWithLetter = [self.words objectForKey:letter];
    return [wordsThatStartWithLetter objectAtIndex:aWordIndex];
}

// Devuelve Array ordenado de palabras de la letra pasada en el índice

-(NSArray *) wordsAtIndex:(NSInteger)anIndex{
    NSString *letter = [[self letters] objectAtIndex:anIndex];
    return [[self.words objectForKey:letter] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

@end