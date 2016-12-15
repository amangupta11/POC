//
//  SharedActivityIndicatorView.m
//  Surf's Up
//
//  Created by Aman Gupta on 11/03/16.
//  Copyright © 2016 komorka technology, llc. All rights reserved.
//

#import "SharedActivityIndicatorView.h"
static SharedActivityIndicatorView *mSharedActivityIndicator = NULL;
@implementation SharedActivityIndicatorView
+(SharedActivityIndicatorView* )sharedActivityIndicator
{
    if(NULL == mSharedActivityIndicator)
    {
        mSharedActivityIndicator =[ [SharedActivityIndicatorView alloc ] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        mSharedActivityIndicator.backgroundColor=[UIColor clearColor];
        
    }
    return mSharedActivityIndicator;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backGroundView = nil;
        self.userInteractionEnabled = YES;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super  drawRect:rect];
}
- (void)displayProgressIndicatorForView:(UIView*)inView
{
    SharedActivityIndicatorView *sharedActivityIndicator = [SharedActivityIndicatorView sharedActivityIndicator];
    [sharedActivityIndicator stopAnimating];
    if(NO == sharedActivityIndicator.isAnimating)
    {
        if(NULL == _backGroundView)
        {
            if(inView)
            {
                _backGroundView = [[UIView alloc ] initWithFrame: CGRectMake(0, -50, inView.frame.size.width, inView.frame.size.height)];
            }
            else
            {
                _backGroundView = [[UIView alloc ] initWithFrame: [[UIScreen mainScreen ]bounds ]];
            }
        }
        _backGroundView.backgroundColor  = [UIColor colorWithRed:0.2 green:0.2  blue:0.2  alpha:0.5];
        
        if(inView)
            _backGroundView.center  = inView.center;
        
        sharedActivityIndicator.center  = _backGroundView.center;
        [self onKeyboard:inView];
        [_backGroundView addSubview: sharedActivityIndicator];
         [sharedActivityIndicator startAnimating];
    }
}
-(void)onKeyboard:(UIView*)inView
{
    if(inView)
    {
        UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
        CGRect BGViewFrame = _backGroundView.frame;
        BGViewFrame.origin.y = 0;
        BGViewFrame.size.height = BGViewFrame.size.height+64;
        _backGroundView.frame = BGViewFrame;
        [keyWindow addSubview:_backGroundView];
    }
    else
    {
        UIWindow* tempWindow = [[UIApplication sharedApplication] windows][0];
        [tempWindow addSubview:_backGroundView];
    }
}

- (void)removeProgressIndicator:(UIView *)inView
{
    SharedActivityIndicatorView *theAcitivityIndicator = [SharedActivityIndicatorView sharedActivityIndicator];
    if(YES == theAcitivityIndicator.isAnimating)
    {
        [theAcitivityIndicator stopAnimating];
        [theAcitivityIndicator removeFromSuperview ];
        [_backGroundView removeFromSuperview];
        _backGroundView = NULL;
    }
}
@end
