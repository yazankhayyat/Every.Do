//
//  DetailViewController.h
//  Every.do
//
//  Created by Yazan Khayyat on 2015-08-18.
//  Copyright (c) 2015 Yazan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

