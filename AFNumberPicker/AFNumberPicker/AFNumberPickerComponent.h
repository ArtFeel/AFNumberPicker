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
* Designed initializer for creation component with specified value.
*/
- (id)initWithFrame:(CGRect)frame andNumber:(NSInteger)number;

@end