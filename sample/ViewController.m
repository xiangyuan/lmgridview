//
//  ViewController.m
//  sample
//
//  Created by li yajie on 12-9-11.
//  Copyright (c) 2012年 com.loongjoy. All rights reserved.
//

#import "ViewController.h"
#import "Demo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    gridView = [[LGridView alloc]initWithFrame:CGRectMake(0.f, 0.f, 320.f, 480.f)];
    gridView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    gridView.gridDelegate = self;
    gridView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:gridView];
    [gridView release];
    [gridView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma delegate
-(NSInteger) numbersCellsOfRow:(LGridView *) lGridview {
    return 3;
}

-(NSInteger) numbersCells:(LGridView *)lGridview {
    return 6;
}

- (CGSize) sizeCellOfGridView:(LGridView *) grid {
    return CGSizeMake(106.f, 45.f);
}

-(LGridViewCell *) viewCellOfGridView:(LGridView *)gridview withColumn:(NSInteger) col withRow:(NSInteger) row {
    Demo * cell = [[Demo alloc]initWithFrame:CGRectMake(5.f, 0.f, 106.f, 45.f)];
//    cell.backgroundColor = [UIColor grayColor];
    cell.label.textColor = [UIColor redColor];
    cell.label.text = @"what is this";
    return cell;
}

-(void)didSelectedCellOfGridView:(LGridView *)gridView {
    NSLog(@"the gridview clicked ");
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc
{
    [gridView release];
    [super dealloc];
}
@end
