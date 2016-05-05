//
//  DRLightBox.m
//  DRLightBoxView
//
//  Created by 王咻咻 on 16/5/5.
//  Copyright © 2016年 @raydun. All rights reserved.
//

#import "DRLightBoxView.h"
#import "DRNionLightView.h"
#import "DRLightBannerView.h"

@interface DRLightBoxView ()

@property (nonatomic, strong)  DRNionLightView *nionView;
@property (nonatomic, strong)  DRLightBannerView *lightView;

@end

@implementation DRLightBoxView


- (instancetype)init {
    if (self = [super init]) {
        [self defaultSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self defaultSetting];
    }
    return self;
}

- (void)defaultSetting {
    _nionView = [[DRNionLightView alloc] initWithFrame:CGRectMake(0, self.frame.size.width, self.frame.size.width, 30)];
    [self addSubview:_nionView];
    _lightView = [[DRLightBannerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self addSubview:_lightView];
}



- (void)setImage:(UIImage *)image Title:(NSString *)title Animition:(NSInteger)animationOption {
    _nionView.visableLabelText = title;
    _lightView.visableImage = image;
}

- (void)setFrame:(CGRect)frame  {
    [super setFrame:frame];
    _nionView.frame = CGRectMake(0, self.frame.size.width, self.frame.size.width, 30);
    _lightView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    _nionView.frame = CGRectMake(0, self.frame.size.width, self.frame.size.width, 30);
    _lightView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
}



@end
