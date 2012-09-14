//
//  LRootRowView.m
//  LGridView
//
//  Created by li yajie on 12-9-11.
//  Copyright (c) 2012年 com.loongjoy. All rights reserved.
//

#import "LRootRowView.h"

@implementation LRootRowView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
