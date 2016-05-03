//
//  DetailViewController.m
//  ToDo2
//
//  Created by Tom Williamson on 5/3/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
        
    }
}

- (void)configureView {
   
    if (self.detailItem) {
        
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self configureView];
    
}



-(IBAction)cancelButtonTapped:(UIButton*)sender{
    
    //self.textField.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    
}

-(IBAction)savedButtonTapped:(UIButton*)sender{
    
    //[self.detailItem setValue:newDate  forKey:@"timeStamp"];
    
    NSError *error = nil;
    if (![self.detailItem.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
}


@end
