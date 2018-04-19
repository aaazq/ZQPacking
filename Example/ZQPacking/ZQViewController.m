//
//  ZQViewController.m
//  ZQPacking
//
//  Created by 13525505765@163.com on 04/18/2018.
//  Copyright (c) 2018 13525505765@163.com. All rights reserved.
//

#import "ZQViewController.h"
#import <ZQPacking/ZQPacking.h>
#import <ZQPacking/NSObject+ZQHelper.h>
@interface ZQViewController ()

@end

@implementation ZQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.width = 10;
    
    NSLog(@"%zd", [[self class] getIdentifier]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
