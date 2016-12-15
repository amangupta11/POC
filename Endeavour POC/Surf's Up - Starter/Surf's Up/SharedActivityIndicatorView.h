//
//  SharedActivityIndicatorView.h
//  Surf's Up
//
//  Created by Aman Gupta on 11/03/16.
//  Copyright © 2016 komorka technology, llc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SharedActivityIndicatorView : UIActivityIndicatorView
{
    UIView* _backGroundView;
}
+(SharedActivityIndicatorView* )sharedActivityIndicator;
- (void)displayProgressIndicatorForView:(UIView*)inView;
- (void)removeProgressIndicator:(UIView *)inView;
@end
