//
//  DetailViewController.m
//  ToDo2
//
//  Created by Tom Williamson on 5/3/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "DetailViewController.h"
#import "DateViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

//
//  new object value being set
//
- (void)setDetailItem:(id)newDetailItem {
    
    if (newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
        self.saveButton.enabled = YES;
    }
    else
        self.saveButton.enabled = NO;
}


//
//  set fields based on current object
//
- (void)configureView {
   
    if (self.detailItem) {
        
        
        self.descTextField.text = [self.detailItem valueForKey:@"desc"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        self.rawdate = [self.detailItem valueForKey:@"duedate"];
        NSString* sdate = [dateFormatter stringFromDate:self.rawdate];
        [self.dueDateField setTitle:sdate forState: UIControlStateNormal];
        
        self.doneSwitch.on = [[self.detailItem valueForKey:@"done"] boolValue];
        self.noteText.text = [self.detailItem valueForKey:@"note"];
    }
    
}

//
//  build initial view
//
- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self configureView];
    
}


//
//  reload fields
//
-(IBAction)cancelButtonTapped:(UIButton*)sender{
    
    [self configureView];
    
}

//
//  save data
//
- (IBAction)saveButtonClicked:(id)sender {
    
    //
    //  set object attributes
    //
    
    [self.detailItem setValue:self.descTextField.text  forKey:@"desc"];
    [self.detailItem setValue:self.rawdate forKey:@"duedate"];
    [self.detailItem setValue:[NSNumber numberWithBool:self.doneSwitch.on] forKey:@"done"];
    [self.detailItem setValue:self.noteText.text  forKey:@"note"];
    
    //
    //  save object
    //
    NSError *error = nil;
    if (![self.detailItem.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    

}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"date"]) {
        DateViewController *controller = (DateViewController *)[segue destinationViewController];
        controller.date = [self.detailItem valueForKey:@"duedate"];
    }
    
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
    if ([[segue identifier] isEqualToString:@"date"]) {
        
        DateViewController *vc = (DateViewController *)segue.sourceViewController;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        
        self.rawdate = vc.date;
        NSString* sdate = [dateFormatter stringFromDate:self.rawdate];
        [self.dueDateField setTitle:sdate forState: UIControlStateNormal];

    }


}

@end
