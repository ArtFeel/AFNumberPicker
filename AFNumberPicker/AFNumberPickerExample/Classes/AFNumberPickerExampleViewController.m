//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFNumberPickerExampleViewController.h"
#import "AFNumberPickerComponent.h"


@interface AFNumberPickerExampleViewController ()

@property(nonatomic, strong) AFNumberPickerComponent * testComponent;

@end


@implementation AFNumberPickerExampleViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    if ( !self.testComponent ) {
        self.testComponent = [[AFNumberPickerComponent alloc] initWithFrame:CGRectMake(20, 20, 50, 65) andNumber:4];
        [self.view addSubview:self.testComponent];
    }
}


@end