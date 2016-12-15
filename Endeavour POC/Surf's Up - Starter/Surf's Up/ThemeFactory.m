//
//  CustomUI.m
//  Surf's Up
//
//  Created by Aman Gupta on 17/06/15.
//  Copyright © 2015 komorka technology, llc. All rights reserved.
//

#import "ThemeFactory.h"
#import "Theme.h"
#import "PickerViewController.h"

@implementation ThemeFactory
Theme *theme1;
-(void)PlistData{
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Theme"
                                                         ofType:@"plist"];
    NSDictionary* plist = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary *colors = [plist valueForKey:@"Color"];

    
    theme1 = [[Theme alloc] init];
    
    NSString *hexBGColor = [colors valueForKey:@"BgColor"];
    theme1.bgColor = [self colorFromHex:hexBGColor];
    NSString *hexTintColor = [colors valueForKey:@"TintColor"];
    theme1.tintColor = [self colorFromHex:hexTintColor];
    NSString *hexTextColor = [colors valueForKey:@"TextColor"];
    theme1.textColor = [self colorFromHex:hexTextColor];
    NSString *hexSelectedBgColor = [colors valueForKey:@"SelectedBgColor"];
    theme1.selectedBgColor = [self colorFromHex:hexSelectedBgColor];
    NSString *hexShadowBgColor = [colors valueForKey:@"ShadowColor"];
    theme1.shadowColor = [self colorFromHex:hexShadowBgColor];
    [self customizeAppearance];

}

-(UIColor *)colorFromHex:(NSString *)hex {
    unsigned int c;
    if ([hex characterAtIndex:0] == '#') {
        [[NSScanner scannerWithString:[hex substringFromIndex:1]] scanHexInt:&c];
    } else {
        [[NSScanner scannerWithString:hex] scanHexInt:&c];
    }
    
    UIColor *color = [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0
                            green:((c & 0xff00) >> 8)/255.0
                             blue:(c & 0xff)/255.0 alpha:1.0];
  
    return color;
    
    
}

- (void)customizeAppearance
{
    [self customizeNavBarAppearance];
    [self CustomizeSliderAppearance];
    [self CustomizeSegmentControlAppearance];
    [self CustomizeStepperAppearance];
    [self customizeButtonAppearance];
    [self customizeSwitchAppearance];
    [self customizeTabBarAppearance];
    [self customizeCollectionViewAppearance];
    [self customizeTableAppearance];
    [self customizeImageViewAppearance];
    [self customizeProgressViewAppearance];
    [self customizeDatePickerAppearance];
    [self customizePageControlAppearance];
    [self customizeTextFieldAppearance];
}



-(void)customizeNavBarAppearance{
    
    
 // Customize the title text for *all* UINavigationBars
    
    NSShadow *shadow = [[NSShadow alloc] init];
 
    shadow.shadowOffset = CGSizeMake(0, -1);
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:theme1.selectedBgColor,
      NSForegroundColorAttributeName,shadow,NSShadowAttributeName,[UIFont fontWithName:@"Arial-Bold" size:0.0],NSFontAttributeName,nil]];
    
    [[UINavigationBar appearance] setBarTintColor:theme1.bgColor];
   
    [[UINavigationBar appearance] setTintColor:theme1.tintColor];
    
    
    
}

-(void)CustomizeSliderAppearance{
    
 
    [UISlider appearance].minimumTrackTintColor = theme1.bgColor;
    [UISlider appearance].maximumTrackTintColor =theme1.tintColor;
    [UISlider appearance].thumbTintColor = theme1.tintColor;
    
}

-(void)CustomizeSegmentControlAppearance{
    
    [UISegmentedControl appearance].backgroundColor = theme1.bgColor;
    [UISegmentedControl appearance].tintColor =theme1.tintColor;
    
}

-(void)CustomizeStepperAppearance{
    
    [[UIStepper appearance] setTintColor:theme1.tintColor];
    [[UIStepper appearance] setIncrementImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [[UIStepper appearance] setDecrementImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
}

-(void)customizeButtonAppearance{
    
    
    
    NSShadow *shadow1 = [[NSShadow alloc] init];
 
    shadow1.shadowOffset = CGSizeMake(0, 1);
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
     theme1.tintColor,NSForegroundColorAttributeName,
      shadow1,NSShadowAttributeName,[UIFont fontWithName:@"Arial-Bold" size:0.0],NSFontAttributeName,nil]
                                                forState:UIControlStateNormal];
    
    
    [[UIButton appearance] setBackgroundColor:theme1.bgColor];
    [[UIButton appearance] setTitleColor:theme1.tintColor forState:UIControlStateNormal];
     
}

-(void)customizeSwitchAppearance{
    
    [[UISwitch appearance] setOnTintColor:theme1.bgColor];
    [[UISwitch appearance] setTintColor:theme1.tintColor];
    [[UISwitch appearance] setThumbTintColor:theme1.tintColor];
    
    
    [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"yesSwitch"]];
    [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"noSwitch"]];
   
    
}

-(void)customizeTabBarAppearance{
    
   
    [UITabBar appearance].tintColor = theme1.tintColor;
    [UITabBar appearance].barTintColor = theme1.bgColor;
    
}

-(void)customizeCollectionViewAppearance{
    
    
    [[UICollectionViewCell appearance] setBackgroundColor:theme1.bgColor];
    
}

-(void)customizeTableAppearance{
    
    UIView *cellBackgroundView =[[UIView alloc] init];
    cellBackgroundView.backgroundColor = theme1.selectedBgColor;
    [[UITableViewCell appearance] setSelectedBackgroundView:cellBackgroundView];
}

-(void)customizeImageViewAppearance{
    
 [[imageview appearanceWhenContainedIn:[PickerViewController class], nil] setTintColor:theme1.tintColor];
  
    
}

-(void)customizeProgressViewAppearance{
    
    
    [[UIProgressView appearance] setProgressTintColor:theme1.bgColor];
    [[UIProgressView appearance] setTrackTintColor:theme1.tintColor];
    
    
}

-(void)customizeDatePickerAppearance{
    
     [[UIDatePicker appearance] setBackgroundColor:theme1.bgColor];
    
}
-(void)customizePageControlAppearance{
    
    
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:theme1.bgColor];
    [[UIPageControl appearance] setPageIndicatorTintColor:theme1.tintColor];
    
}
-(void)customizeTextFieldAppearance{
    
    [[UITextField appearance] setBackgroundColor:theme1.bgColor];
    
    [[UITextField appearance] setTextColor:theme1.textColor];
    
    [[UITextField appearance] setTintColor:theme1.tintColor];
    
    [[UITextField appearance] setBorderStyle:UITextBorderStyleRoundedRect];
}



@end
