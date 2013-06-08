//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AFNumberPickerExampleViewController.h"
#import "AFNumberPicker.h"


@interface AFNumberPickerExampleViewController () <AFNumberPickerDataSource, AFNumberPickerDelegate>

- (void)setupSimplePicker;
- (void)setupDecimalPicker;
- (void)setupReadonlyPicker;

@end


@implementation AFNumberPickerExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupSimplePicker];
    [self setupDecimalPicker];
    [self setupReadonlyPicker];

    self.contentView.layer.cornerRadius = 10;
}


#pragma mark - AFNumberPickerDataSource

- (NSUInteger)numberOfComponentsInNumberPicker:(AFNumberPicker *)numberPicker {
    return 6;
}


#pragma mark - AFNumberPickerDelegate

- (void)numberPicker:(AFNumberPicker *)numberPicker didChangeValue:(double)value {
    if ( [numberPicker isEqual:self.simplePicker] ) {
        self.simpleLabel.text = [NSString stringWithFormat:@"Simple Picker Value: %06.0f", value];
    } else if ( [numberPicker isEqual:self.decimalPicker] ) {
        self.decimalLabel.text = [NSString stringWithFormat:@"Decimal Picker Value: %07.1f", value];
        self.readonlyPicker.value = value;
    } else {
        self.readonlyLabel.text = [NSString stringWithFormat:@"Read Only Picker Value: %07.1f", value];
    }
}


#pragma mark - Picker customization

- (void)setupSimplePicker {
    self.simplePicker.contentInset = UIEdgeInsetsMake(5, 6, 5, 5);
    self.simplePicker.backgroundImage = [UIImage imageNamed:@"picker-background"];
    self.simplePicker.foregroundImage = [UIImage imageNamed:@"picker-foreground"];
    self.simplePicker.separatorImage = [UIImage imageNamed:@"picker-separator"];
    self.simplePicker.numberColor = [UIColor colorWithWhite:0.6 alpha:1];
    self.simplePicker.innerShadowColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.simplePicker.outerShadowColor = [UIColor colorWithWhite:1 alpha:0.55];
    self.simplePicker.dataSource = self;
    self.simplePicker.delegate = self;
}


- (void)setupDecimalPicker {
    self.decimalPicker.contentInset = UIEdgeInsetsMake(5, 7, 5, 5);
    self.decimalPicker.backgroundImage = [UIImage imageNamed:@"picker-decimal-background"];
    self.decimalPicker.foregroundImage = [UIImage imageNamed:@"picker-foreground"];
    self.decimalPicker.separatorImage = [UIImage imageNamed:@"picker-separator"];
    self.decimalPicker.numberColor = [UIColor colorWithWhite:0.6 alpha:1];
    self.decimalPicker.innerShadowColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.decimalPicker.outerShadowColor = [UIColor colorWithWhite:1 alpha:0.55];
    self.decimalPicker.decimalNumbersLength = 1;
    self.decimalPicker.dataSource = self;
    self.decimalPicker.delegate = self;
}


- (void)setupReadonlyPicker {
    self.readonlyPicker.dataSource = self;
    self.readonlyPicker.delegate = self;
}

@end