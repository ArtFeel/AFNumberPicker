//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFNumberPicker;


@interface AFNumberPickerExampleViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView * contentView;

@property (nonatomic, weak) IBOutlet AFNumberPicker * simplePicker;
@property (nonatomic, weak) IBOutlet UILabel * simpleLabel;

@property (nonatomic, weak) IBOutlet AFNumberPicker * decimalPicker;
@property (nonatomic, weak) IBOutlet UILabel * decimalLabel;

@property (nonatomic, weak) IBOutlet AFNumberPicker * readonlyPicker;
@property (nonatomic, weak) IBOutlet UILabel * readonlyLabel;

@end