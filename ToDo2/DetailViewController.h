//
//  DetailViewController.h
//  ToDo2
//
//  Created by Tom Williamson on 5/3/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSManagedObject* detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

