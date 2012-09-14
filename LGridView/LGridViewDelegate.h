//
//  LGridViewDelegate.h
//  LGridView
//
//  Created by li yajie on 12-9-11.
//  Copyright (c) 2012年 com.loongjoy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LGridViewCell.h"


@class LGridView;

@protocol LGridViewDelegate <NSObject>


@optional
-(void) didSelectedCellOfGridView:(LGridViewCell *)gridView;

@required

-(NSInteger) numbersCellsOfRow:(LGridView *) lGridview;

-(NSInteger) numbersCells:(LGridView *)lGridview;

- (CGSize) sizeCellOfGridView:(LGridView *) grid;

-(LGridViewCell *) viewCellOfGridView:(LGridView *)gridview withColumn:(NSInteger) col withRow:(NSInteger) row;
@end
