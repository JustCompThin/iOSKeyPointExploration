//
//  MIFHomeBannerView.m
//  ProvidentFundHome
//
//  Created by huangchengdu on 2018/9/26.
//

#import "MIFHomeBannerView.h"
#import "Header.h"
#import <Masonry/Masonry.h>

static CGFloat marginX = 20;

@interface IconButton:UIButton
@property(nonatomic, strong)UIImageView *image;
@property(nonatomic, strong)UILabel *label;

@property(nonatomic, strong)NSString *title;
@property(nonatomic, assign)CGFloat fontSize;
@property(nonatomic, strong)NSString *normalImage;

@property(nonatomic, strong)UIColor *normalColor;

-(instancetype)initWithTitle:(NSString *)title normalImage:(NSString *)normalImage;

@end

@implementation IconButton

-(instancetype)initWithTitle:(NSString *)title normalImage:(NSString *)normalImage{
    self = [super init];
    if (self) {
        
        self.normalColor = RGBColorHex(0x666666);
        self.fontSize = 12;
        
        
        self.title = title;
        self.normalImage = normalImage;
        
        
        self.image = [UIImageView new];
        self.image.contentMode = UIViewContentModeScaleAspectFill;
        self.image.image = [UIImage imageNamed:self.normalImage];
        [self addSubview:self.image];
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(@36);
            make.top.mas_equalTo(self);
            make.centerX.mas_equalTo(self);
        }];
        
        self.label = [[UILabel alloc]init];
        self.label.text = self.title;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:self.fontSize];
        self.label.textColor = self.normalColor;
        [self addSubview:self.label];
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.mas_equalTo(self);
            make.centerX.mas_equalTo(self);
        }];
    }
    return self;
}
@end


@interface MIFHomeBannerView ()

@property(nonatomic,strong)UIView *iconButtonBGView;
@property(nonatomic, strong)IconButton *buttonGJJ;
@property(nonatomic, strong)IconButton *buttonJJB;
@property(nonatomic, strong)IconButton *buttonSB;
@property(nonatomic, strong)IconButton *buttonYL;

@property(nonatomic, strong)UIImageView *gjjbkImageView;
@property(nonatomic, strong)UIView *homeView;
@property(nonatomic, strong)UIView *lifeView;

@end


@implementation MIFHomeBannerView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUpIconViews];
        [self setUpIconLayout];
        [self setUpBarViews];
        [self setUpTailViews];
    }
     self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

- (void)setUpIconViews{
    self.iconButtonBGView = [[UIView alloc]init];
    [self addSubview:self.iconButtonBGView];
    
    self.buttonGJJ = [self getIconButton:@"阿斯顿发" imageName:@"home_guanli.png" tag:1 selector:@selector(clickIconButton:)];
    [self.iconButtonBGView addSubview:self.buttonGJJ];
    
    self.buttonJJB = [self getIconButton:@"安抚放到" imageName:@"home_jijiaban.png" tag:2 selector:@selector(clickIconButton:)];
    [self.iconButtonBGView addSubview:self.buttonJJB];
    
    self.buttonSB = [self getIconButton:@"爱上的地方" imageName:@"home_shebao.png" tag:3 selector:@selector(clickIconButton:)];
    [self.iconButtonBGView addSubview:self.buttonSB];
    
    self.buttonYL = [self getIconButton:@"阿斯蒂芬" imageName:@"home_yanglao.png" tag:4 selector:@selector(clickIconButton:)];
    [self.iconButtonBGView addSubview:self.buttonYL];
    
    self.gjjbkImageView = [UIImageView new];
    self.gjjbkImageView.userInteractionEnabled = YES;
    self.gjjbkImageView.clipsToBounds = YES;
    self.gjjbkImageView.image = [UIImage imageNamed:@"banner.png"];
    [self.gjjbkImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBaikeButton:)]];
    [self addSubview:self.gjjbkImageView];

}

- (IconButton *)getIconButton:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag selector:(SEL)selector{
    IconButton *button = [[IconButton alloc]initWithTitle:title normalImage:imageName];
    button.tag = tag;
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)setUpIconLayout{
    CGFloat distance = 10;
    
    CGFloat buttonHeight = 62;
    CGFloat buttonWidth = (ScreenWidth - marginX * 2 - 3 * distance)/4;
    
    [self.iconButtonBGView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(buttonHeight);
    }];
    [self.buttonGJJ mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(buttonHeight);
        make.centerY.equalTo(self.iconButtonBGView);
        make.left.equalTo(self.iconButtonBGView.mas_left).offset(marginX);
    }];
    [self.buttonJJB mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(buttonHeight);
        make.centerY.equalTo(self.iconButtonBGView);
        make.left.equalTo(self.buttonGJJ.mas_right).offset(distance);
    }];
    [self.buttonSB mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(buttonHeight);
        make.centerY.equalTo(self.iconButtonBGView);
        make.left.equalTo(self.buttonJJB.mas_right).offset(distance);
    }];
    [self.buttonYL mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(buttonHeight);
        make.centerY.equalTo(self.iconButtonBGView);
        make.left.equalTo(self.buttonSB.mas_right).offset(distance);
    }];
    
    //公积金百科
    CGFloat gjjbkWidth = ScreenWidth - marginX * 2;
    CGFloat gjjbkHeight = gjjbkWidth/4.2;//宽高比4.2
    [self.gjjbkImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconButtonBGView.mas_bottom).offset(36);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(gjjbkWidth);
        make.height.mas_equalTo(gjjbkHeight);
    }];
    
}

