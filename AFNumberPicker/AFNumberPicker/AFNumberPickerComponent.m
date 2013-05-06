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

- (NSInteger)moduloFromNumber:(NSInteger)number;
- (NSInteger)centeredIndexFromNumber:(NSInteger)number;

- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated;
- (void)snapPosition;

@end


@implementation AFNumberPickerComponent


- (id)initWithFrame:(CGRect)frame andNumber:(NSInteger)number {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        [self scrollToIndex:[self centeredIndexFromNumber:number] animated:NO];
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


#pragma mark - UITableViewDataSource methods

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


#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ( !decelerate ) {
        [self snapPosition];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self snapPosition];
}


#pragma mark - Private methods

- (NSInteger)moduloFromNumber:(NSInteger)number {
    return number % 10;
}


- (NSInteger)centeredIndexFromNumber:(NSInteger)number {
    NSInteger halfOfRange = kMaxNumberOfRows / 2;
    NSInteger centeredZero = halfOfRange - [self moduloFromNumber:halfOfRange];
    return centeredZero + number;
}


#pragma mark - Scrolling helpers

- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated {
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:animated scrollPosition:UITableViewScrollPositionMiddle];
}


- (void)snapPosition {
    NSArray * visibleCells = [self.tableView visibleCells];

    CGRect visibleTableFrame = self.tableView.bounds;
    visibleTableFrame.origin.y = self.tableView.contentOffset.y;

    for (UITableViewCell * cell in visibleCells) {
        if ( CGRectContainsPoint(visibleTableFrame, cell.center) ) {
            NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
            [self scrollToIndex:indexPath.row animated:YES];
            break;
        }
    }
}

@end