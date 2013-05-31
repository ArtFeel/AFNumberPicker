//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AFNumberPickerComponentCell : UITableViewCell

@property (nonatomic, strong) UIFont  * numberFont;
@property (nonatomic, strong) UIColor * numberColor;
@property (nonatomic, strong) UIColor * innerShadowColor;
@property (nonatomic, strong) UIColor * outerShadowColor;
@property (nonatomic, assign) CGSize innerShadowOffset;
@property (nonatomic, assign) CGSize outerShadowOffset;

- (void)updateWithNumber:(NSInteger)number;

+ (NSString *)identifier;

@end