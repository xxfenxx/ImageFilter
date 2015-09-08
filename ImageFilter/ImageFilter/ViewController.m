//
//  ViewController.m
//  ImageFilter
//
//  Created by 信勇哥得水牛 on 15/9/8.
//  Copyright (c) 2015年 信勇哥得水牛. All rights reserved.
//

#import "ViewController.h"
#import "Filter.h"
@interface ViewController ()

@end
/*
 *
 CIStarShineGenerator,
 CIStraightenFilter,
 CIStripesGenerator,
 CISwipeTransition,
 CITemperatureAndTint,
 CIToneCurve,
 CITriangleKaleidoscope,
 CITwelvefoldReflectedTile,
 CITwirlDistortion,
 CIUnsharpMask,

 */
@implementation ViewController

- (void)viewDidLoad {
        
    [super viewDidLoad];
    
    NSLog(@"Hello world! first.");
    
    NSLog(@"Hello world! second.");
    
    NSLog(@"Hello world! third.");
    
    /** 要得到某种滤镜效果要自己手动调
     *  TYPE     : 可以从Filter头文件中找
     *  注意:
     *  VALUEKEY : 滤镜效果系数（可选）
     *  VALUE    : 滤镜效果系数对应的值（可选）
     */
    NSDictionary * dic1 = @{
                            TYPE     :@"CIHueAdjust",
                            VALUEKEY :kCIInputAngleKey,
                            VALUE    :@"1.0"
                            };
    
    NSDictionary * dic2 = @{@"type":@"CIPixellate"};

    UIImage * showImage = [[Filter shareFilter] imageWIthMixFilterTypes:@[dic1,dic2] withImageName:@"0.jpg"];
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:showImage];
    
    imageView.frame = CGRectMake(10, 100, 320, 240);
    
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
