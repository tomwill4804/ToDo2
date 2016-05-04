//
//  DateViewController.m
//  ToDo2
//
//  Created by Tom Williamson on 5/3/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@end

@implementation DateViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.date = [[NSDate alloc] init];
    

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

-(IBAction)dateChanged:(UIDatePicker*)sender{
    
    self.date = sender.date;
    
    
}




@end
