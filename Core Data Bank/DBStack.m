//
//  DBStack.m
//  Core Data Bank
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBStack.h"

@implementation DBStack

- (id) init {
    self = [super init];
    
    return self;
}

- (void)setupManagedObject {
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSError *error;
    [self.managedObjectContext.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                       configuration:nil
                                                                                 URL:self.storeURL
                                                                             options:nil
                                                                               error:&error];
}

-(NSURL *)modelURL {
    return [[NSBundle mainBundle] URLForResource:@"CoreDataBank" withExtension:@"momd"];
}

- (NSURL *)storeURL {
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentationDirectory
                                                                       inDomain:NSUserDomainMask
                                                              appropriateForURL:nil
                                                                         create:YES
                                                                          error:nil];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSManagedObjectModel *)managedObjectModel {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}
@end
