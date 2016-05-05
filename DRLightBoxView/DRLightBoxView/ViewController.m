//
//  ViewController.m
//  DRLightBoxView
//
//  Created by 王咻咻 on 16/5/4.
//  Copyright © 2016年 @raydun. All rights reserved.
//

#import "ViewController.h"
#import "DRLightBannerView.h"
#import "DRNionLightView.h"
#import "DRLightBoxView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DRLightBoxView *lightBox1;
@property (weak, nonatomic) IBOutlet DRLightBoxView *lightBox2;
@property (nonatomic, strong) UIImage *uiimage1;
@property (nonatomic, strong) UIImage *uiimage2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(40, 40, 40, 40);
    [button addTarget:self action:@selector(clickToChange:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button2.frame = CGRectMake(240, 40, 40, 40);
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(clickToChange1:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    _uiimage1 = image;
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    _uiimage2 = image2;
    
    
  

    
}


- (void)clickToChange1:(UIButton *)btn {
    [_lightBox1 setImage:_uiimage1 Title:@"我是第dsadsasasdsa一张" Animition:1];
    [_lightBox2 setImage:_uiimage2 Title:@"无间道" Animition:2];

    
}

- (void)clickToChange:(UIButton *)btn {
    [_lightBox1 setImage:_uiimage2 Title:@"无间道" Animition:2];
     [_lightBox2 setImage:_uiimage1 Title:@"我是一张" Animition:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
