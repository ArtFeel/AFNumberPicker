//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AFNumberPickerComponent : UIView

@property (nonatomic, assign) NSInteger currentValue;

- (id)initWithFrame:(CGRect)frame andNumber:(NSInteger)number;

@end