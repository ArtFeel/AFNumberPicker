//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFNumberPickerExampleViewController.h"
#import "AFNumberPicker.h"


@interface AFNumberPickerExampleViewController () <AFNumberPickerDataSource, AFNumberPickerDelegate>

@property(nonatomic, strong) AFNumberPicker * testPicker;

@end


@implementation AFNumberPickerExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    if ( !self.testPicker ) {
        self.testPicker = [[AFNumberPicker alloc] initWithFrame:CGRectMake(10, 10, 300, 60)];
        self.testPicker.dataSource = self;
        self.testPicker.delegate = self;
        [self.view addSubview:self.testPicker];
    }
}


#pragma mark - AFNumberPickerDataSource

- (NSInteger)numberOfComponentsInNumberPicker:(AFNumberPicker *)numberPicker {
    return 6;
}


#pragma mark - AFNumberPickerDelegate

- (void)numberPicker:(AFNumberPicker *)numberPicker didChangeValue:(CGFloat)value {
    NSLog(@"New value in delegate: %f", value);
}


@end