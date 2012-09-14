//
//  Demo.m
//  LGridView
//
//  Created by li yajie on 12-9-11.
//  Copyright (c) 2012年 com.loongjoy. All rights reserved.
//

#import "Demo.h"

@implementation Demo

@synthesize label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.userInteractionEnabled = YES;
        label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.userInteractionEnabled = NO;
//        label.exclusiveTouch = NO;
        [self addSubview:label];
        [label release];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc {
    [label release];
    [super dealloc];
}

@end
