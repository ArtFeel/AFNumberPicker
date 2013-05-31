//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFNumberPickerComponentDelegate;


/**
* AFNumberPickerComponent object
*
* This is a part of AFNumberPicker
*/
@interface AFNumberPickerComponent : UIView

/**
* Currently selected value.
*/
@property (nonatomic, readonly) NSInteger value;

/**
* The delegate of a AFNumberPickerComponent object.
*
* Implement methods of AFNumberPickerComponentDelegate to respond to new selections of component value.
*/
@property (nonatomic, assign) id<AFNumberPickerComponentDelegate> delegate;

/**
* The font of the number.
*/
@property (nonatomic, strong) UIFont * numberFont;

/**
* The color of the number.
*/
@property (nonatomic, strong) UIColor * numberColor;

/**
* The inner shadow color of the text.
*/
@property (nonatomic, strong) UIColor * innerShadowColor;

/**
* The inner shadow offset (measured in points) for the text.
*/
@property (nonatomic, assign) CGSize innerShadowOffset;

/**
* The outer shadow color of the text.
*/
@property (nonatomic, strong) UIColor * outerShadowColor;

/**
* The outer shadow offset (measured in points) for the text.
*/
@property (nonatomic, assign) CGSize outerShadowOffset;


/**
* Designed initializer for creation component with specified value.
*/
- (id)initWithFrame:(CGRect)frame andNumber:(NSInteger)number;

@end