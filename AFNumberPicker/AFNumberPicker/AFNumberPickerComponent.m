//
//  PUAbstractMeterContext.h
//  PublicUtilities
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFNumberPickerComponent.h"
#import "AFNumberPickerComponentCell.h"


static const NSInteger kMaxNumberOfRows = 4096;


@interface AFNumberPickerComponent () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@end


@implementation AFNumberPickerComponent


- (id)initWithFrame:(CGRect)frame andNumber:(NSInteger)number {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];

        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:number inSection:0]
                                    animated:NO
                              scrollPosition:UITableViewScrollPositionMiddle];
    }
    return self;
}


#pragma mark - Lazy Initialization

- (UITableView *)tableView {
    if ( !_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = self.frame.size.height;
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kMaxNumberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = [AFNumberPickerComponentCell identifier];
    AFNumberPickerComponentCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if ( !cell ) {
        cell = [[AFNumberPickerComponentCell alloc] initWithFrame:self.frame];
        cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row % 10];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }

    return cell;
}


#pragma mark - UITableView Delegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return self.frame.size.height;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end