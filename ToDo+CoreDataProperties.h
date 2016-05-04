//
//  ToDo+CoreDataProperties.h
//  ToDo2
//
//  Created by Tom Williamson on 5/3/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSNumber *done;
@property (nullable, nonatomic, retain) NSDate *duedate;
@property (nullable, nonatomic, retain) NSNumber *important;
@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSManagedObject *group;

@end

NS_ASSUME_NONNULL_END
