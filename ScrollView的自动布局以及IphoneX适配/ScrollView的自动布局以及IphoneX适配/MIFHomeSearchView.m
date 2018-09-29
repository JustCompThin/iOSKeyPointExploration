//
//  MIFHomeSearchView.m
//  ProvidentFundHome
//
//  Created by huangchengdu on 2018/9/26.
//

#import "MIFHomeSearchView.h"
#import <Masonry/Masonry.h>
#import "Header.h"


@interface MIFHomeSearchView ()

@property(nonatomic, assign)BOOL showMoney;

@property(nonatomic, assign)HomeSearchShowModule showModule;
@property(nonatomic, assign)CGFloat money;

@property(nonatomic, strong)UIImageView *defaultBackGroundView;
@property(nonatomic, strong)UILabel *defaultTitleLable;
@property(nonatomic, strong)UILabel *defaultMoneyLable;
@property(nonatomic, strong)UIButton *defaultDetailButton;
@property(nonatomic, strong)UIButton *defaultEyeButton;

@property(nonatomic, strong)UIView *searchBackGroundView;
@property(nonatomic, strong)UIImageView *searchImageView;
@property(nonatomic, strong)UILabel *searchTitleLabel;
@property(nonatomic, strong)UILabel *searchDescLabel;
@property(nonatomic, strong)UIButton *searchButton;

@end

@implementation MIFHomeSearchView

-(instancetype)init{
    self = [super init];
    if (self) {
        _showModule = HomeSearchShowModuleQuery;
        _money = 0;
        _showMoney = true;
        self.backgroundColor = [UIColor whiteColor];
    }
    [self addViews];
    
    return self;
}

- (void)addViews{
    
    self.defaultBackGroundView = [[UIImageView alloc]init];
    self.defaultBackGroundView.contentMode = UIViewContentModeScaleAspectFill;
    self.defaultBackGroundView.image = [UIImage imageNamed:@"homepage_background"];
    self.defaultBackGroundView.userInteractionEnabled = YES;
    [self addSubview:self.defaultBackGroundView];
    
    self.defaultTitleLable = [[UILabel alloc]init];
    self.defaultTitleLable.text = @"阿斯顿发生";
    self.defaultTitleLable.font = [UIFont systemFontOfSize:14];
    self.defaultTitleLable.textColor = RGBColorHex(0xFFFFFF);
    [self.defaultBackGroundView addSubview:self.defaultTitleLable];
    
    self.defaultEyeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.defaultEyeButton addTarget:self action:@selector(clickEyeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.defaultBackGroundView addSubview:self.defaultEyeButton];
    
    self.defaultMoneyLable = [[UILabel alloc]init];
    self.defaultMoneyLable.font = [UIFont fontWithName:@"DIN Alternate" size:42];
    self.defaultMoneyLable.textColor = RGBColorHex(0xFFFFFF);
    [self.defaultBackGroundView addSubview:self.defaultMoneyLable];
    
    self.defaultDetailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.defaultDetailButton.backgroundColor = RGBColorHex(0xFFFFFF);
    [self.defaultDetailButton.layer setMasksToBounds:YES];
    [self.defaultDetailButton.layer setCornerRadius:15.0]; //设置矩形四个圆角半径
    [self.defaultDetailButton setTitle:@"查看详情" forState:UIControlStateNormal];
    [self.defaultDetailButton setTitleColor:RGBColorHex(0x202745) forState:UIControlStateNormal];
    self.defaultDetailButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.defaultDetailButton addTarget:self action:@selector(clickDetailButton) forControlEvents:UIControlEventTouchUpInside];
    [self.defaultBackGroundView addSubview:self.defaultDetailButton];
    
    
    
    self.searchBackGroundView = [[UIView alloc]init];
    self.searchBackGroundView.clipsToBounds = YES;
    self.searchBackGroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.searchBackGroundView];
    
    self.searchImageView = [[UIImageView alloc]init];
    self.searchImageView.image = [UIImage imageNamed:@"homepage.png"];
    self.searchImageView.userInteractionEnabled = YES;
    [self.searchBackGroundView addSubview:self.searchImageView];
    
    self.searchButton = [[UIButton alloc]init];
    [self.searchButton setImage:[UIImage imageNamed:@"button_search.png"] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(clickSearchButton) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBackGroundView addSubview:self.searchButton];
}


- (void)setUpLayout{
    
    if (self.showModule == HomeSearchShowModuleDefault) {
        self.defaultBackGroundView.hidden = NO;
        self.searchBackGroundView.hidden = YES;
        
        if (self.showMoney) {
            [self.defaultEyeButton setImage:[UIImage imageNamed:@"home_eye_open_ic"] forState:UIControlStateNormal];
            self.defaultMoneyLable.text = [NSString stringWithFormat:@"%.2f",self.money];
        }else{
            [self.defaultEyeButton setImage:[UIImage imageNamed:@"home_eye_close_ic"] forState:UIControlStateNormal];
            self.defaultMoneyLable.text = @"******";
        }
        
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(176);
        }];
        
        [self.defaultBackGroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self.defaultTitleLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
            make.left.mas_equalTo(self.defaultBackGroundView).offset(26.8);
            make.top.mas_equalTo(self.defaultBackGroundView).offset(62);
        }];
        
        [self.defaultEyeButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.defaultTitleLable);
            make.left.equalTo(self.defaultTitleLable.mas_right);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(15);
        }];
        
        [self.defaultMoneyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.defaultBackGroundView).offset(23.8);
            make.top.equalTo(self.defaultTitleLable.mas_bottom).offset(8);
            make.height.mas_equalTo(48);
        }];
        
        [self.defaultDetailButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self.defaultMoneyLable);
            make.right.mas_equalTo(self.defaultBackGroundView).offset(-28.8);
        }];
    }else{
        self.defaultBackGroundView.hidden = YES;
        self.searchBackGroundView.hidden = NO;
    
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(300);
        }];
        
        [self.searchBackGroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self);
        }];
        
        [self.searchImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchBackGroundView.mas_top).offset(45);
            make.centerX.equalTo(self.searchBackGroundView);
            make.width.mas_equalTo(225);
            make.height.mas_equalTo(175);
        }];
        
        [self.searchButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.searchBackGroundView);
            make.top.equalTo(self.searchImageView.mas_bottom);
        }];
        
    }
    
}

- (void)updateWithMoney:(CGFloat)money showModule:(HomeSearchShowModule)showModule{
    self.money = money;
    self.showModule = showModule;
    [self setUpLayout];
}


- (void)clickEyeButton{
    self.showMoney = !self.showMoney;
    if (self.showMoney) {
        [self.defaultEyeButton setImage:[UIImage imageNamed:@"home_eye_open_ic"] forState:UIControlStateNormal];
        self.defaultMoneyLable.text = [NSString stringWithFormat:@"%.2f",self.money];
    }else{
        [self.defaultEyeButton setImage:[UIImage imageNamed:@"home_eye_close_ic"] forState:UIControlStateNormal];
        self.defaultMoneyLable.text = @"******";
    }
}

- (void)clickDetailButton{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickDetailButton)]) {
        [self.delegate clickDetailButton];
    }
}

- (void)clickSearchButton{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSearchButton)]) {
        [self.delegate clickSearchButton];
    }
}


@end
