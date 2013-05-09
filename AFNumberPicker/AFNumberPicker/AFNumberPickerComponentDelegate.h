//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 09.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AFNumberPickerComponent;


/**
* The delegate of a AFNumberPickerComponent object
*
* Typically the delegate implements this methods to respond to new selections of component values.
*/
@protocol AFNumberPickerComponentDelegate <NSObject>

@optional

/**
* Called by the number picker when the user change value in any of components.
*
* @param numberPicker An object representing the number picker.
* @param value New value that user selected
*
*/
- (void)numberPickerComponent:(AFNumberPickerComponent *)component didChangeValue:(NSInteger)value;

@end