//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFNumberPickerComponentCell.h"


@interface AFNumberPickerComponentCell ()
@property (nonatomic, strong) UILabel *shadowLabel;
@end


@implementation AFNumberPickerComponentCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self ) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textAlignment = NSTextAlignmentCenter;

        self.textLabel.font = [UIFont boldSystemFontOfSize:30];
        self.textLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1];
        self.textLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.textLabel.shadowOffset = CGSizeMake(0, -1);

        self.shadowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.shadowLabel.textAlignment = NSTextAlignmentCenter;
        self.shadowLabel.font = self.textLabel.font;
        self.shadowLabel.textColor = [UIColor clearColor];
        self.shadowLabel.shadowColor = [UIColor colorWithWhite:1 alpha:0.55];
        self.shadowLabel.shadowOffset = CGSizeMake(0, 1);
        self.shadowLabel.backgroundColor = [UIColor clearColor];
        [self.contentView insertSubview:self.shadowLabel belowSubview:self.textLabel];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.shadowLabel.frame = self.textLabel.frame;
}


#pragma mark - Public methods

- (void)updateWithNumber:(NSInteger)number {
    NSString *numberString = [NSString stringWithFormat:@"%d", number];
    self.textLabel.text = numberString;
    self.shadowLabel.text = numberString;
}


#pragma mark - Class methods

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

@end