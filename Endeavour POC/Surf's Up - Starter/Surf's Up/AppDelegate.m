//
//  SurfsUpAppDelegate.m
//  Surf's Up
//
//  Created by Baranski Steve on 7/1/11.
//  Copyright 2011 komorka technology, llc. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "DetailViewController.h"
#import "PickerViewController.h"
#import "ThemeFactory.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
   
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    
    ViewController *vc = [[ViewController alloc] initWithStyle:UITableViewStylePlain];
    [vc setTitle:@"Surf's Up"];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self setViewController:navVC];
    
    ThemeFactory *themeFactory = [[ThemeFactory alloc] init];
    [themeFactory PlistData];
      
    [[self window] setRootViewController:[self viewController]];
    [[self window] makeKeyAndVisible];
  
    return YES;
}


@end

