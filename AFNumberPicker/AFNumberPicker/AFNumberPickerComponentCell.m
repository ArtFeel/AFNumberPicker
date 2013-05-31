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

        self.shadowLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.shadowLabel.backgroundColor = [UIColor clearColor];
        self.shadowLabel.textAlignment = NSTextAlignmentCenter;
        self.shadowLabel.textColor = [UIColor clearColor];
        [self.contentView insertSubview:self.shadowLabel belowSubview:self.textLabel];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.shadowLabel.frame = self.textLabel.frame;
}


#pragma mark - Style properties

- (void)setNumberFont:(UIFont *)numberFont {
    if ( ![_numberFont isEqual:numberFont] ) {
        _numberFont = numberFont;
        self.textLabel.font = numberFont;
        self.shadowLabel.font = numberFont;
    }
}


- (void)setNumberColor:(UIColor *)numberColor {
    if ( ![_numberColor isEqual:numberColor] ) {
        _numberColor = numberColor;
        self.textLabel.textColor = numberColor;
    }
}


- (void)setInnerShadowColor:(UIColor *)innerShadowColor {
    if ( ![_innerShadowColor isEqual:innerShadowColor] ) {
        _innerShadowColor = innerShadowColor;
        self.textLabel.shadowColor = innerShadowColor;
    }
}


- (void)setInnerShadowOffset:(CGSize)innerShadowOffset {
    if ( !CGSizeEqualToSize(_innerShadowOffset, innerShadowOffset) ) {
        _innerShadowOffset = innerShadowOffset;
        self.textLabel.shadowOffset = innerShadowOffset;
    }
}


- (void)setOuterShadowColor:(UIColor *)outerShadowColor {
    if ( ![_outerShadowColor isEqual:outerShadowColor] ) {
        _outerShadowColor = outerShadowColor;
        self.shadowLabel.shadowColor = outerShadowColor;
    }
}


- (void)setOuterShadowOffset:(CGSize)outerShadowOffset {
    if ( !CGSizeEqualToSize(_outerShadowOffset, outerShadowOffset) ) {
        _outerShadowOffset = outerShadowOffset;
        self.shadowLabel.shadowOffset = outerShadowOffset;
    }
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