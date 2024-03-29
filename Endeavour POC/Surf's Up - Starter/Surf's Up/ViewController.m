//
//  SurfsUpViewController.m
//  Surf's Up
//
//  Created by Baranski Steve on 7/1/11.
//  Copyright 2011 komorka technology, llc. All rights reserved.
//

#import "ViewController.h"
#import "SharedActivityIndicatorView.h"
#import "DetailViewController.h"
#import "PickerViewController.h"
#import "CollectionViewController.h"
#import "ThemeFactory.h"

@implementation ViewController

#pragma mark - Private behavior and "Model" methods



- (NSString *)tripNameForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            return @"Kuta, Bali";
            break;
        case 1:
            return @"Lagos, Portugal";
            break;
        case 2:
            return @"Waikiki, Hawaii";
            break;
    }
    return @"-";
}

- (UIImage *)tripPhotoForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            return [UIImage imageNamed:@"surf1.png"];
            break;
        case 1:
            return [UIImage imageNamed:@"surf2.png"];
            break;
        case 2:
            return [UIImage imageNamed:@"surf3.png"];   
            break;
    }
    return nil;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [[cell imageView] setImage:[self tripPhotoForRowAtIndexPath:indexPath]];
    [[cell textLabel] setText:[self tripNameForRowAtIndexPath:indexPath]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc1 = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    [vc1 setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Details" image:[UIImage imageNamed:@"thumb.png"] tag:100]];
    
    PickerViewController *vc2 = [[PickerViewController alloc] initWithNibName:@"PickerView" bundle:nil];
    
    [vc2 setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"DatePicker" image:[UIImage imageNamed:@"thumb.png"] tag:101]];

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CollectionView" bundle:nil];
    
    CollectionViewController *vc3 = (CollectionViewController *)[storyboard instantiateViewControllerWithIdentifier:@"CollectionView"];
    
    [vc3 setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"CollectionView" image:[UIImage imageNamed:@"thumb.png"] tag:102]];

 
    UITabBarController *tabController = [[UITabBarController alloc] init];     
    [tabController setViewControllers:[NSArray arrayWithObjects:vc1,vc2,vc3, nil]];
    [tabController setTitle:[self tripNameForRowAtIndexPath:indexPath]];
    UIBarButtonItem *aboutButton = [[UIBarButtonItem alloc] initWithTitle:@"About"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:nil];    
    [[tabController navigationItem] setRightBarButtonItem:aboutButton animated:YES];
    
    [[self navigationController] pushViewController:tabController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:[self tableView] cellForRowAtIndexPath:indexPath];
    return [cell frame].size.height;
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
