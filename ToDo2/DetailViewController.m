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
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-YYYY HH:mm:ss"];
        
        self.descTextField.text = [[self.detailItem valueForKey:@"desc"] description];
        self.dueDateField.text = [[self.detailItem valueForKey:@"duedate"] description];
        self.doneSwitch.selected = [[self.detailItem valueForKey:@"done"] boolValue];
        self.noteText.text = [[self.detailItem valueForKey:@"note"] description];
    }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self configureView];
    
}



-(IBAction)cancelButtonTapped:(UIButton*)sender{
    
    [self configureView];
    
}

//
//  save data
//
- (IBAction)saveButtonClicked:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-YYYY HH:mm:ss"];
    
    [self.detailItem setValue:self.descTextField.text  forKey:@"desc"];
    [self.detailItem setValue:[dateFormatter dateFromString:self.dueDateField.text]
                       forKey:@"duedate"];
    [self.detailItem setValue:[NSNumber numberWithBool:self.doneSwitch.on] forKey:@"done"];
    [self.detailItem setValue:self.noteText.text  forKey:@"note"];
    
    NSError *error = nil;
    if (![self.detailItem.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
    
}

@end
