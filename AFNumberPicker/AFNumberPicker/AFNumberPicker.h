//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNumberPickerProtocol.h"


@interface AFNumberPicker : UIView

@property (nonatomic, assign) double value;

@property (nonatomic, assign) id<AFNumberPickerDataSource> dataSource;
@property (nonatomic, assign) id<AFNumberPickerDelegate> delegate;

@property (nonatomic, assign) UIEdgeInsets contentInset;

@property (nonatomic, strong) UIImage * backgroundImage;
@property (nonatomic, strong) UIImage * foregroundImage;
@property (nonatomic, strong) UIImage * separatorImage;

/**
* The font of the number.
*
* The default value for this property is the bold system font at a size of 30 points
* (using the boldSystemFontOfSize: class method of UIFont).
*/
@property (nonatomic, strong) UIFont * numberFont;

/**
* The color of the number.
*
* The default value for this property is a black color (set through the blackColor class method of UIColor).
*/
@property (nonatomic, strong) UIColor * numberColor;

/**
* The inner shadow color of the text.
*
* The default value for this property is nil, which indicates that no inner shadow is drawn.
* In addition to this property, you may also want to change the default inner shadow offset by modifying the
* innerShadowOffset property. Text shadows are drawn with the specified offset and color and no blurring.
*/
@property (nonatomic, strong) UIColor * innerShadowColor;

/**
* The inner shadow offset (measured in points) for the text.
*
* The shadow color must be non-nil for this property to have any effect. The default offset size is (0, -1),
* which indicates a shadow one point above the text.
*/
@property (nonatomic, assign) CGSize innerShadowOffset;

/**
* The outer shadow color of the text.
*
* The default value for this property is nil, which indicates that no outer shadow is drawn.
* In addition to this property, you may also want to change the default outer shadow offset by modifying the
* outerShadowOffset property. Text shadows are drawn with the specified offset and color and no blurring.
*/
@property (nonatomic, strong) UIColor * outerShadowColor;

/**
* The outer shadow offset (measured in points) for the text.
*
* The shadow color must be non-nil for this property to have any effect. The default offset size is (0, 1),
* which indicates a shadow one point below the text.
*/
@property (nonatomic, assign) CGSize outerShadowOffset;


/**
* Reloads all components of the receiver.
*
* Call this method to reload all the data that is used to construct the picker, including component cells,
* separator images, recalculating component sizes based on new contentInset, and so on. The picker view's delegate
* or data source calls this method when it wants the table view to completely reload its data and apply new styles.
*
* If dataSource is nil. This method will do nothing.
*/
- (void)reloadPicker;

@end