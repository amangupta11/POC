//
//  CollectionViewController.m
//  Surf's Up
//
//  Created by Aman Gupta on 17/06/15.
//  Copyright © 2015 komorka technology, llc. All rights reserved.
//

#import "CollectionViewController.h"
#import "SharedActivityIndicatorView.h"
#import "Cell.h"

@interface CollectionViewController ()

@end

NSString *kCellID = @"cellID";

@implementation CollectionViewController

-(void)viewDidLoad
{
   [[SharedActivityIndicatorView sharedActivityIndicator] displayProgressIndicatorForView:self.view];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(removeProgressIndicator) userInfo:nil repeats:NO];
}
-(void)removeProgressIndicator
{
    [[SharedActivityIndicatorView sharedActivityIndicator] removeProgressIndicator:self.view];
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
   
    // load the image for this cell
    NSString *imageToLoad = [NSString stringWithFormat:@"%ld.JPG", (long)indexPath.row];
    cell.Image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)cv layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UIImage *image;
    NSString *imageToLoad = [NSString stringWithFormat:@"%ld.JPG", (long)indexPath.row];
    image = [UIImage imageNamed:imageToLoad];
    return image.size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewFlowLayout *myLayout =
    [[UICollectionViewFlowLayout alloc]init];
    
    myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:myLayout animated:YES];
}
// the user tapped a collection item, load and set the image on the detail view controller
//


@end
