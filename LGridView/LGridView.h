//
//  LGridView.h
//  LGridView
//
//  Created by li yajie on 12-9-11.
//  Copyright (c) 2012年 com.loongjoy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LGridViewDelegate.h"


@interface LGridView : UITableView<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,unsafe_unretained) id<LGridViewDelegate> gridDelegate;


@end

