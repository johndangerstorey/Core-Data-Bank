//
//  DBAddMemberViewController.m
//  Core Data Bank
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBAddMemberViewController.h"

@interface DBAddMemberViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DBAddMemberViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
