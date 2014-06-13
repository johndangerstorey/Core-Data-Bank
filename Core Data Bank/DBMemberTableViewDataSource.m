//
//  DBMemberTableViewDataSource.m
//  Core Data Bank
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberTableViewDataSource.h"
#import "Member.h"

NSString *const MemberCellIdentifier = @"Cell";

@interface DBMemberTableViewDataSource () <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation DBMemberTableViewDataSource

-(void)registerTableView:(UITableView *)tableView{
    self.tableView = tableView;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MemberCellIdentifier];
}
-(Member *)childAtIndexPath:(NSIndexPath *)indexPath{
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (void) setMember:(Member *)member {
    _member = member;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    return sectionInfo.numberOfObjects;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MemberCellIdentifier forIndexPath:indexPath];
    
    Member *member = [self childAtIndexPath:indexPath];
    
    cell.textLabel.text = member.title;
    
    return cell;
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath{
    if (type ==NSFe)
}

@end
