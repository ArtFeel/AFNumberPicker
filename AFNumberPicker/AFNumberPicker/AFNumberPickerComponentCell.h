//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AFNumberPickerComponentCell : UITableViewCell

- (void)updateWithNumber:(NSInteger)number;

+ (NSString *)identifier;

@end