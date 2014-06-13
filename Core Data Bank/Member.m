//
//  Member.m
//  Core Data Bank
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "Member.h"
#import "Member.h"


@implementation Member

@dynamic title;
@dynamic parent;
@dynamic children;

- (NSFetchedResultsController *)childrenFetchedResultsController{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Member"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat: @"parent = %@", self];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"order" ascending:YES]];
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                               managedObjectContext:self.managedObjectContext
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}

@end
