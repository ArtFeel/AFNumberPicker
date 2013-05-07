//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFNumberPicker.h"
#import "AFNumberPickerComponent.h"


@interface AFNumberPicker ()

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


#pragma mark - Private methods

- (void)reloadPicker {
    [self removeComponents];
    [self createComponents];
}


- (void)createComponents {
    NSInteger numberOfComponents = [self.dataSource numberOfComponentsInNumberPicker:self];

    if ( numberOfComponents > 0 ) {
        CGFloat componentHeight = CGRectGetHeight(self.frame);
        CGFloat componentWidth = floorf(CGRectGetWidth(self.frame) / numberOfComponents);

        for (int i = 0; i < numberOfComponents; i++) {
            CGRect frame = CGRectMake(i * componentWidth, 0, componentWidth, componentHeight);
            AFNumberPickerComponent * component = [[AFNumberPickerComponent alloc] initWithFrame:frame];
            [self addSubview:component];
        }
    }
}


- (void)removeComponents {
    for (UIView * component in self.pickerComponents) {
        [component removeFromSuperview];
    }
}


@end