- (void)setUpBarViews{
    NSDictionary *params = @{
                             @"title":@"阿斯顿发",
                             @"imageOneName":@"tool_banner.png",
                             @"imageTwoName":@"chafangjia.png",
                             };
    self.homeView = [self getBarViewWithParams:params selecterOne:@selector(clickFangDaiButton:) selecterTwo:@selector(clickFangJiaButton:)];
    [self.homeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gjjbkImageView.mas_bottom).offset(32);
        make.left.right.equalTo(self);
    }];
    
    NSDictionary *paramsTwo = @{
                             @"title":@"撒大声地",
                             @"imageOneName":@"geshuijisuanqi.png",
                             @"imageTwoName":@"nianzhongjia.png",
                             };
    self.lifeView = [self getBarViewWithParams:paramsTwo selecterOne:@selector(clickGeShuiButton:) selecterTwo:@selector(clickJiangjinButton:)];
    [self.lifeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeView.mas_bottom).offset(32);
        make.left.right.equalTo(self);
    }];
}

- (UIView *)getBarViewWithParams:(NSDictionary *)params selecterOne:(SEL)selecterOne selecterTwo:(SEL)selecterTwo{
    
    NSString *imageOneName = params[@"imageOneName"];
    NSString *imageTwoName = params[@"imageTwoName"];
    NSString *title = params[@"title"];
    
    UIView *BGView = [[UIView alloc]init];
    [self addSubview:BGView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = RGBColorHex(0x333333);
    [BGView addSubview:titleLabel];
    
    UIImageView *oneImageView = [self getBarImageView:imageOneName selecter:selecterOne];
    [BGView addSubview:oneImageView];
    
    UIImageView *twoImageView = [self getBarImageView:imageTwoName selecter:selecterTwo];
    [BGView addSubview:twoImageView];
    
    
    [titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BGView);
        make.left.equalTo(BGView).offset(marginX);
    }];
    
    CGFloat barDistance = 10;
    CGFloat barImageWidth = (ScreenWidth - marginX * 2 - barDistance)/2;
    CGFloat barImageHeight = barImageWidth/2;
    [oneImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(BGView.mas_bottom);
        make.left.equalTo(BGView).offset(marginX);
        make.width.mas_equalTo(barImageWidth);
        make.height.mas_equalTo(barImageHeight);
    }];
    
    [twoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(barImageWidth);
        make.height.mas_equalTo(barImageHeight);
        make.centerY.equalTo(oneImageView);
        make.right.equalTo(BGView).offset(-marginX);
    }];
    
    return BGView;
}

- (UIImageView *)getBarImageView:(NSString *)imageName selecter:(SEL)selecter {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.userInteractionEnabled = YES;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:imageName];
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:selecter]];
    return imageView;
}

- (void)setUpTailViews{
    UIView *tailView = [[UIView alloc]init];
    tailView.backgroundColor = [UIColor whiteColor];
    [self addSubview:tailView];
    [tailView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(100);
        make.top.equalTo(self.lifeView.mas_bottom);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);//设置根视图的高度
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"wenan.png"];
    [tailView addSubview:imageView];
    [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
       make.center.equalTo(tailView);
    }];
}

- (void)clickIconButton:(UIButton *)sender{
    
    HomeBannerEvent *event;
    if (sender.tag == 1) {
        event = HomeBannerEventGongjijin;
    } else if(sender.tag == 2){
        event = HomeBannerEventJijiaban;
    }else if(sender.tag == 3){
        event = HomeBannerEventShebao;
    }else if(sender.tag == 4){
        event = HomeBannerEventYanglao;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHomeBannerEvent:)] && event) {
        [self.delegate clickHomeBannerEvent:event];
    }
}

- (void)clickBaikeButton:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHomeBannerEvent:)]) {
        [self.delegate clickHomeBannerEvent:HomeBannerEventBaike];
    }
}

- (void)clickFangDaiButton:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHomeBannerEvent:)]) {
        [self.delegate clickHomeBannerEvent:HomeBannerEventFangdai];
    }
}

-(void)clickFangJiaButton:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHomeBannerEvent:)]) {
        [self.delegate clickHomeBannerEvent:HomeBannerEventFangjia];
    }
}

- (void)clickGeShuiButton:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHomeBannerEvent:)]) {
        [self.delegate clickHomeBannerEvent:HomeBannerEventGeshui];
    }
}

-(void)clickJiangjinButton:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHomeBannerEvent:)]) {
        [self.delegate clickHomeBannerEvent:HomeBannerEventJiangjin];
    }
}



@end
