//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 06.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFNumberPicker;


/** @name AFNumberPickerDataSource */

/**
* The AFNumberPickerDataSource protocol must be adopted by an object that mediates between a AFNumberPicker object
* and your application’s data model for that picker view.
*
* The data source provides the picker view with the number of components for displaying the picker view data.
* All methods in this protocol are required.
*/
@protocol AFNumberPickerDataSource <NSObject>

@required

/**
* Called by the picker view when it needs the number of components. (required)
*
* @param numberPicker The number picker requesting the data.
*
* @return The number of components (or “columns”) that the number picker should display.
*/
- (NSUInteger)numberOfComponentsInNumberPicker:(AFNumberPicker *)numberPicker;

@end


/** @name AFNumberPickerDelegate */

/**
* The delegate of a AFNumberPicker object
*
* Typically the delegate implements this methods to respond to new selections of component values.
*/
@protocol AFNumberPickerDelegate <NSObject>

@optional

/**
* Called by the number picker when the user change value in any of components.
*
* @param numberPicker An object representing the number picker.
* @param value New value that user selected
*
*/
- (void)numberPicker:(AFNumberPicker *)numberPicker didChangeValue:(double)value;

@end