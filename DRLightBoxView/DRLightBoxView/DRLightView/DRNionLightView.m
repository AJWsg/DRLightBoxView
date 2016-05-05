//
//  DRNionLightView.m
//  DRLightBoxView
//
//  Created by 王咻咻 on 16/5/4.
//  Copyright © 2016年 @raydun. All rights reserved.
//

#import "DRNionLightView.h"
#define topViewY -10
#define visibleY 5
#define LabelH   15
#define labelFont 14
#define Duration 0.3

@interface DRNionLightView ()
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *visibleLabel;
@property (nonatomic, strong) UILabel *curVisiblelabel;
@property (nonatomic , assign)BOOL isPlay;
@property (nonatomic , assign)BOOL isChange;
@end

@implementation DRNionLightView
- (void)defaultSetting {
    
    _topLabel.numberOfLines = 0;
    _topLabel.preferredMaxLayoutWidth = self.frame.size.width - 8;
    _topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,topViewY,self.frame.size.width, LabelH)];
    _topLabel.font = [UIFont systemFontOfSize:labelFont];
    _topLabel.alpha = 0.0;
    _topLabel.textAlignment = NSTextAlignmentCenter;
    [_topLabel sizeToFit];
    
    _visibleLabel.numberOfLines = 0;
    _visibleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,visibleY, self.frame.size.width, LabelH)];
    _visibleLabel.preferredMaxLayoutWidth = self.frame.size.width - 8;
    _visibleLabel.font = [UIFont systemFontOfSize:labelFont];
    [_visibleLabel sizeToFit];
    _visibleLabel.alpha = 1.0;
    _visibleLabel.textAlignment = NSTextAlignmentCenter;

    [self addSubview:_topLabel];
    [self addSubview:_visibleLabel];

    _curVisiblelabel = _visibleLabel;
    if (_duration == 0) {
        _duration = Duration;
    }
}

- (void)change {
    if (!_isPlay) {
        _isPlay = YES;
        if (!_isChange) {
            _curVisiblelabel = _topLabel;
            [UIView animateWithDuration:self.duration animations:^{
                _visibleLabel.transform = CGAffineTransformTranslate(_visibleLabel.transform, 0, LabelH);
                _topLabel.transform =  CGAffineTransformTranslate(_topLabel.transform, 0, LabelH);
                _topLabel.alpha = 1.0;
                _visibleLabel.alpha = 0.0;
            }completion:^(BOOL finished) {
                [_visibleLabel  removeFromSuperview];
                _visibleLabel.frame = CGRectMake(0, topViewY,self.frame.size.width,LabelH);
                [self addSubview:_visibleLabel];
                _isChange = YES;
                _isPlay = NO;
            }];
        }else {
            _curVisiblelabel = _visibleLabel;
            [UIView animateWithDuration:self.duration animations:^{
                _visibleLabel.transform = CGAffineTransformTranslate(_visibleLabel.transform, 0,LabelH);
                _topLabel.transform =  CGAffineTransformTranslate(_topLabel.transform, 0, LabelH);
                _topLabel.alpha = 0.0;
                _visibleLabel.alpha = 1.0;
            }completion:^(BOOL finished) {
                [_topLabel  removeFromSuperview];
                _topLabel.frame = CGRectMake(0,topViewY,self.frame.size.width,LabelH);
                [self addSubview:_topLabel];
                _isChange = NO;
                _isPlay = NO;
            }];
        }
    }else {
        return;
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

- (void)setVisableLabelText:(NSString *)visableLabelText {
    _visableLabelText = visableLabelText;
    if (self.curVisiblelabel.text.length == 0) {
        self.curVisiblelabel.text = visableLabelText;
    }else {
        if (!self.isPlay) {
            [self change];
            self.curVisiblelabel.text = visableLabelText;
        }
    }
}

- (void)setFrame:(CGRect)frame  {
    [super setFrame:frame];
    _topLabel.frame = CGRectMake(0,topViewY,self.frame.size.width, LabelH);
    _visibleLabel.frame =  CGRectMake(0,visibleY, self.frame.size.width, LabelH);
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    _topLabel.frame = CGRectMake(0,topViewY,self.frame.size.width, LabelH);
    _visibleLabel.frame =  CGRectMake(0,visibleY, self.frame.size.width, LabelH);
    
}

@end
