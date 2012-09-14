//
//  LGridView.m
//  LGridView
//
//  Created by li yajie on 12-9-11.
//  Copyright (c) 2012年 com.loongjoy. All rights reserved.
//

#import "LGridView.h"
#import "LGridViewCell.h"
#import "LRootRowView.h"

@implementation LGridView

@synthesize gridDelegate;

- (id)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		[self setUp];
    }
    return self;
}


- (id) initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}


-(void) setUp {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
}
#pragma delegate of the tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [gridDelegate sizeCellOfGridView:self].height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * reuseIndentifier = @"LRootRowView";
    CGFloat height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    UITableViewCell * cellContainer = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    if (cellContainer == nil) {
        cellContainer = [[LRootRowView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
        cellContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        cellContainer.frame = CGRectMake(0.0f, 0.f, 320.f, height);
    }
    int numCols = [gridDelegate numbersCellsOfRow:self];
//	int count = [gridDelegate numbersCells:self];
    
	
    
	for (int i=0;i<numCols;i++) {
        
//		if ((i + indexPath.row * numCols) >= count) {
//            
//			if ([cell.contentView.subviews count] > i) {
//				((UIGridViewCell *)[row.contentView.subviews objectAtIndex:i]).hidden = YES;
//			}
//            
//			continue;
//		}
        
//		if ([cellContainer.contentView.subviews count] > i) {
//			tempCell = [cellContainer.contentView.subviews objectAtIndex:i];
//		} else {
//			tempCell = nil;
//		}
        
		LGridViewCell *cell = [gridDelegate viewCellOfGridView:self withColumn:i withRow:indexPath.row];
        
		if (cell.superview != cellContainer.contentView) {
			[cell removeFromSuperview];
            int index = indexPath.row * numCols + i;
            cell.tag = index;
            CGFloat width = [gridDelegate sizeCellOfGridView:self].width;
//            CGFloat height = [gridDelegate sizeCellOfGridView:self].height;
            
            cell.frame = CGRectMake( width * i, 10.f, width, height);
            [cell addTarget:self action:@selector(cellPressed:) forControlEvents:UIControlEventTouchUpInside];
			[cellContainer.contentView addSubview:cell];
		}
	}
    return cellContainer;
}

-(void) cellPressed:(id)sender {
    LGridViewCell *cell = (LGridViewCell *)sender;
   int index =  cell.tag;
    [gridDelegate didSelectedCellOfGridView:cell atIndex:index];
}

//-(void) cellPressed:(id)sender {
//    LGridViewCell *cell = (LGridViewCell *)sender;
//    NSLog(@"message..");
//    [gridDelegate didSelectedCellOfGridView:cell];
//}


- (void)dealloc
{
    self.delegate = nil;
    gridDelegate = nil;
    [super dealloc];
}
@end
