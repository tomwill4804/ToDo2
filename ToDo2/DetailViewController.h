//
//  DetailViewController.h
//  ToDo2
//
//  Created by Tom Williamson on 5/3/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) NSManagedObject* detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UITextField *descTextField;
@property (weak, nonatomic) IBOutlet UIButton *dueDateField;
@property (weak, nonatomic) IBOutlet UISwitch *doneSwitch;
@property (weak, nonatomic) IBOutlet UITextView *noteText;

@property (strong, nonatomic) NSDate* rawdate;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

