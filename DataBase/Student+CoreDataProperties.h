//
//  Student+CoreDataProperties.h
//  DataBase
//
//  Created by MAC on 4/28/17.
//  Copyright © 2017 MAC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *rollono;
@property (nullable, nonatomic, retain) NSString *branch;

@end

NS_ASSUME_NONNULL_END
