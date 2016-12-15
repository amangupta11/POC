//
//  PlaceholderViewController.m
//  Surf's Up
//
//  Created by Baranski Steve on 7/1/11.
//  Copyright 2011 komorka technology, llc. All rights reserved.
//

#import "PickerViewController.h"
#import "SharedActivityIndicatorView.h"
@implementation PickerViewController

#pragma mark - Rotation



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
   
    
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImage * image = [UIImage imageNamed:@"tab_select_indicator"];
   image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
   self.image.image = image;

}



@end
@implementation imageview : UIImageView

@end
