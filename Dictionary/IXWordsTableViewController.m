//
//  IXWordsTableViewController.m
//  Dictionary
//
//  Created by Javier García Gallego on 28/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXWordsTableViewController.h"
#import "IXDefinitionViewController.h"
#import "IXWordsModel.h"

@interface IXWordsTableViewController ()

@end

@implementation IXWordsTableViewController

-(id)initWithModel:(IXWordsModel *) aModel tableStyle:(UITableViewStyle) aStyle {
    if (self = [self initWithStyle:aStyle]) {
        _words = aModel;
        numberOfSections = [[aModel letters] count];
        self.title = @"English Vocabulary";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0.12 alpha:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.words letters] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.words wordsAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // Pedirle a la tabla una celda (si la tiene)
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Si me han devuelto nil, la creo a pelo
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Sincronizo celda con personaje
    
    cell.textLabel.text = [self.words wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section];
    
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Averiguar de qué palabra se trata
    
    NSString *word = [self.words wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section];
    
    // Comprobamos que el delegado implementa el método
    
    if ([self.delegate respondsToSelector:@selector(wordTableViewController:didSelectWord:)]) {
        
        // Enviamos mensaje a nuestro delegado
        [self.delegate wordTableViewController:self didSelectWord:word];

        // Además enviamos una notificación
        NSNotification *note = [NSNotification notificationWithName:NOTIFICATION_NAME
                                                             object:self
                                                           userInfo:@{CHARACTER_KEY : word}];
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotification:note];
    }
}

#pragma mark - IXWordsTableViewControllerDelegate

- (void)wordTableViewController:(IXWordsTableViewController *) sender didSelectWord:(NSString *) word{
    
    // Crear un controlador para la palabra
    
    IXDefinitionViewController *wordVC = [[IXDefinitionViewController alloc] initWithModel:word];
    
    // Hacemos un push al navigation controller dentro del cual estamos
    
    [self.navigationController pushViewController:wordVC animated:YES];
}

@end
