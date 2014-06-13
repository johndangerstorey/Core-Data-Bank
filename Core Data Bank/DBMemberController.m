//
//  DBMemberController.m
//  Core Data Bank
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberController.h"
#import "DBAppDelegate.h"
#import "DBMemberController.h"
#import "Member.h"

@interface DBMemberController ()

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation DBMemberController


+ (DBMemberController *)sharedInstance {
    static DBMemberController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DBMemberController new];
        
        DBAppDelegate *appDelegate = (DBAppDelegate *)[UIApplication sharedApplication].delegate;
        
        sharedInstance.managedObjectContext = appDelegate.stack.managedObjectContext;
        
    });
    
    return sharedInstance;
}

- (Member *)rootMember {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Member"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"parent = %@", nil];
    
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    Member *member = [results lastObject];
    
    if (member == nil) {
        member = [DBMemberController insertMemberWithTitle:nil parent:nil inManagedobjectContext:self.managedObjectContext];
    }
    
    return member;
}

+ (Member *)insertMemberWithTitle:(NSString *)title parent:(Member *)parent inManagedobjectContext:(NSManagedObjectContext *)context{
    
    Member *member = [NSEntityDescription insertNewObjectForEntityForName:@"Member"
                                                   inManagedObjectContext:context];
    member.title = title;
    member.parent = parent;
    
    return member;
    
}


@end
