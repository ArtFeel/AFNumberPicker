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

@property (nonatomic, strong) UIImageView * backgroundImageView;

@property (nonatomic, strong) NSMutableArray * separators;
@property (nonatomic, strong) NSMutableArray * pickerComponents;

- (void)reloadPicker;
- (void)createUI;
- (void)removeUI;

- (UIImageView *)newSeparatorWithFrame:(CGRect)frame;
- (AFNumberPickerComponent *)newComponentWithFrame:(CGRect)frame;

- (void)updateBackgroundImage;
- (void)updateSeparators;

@end


@implementation AFNumberPicker

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.contentInset = UIEdgeInsetsZero;
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


- (void)setContentInset:(UIEdgeInsets)contentInset {
    if ( !UIEdgeInsetsEqualToEdgeInsets(_contentInset, contentInset) ) {
        _contentInset = contentInset;
        [self reloadPicker];
    }
}


- (void)setBackgroundImage:(UIImage *)backgroundImage {
    if ( ![_backgroundImage isEqual:backgroundImage] ) {
        _backgroundImage = backgroundImage;
        [self updateBackgroundImage];
    }
}


- (void)setSeparatorImage:(UIImage *)separatorImage {
    if ( ![_separatorImage isEqual:separatorImage] ) {
        _separatorImage = separatorImage;
        [self updateSeparators];
    }
}


#pragma mark - Private methods

- (void)reloadPicker {
    // No datasource — no needs to create ui
    if ( self.dataSource ) {
        [self removeUI];
        [self createUI];
    }
}


- (void)createUI {
    NSUInteger numberOfComponents = [self.dataSource numberOfComponentsInNumberPicker:self];
    NSUInteger numberOfSeparators = numberOfComponents + 1;
    NSMutableArray * components = [NSMutableArray arrayWithCapacity:numberOfComponents];
    NSMutableArray * separators = [NSMutableArray arrayWithCapacity:numberOfSeparators];

    if ( numberOfComponents > 0 ) {
        // Insets
        CGFloat topInset = self.contentInset.top;
        CGFloat leftInset = self.contentInset.left;
        CGFloat verticalInsets = topInset + self.contentInset.bottom;
        CGFloat horizontalInsets = leftInset + self.contentInset.right;
        CGFloat separatorWidth = self.separatorImage.size.width;

        // Components size
        CGFloat selfHeight = CGRectGetHeight(self.frame);
        CGFloat selfWidth = CGRectGetWidth(self.frame);
        CGFloat separatorsTotalWidth = numberOfSeparators * separatorWidth;
        CGFloat componentHeight = floorf(selfHeight - verticalInsets);
        CGFloat componentWidth = floorf((selfWidth - horizontalInsets - separatorsTotalWidth) / numberOfComponents);

        // Create separators and components
        for (int i = 0; i < numberOfComponents; i++) {
            CGFloat separatorLeft = leftInset + (i * separatorWidth) + (i * componentWidth);
            CGRect separatorFrame = CGRectMake(separatorLeft, topInset, separatorWidth, componentHeight);
            UIImageView * separator = [self newSeparatorWithFrame:separatorFrame];

            [separators addObject:separator];
            [self addSubview:separator];

            CGRect componentFrame = CGRectMake(separatorLeft + separatorWidth, topInset, componentWidth, componentHeight);
            AFNumberPickerComponent * component = [self newComponentWithFrame:componentFrame];

            [components addObject:component];
            [self addSubview:component];
        }

        // And final separator
        CGFloat separatorLeft = leftInset + separatorWidth * numberOfComponents + componentWidth * numberOfComponents;
        CGRect separatorFrame = CGRectMake(separatorLeft, topInset, separatorWidth, componentHeight);
        UIImageView * separator = [self newSeparatorWithFrame:separatorFrame];

        [separators addObject:separator];
        [self addSubview:separator];
    }

    self.pickerComponents = components;
    self.separators = separators;
}


- (void)removeUI {
    for (UIView * separator in self.separators) {
        [separator removeFromSuperview];
    }
    
    for (UIView * component in self.pickerComponents) {
        [component removeFromSuperview];
    }
}


- (UIImageView *)newSeparatorWithFrame:(CGRect)frame {
    UIImageView * separator = [[UIImageView alloc] initWithImage:self.separatorImage];
    separator.frame = frame;
    return separator;
}


- (AFNumberPickerComponent *)newComponentWithFrame:(CGRect)frame {
    AFNumberPickerComponent * component = [[AFNumberPickerComponent alloc] initWithFrame:frame];
    component.delegate = self;
    return component;
}


- (void)updateBackgroundImage {
    if ( !self.backgroundImageView ) {
        self.backgroundImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
        self.backgroundImageView.frame = self.bounds;
        [self insertSubview:self.backgroundImageView atIndex:0];
    } else {
        self.backgroundImageView.image = self.backgroundImage;
    }
}


- (void)updateSeparators {
    for (UIImageView *separatorView in self.separators) {
        separatorView.image = self.separatorImage;
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

    [self notifyAboutChangingValue];
}


#pragma mark - AFNumberPickerComponentDelegate methods

- (void)numberPickerComponent:(AFNumberPickerComponent *)component didChangeValue:(NSInteger)value {
    [self updateTotalValue];
}


#pragma mark - Delegate notifications

- (void)notifyAboutChangingValue {
    if ( self.delegate && [self.delegate respondsToSelector:@selector(numberPicker:didChangeValue:)] ) {
        [self.delegate numberPicker:self didChangeValue:self.value];
    }
}


@end