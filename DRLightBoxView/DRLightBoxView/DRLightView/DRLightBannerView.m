//
//  DRLightView.m
//  DRLightBoxView
//
//  Created by 王咻咻 on 16/5/4.
//  Copyright © 2016年 @raydun. All rights reserved.
//

#import "DRLightBannerView.h"
#define Duration 0.4
#define WIDTH  self.frame.size.width
#define HEIGHT self.frame.size.height

@interface DRLightBannerView ()

@property (nonatomic, strong) UIImageView *visibleView;
@property (nonatomic, strong) UIImageView *topView;
@property (nonatomic, strong) UIImageView *curVisibleView;
@property (nonatomic , assign)BOOL isChange;
@property (nonatomic , assign)BOOL isPlay;
@end

@implementation DRLightBannerView
- (void)defaultSetting {
    self.clipsToBounds = YES;
    _visibleView = [[UIImageView alloc] init];
    _visibleView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    _visibleView.contentMode = UIViewContentModeScaleAspectFill;
    _visibleView.clipsToBounds = YES;

    _topView = [[UIImageView alloc] init];
    _topView.frame = CGRectMake(0, -HEIGHT,WIDTH,HEIGHT);
    _topView.contentMode = UIViewContentModeScaleAspectFill;
    _topView.clipsToBounds = YES;
    
    [self addSubview:_visibleView];
    [self addSubview:_topView];
    
    _curVisibleView = _visibleView;
    self.layer.cornerRadius = 8;
    if (_duration == 0) {
        _duration = Duration;
    }
}

- (void)change {
    if (!_isPlay) {
        _isPlay = YES;
        UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        [maskView setBackgroundColor:[UIColor blackColor]];
        maskView.alpha = 0.0;
        if (!_isChange) {
            [_visibleView addSubview:maskView];
            _curVisibleView = _topView;
            [UIView animateWithDuration:self.duration animations:^{
                _visibleView.transform = CGAffineTransformTranslate(_visibleView.transform, 0, HEIGHT);
                _topView.transform =  CGAffineTransformTranslate(_topView.transform, 0, HEIGHT);
                maskView.alpha = 0.3;
            }completion:^(BOOL finished) {
                [_visibleView  removeFromSuperview];
                _visibleView.frame = CGRectMake(0, -HEIGHT,WIDTH,HEIGHT);
                [self addSubview:_visibleView];
                [maskView removeFromSuperview];
                _isChange = YES;
                _isPlay = NO;
            }];
        }else {
            _curVisibleView = _visibleView;
            [_topView addSubview:maskView];
            [UIView animateWithDuration:self.duration animations:^{
                _visibleView.transform = CGAffineTransformTranslate(_visibleView.transform, 0, HEIGHT);
                _topView.transform =  CGAffineTransformTranslate(_topView.transform, 0, HEIGHT);
                maskView.alpha = 0.3;
            }completion:^(BOOL finished) {
                [_topView  removeFromSuperview];
                _topView.frame = CGRectMake(0, -HEIGHT,WIDTH,HEIGHT);
                [self addSubview:_topView];
                [maskView removeFromSuperview];
                _isChange = NO;
                _isPlay = NO;
            }];
        }
    }else {
        return;
    }
}

- (void)setVisableImage:(UIImage *)visableImage {
    _visableImage = visableImage;
    if (self.curVisibleView.image == nil) {
        self.curVisibleView.image = visableImage;
    }else {
        if (!self.isPlay) {
            [self change];
            self.curVisibleView.image = visableImage;
        }
    }
}

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
- (void)setFrame:(CGRect)frame  {
    [super setFrame:frame];
    _visibleView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    _topView.frame = CGRectMake(0, -HEIGHT,WIDTH,HEIGHT);
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    _visibleView.bounds = CGRectMake(0, 0, WIDTH, HEIGHT);
    _topView.bounds = CGRectMake(0, -HEIGHT,WIDTH,HEIGHT);

}




@end
