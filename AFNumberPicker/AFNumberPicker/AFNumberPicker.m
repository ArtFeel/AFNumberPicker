//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFNumberPicker.h"
#import "AFNumberPickerComponent.h"
#import "AFNumberPickerComponentDelegate.h"


@interface AFNumberPicker () <AFNumberPickerComponentDelegate>

@property (nonatomic, strong) NSArray * pickerComponents;

- (void)reloadPicker;
- (void)createComponents;
- (void)removeComponents;

@end


@implementation AFNumberPicker

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}


#pragma mark - Properties

- (void)setDataSource:(id<AFNumberPickerDataSource>)dataSource {
    if ( ![_dataSource isEqual:dataSource] ) {
        _dataSource = dataSource;
        [self reloadPicker];
    }
}


- (void)setValue:(double)value {
    if ( _value != value ) {
        _value = value;
        // TODO: change value in all components
    }
}


#pragma mark - Private methods

- (void)reloadPicker {
    [self removeComponents];
    [self createComponents];
}


- (void)createComponents {
    NSUInteger numberOfComponents = [self.dataSource numberOfComponentsInNumberPicker:self];
    NSMutableArray * components = [NSMutableArray arrayWithCapacity:numberOfComponents];

    if ( numberOfComponents > 0 ) {
        CGFloat componentHeight = CGRectGetHeight(self.frame);
        CGFloat componentWidth = floorf(CGRectGetWidth(self.frame) / numberOfComponents);

        for (int i = 0; i < numberOfComponents; i++) {
            CGRect frame = CGRectMake(i * componentWidth, 0, componentWidth, componentHeight);

            AFNumberPickerComponent * component = [[AFNumberPickerComponent alloc] initWithFrame:frame];
            component.delegate = self;

            [components addObject:component];
            [self addSubview:component];
        }
    }

    self.pickerComponents = [components copy];
}


- (void)removeComponents {
    for (UIView * component in self.pickerComponents) {
        [component removeFromSuperview];
    }
}


#pragma mark - Value calculation

- (void)updateTotalValue {
    double newValue = 0;

    for (AFNumberPickerComponent * component in self.pickerComponents) {
        newValue = newValue * 10 + component.value;
    }

    // Set iVar to prevent updating components
    _value = newValue;
}


#pragma mark - AFNumberPickerComponentDelegate methods

- (void)numberPickerComponent:(AFNumberPickerComponent *)component didChangeValue:(NSInteger)value {
    [self updateTotalValue];
}


@end