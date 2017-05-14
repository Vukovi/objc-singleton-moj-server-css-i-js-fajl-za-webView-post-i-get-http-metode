//
//  VideoVC.h
//  youtube
//
//  Created by Vuk on 5/14/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic,strong) Video *video;
@end
