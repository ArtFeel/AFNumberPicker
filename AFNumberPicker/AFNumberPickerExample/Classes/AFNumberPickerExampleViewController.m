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

    self.view.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];

    if ( !self.testPicker ) {
        self.testPicker = [[AFNumberPicker alloc] initWithFrame:CGRectMake(20, 20, 280, 65)];
        self.testPicker.decimalNumbersLength = 1;
        self.testPicker.contentInset = UIEdgeInsetsMake(5, 6, 5, 5);
        self.testPicker.backgroundImage = [UIImage imageNamed:@"picker-background"];
        self.testPicker.foregroundImage = [UIImage imageNamed:@"picker-foreground"];
        self.testPicker.separatorImage = [UIImage imageNamed:@"picker-separator"];
        self.testPicker.numberColor = [UIColor colorWithWhite:0.6 alpha:1];
        self.testPicker.innerShadowColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.testPicker.outerShadowColor = [UIColor colorWithWhite:1 alpha:0.55];
        self.testPicker.dataSource = self;
        self.testPicker.delegate = self;
        [self.view addSubview:self.testPicker];
    }
}


#pragma mark - AFNumberPickerDataSource

- (NSUInteger)numberOfComponentsInNumberPicker:(AFNumberPicker *)numberPicker {
    return 6;
}


#pragma mark - AFNumberPickerDelegate

- (void)numberPicker:(AFNumberPicker *)numberPicker didChangeValue:(double)value {
    NSLog(@"Picker value: %06.1f", value);
}


@end