//
//  IXDefinitionViewController.m
//  Dictionary
//
//  Created by Javier García Gallego on 29/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXDefinitionViewController.h"

@interface IXDefinitionViewController ()

@end

@implementation IXDefinitionViewController

- (id) initWithModel:(NSString *) aModel {
    if (self = [super init]) {
        _model = aModel;
        self.title = self.model;
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Sincronizar modelo y vista
    if (self.model) {
        NSURLRequest *request = [self definitionRequestForWord:self.model];
        [self.wordWebDefinition loadRequest:request];
    }
    
    // Cambiamos el color de la barra de navegación
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0.12 alpha:1];

}

// Obtenemos la request desde la palabra a buscar

-(NSURLRequest *) definitionRequestForWord:(NSString *) aWord {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@",aWord]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    return request;
}

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    // ponemos el botón en la barra
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - IXWordsTableViewControllerDelegate

- (void)wordTableViewController:(IXWordsTableViewController *) sender didSelectWord:(NSString *) word {
    
    // Cambiamos nuestro modelo
    self.model = word;
    
    // Actualizamos title
    self.title = self.model;
    if (self.model) {
        NSURLRequest *request = [self definitionRequestForWord:self.model];
        [self.wordWebDefinition loadRequest:request];
    }
}

# pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) || (navigationType == UIWebViewNavigationTypeFormSubmitted)) {
        return NO;
    } else {
        return YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
