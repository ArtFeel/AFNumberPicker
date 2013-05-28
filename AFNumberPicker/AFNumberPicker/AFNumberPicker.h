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

@end