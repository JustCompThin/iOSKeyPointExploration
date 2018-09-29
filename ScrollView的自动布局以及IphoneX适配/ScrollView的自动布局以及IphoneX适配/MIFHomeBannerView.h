//
//  MIFHomeBannerView.h
//  ProvidentFundHome
//
//  Created by huangchengdu on 2018/9/26.
//

#import <UIKit/UIKit.h>

#pragma mark 事件类型枚举
typedef NS_OPTIONS(NSUInteger, HomeBannerEvent){
    HomeBannerEventGongjijin = 1,//公积金
    HomeBannerEventJijiaban,//记加班
    HomeBannerEventShebao,//社保
    HomeBannerEventYanglao,//养老
    HomeBannerEventBaike,//百科
    HomeBannerEventFangdai,//房贷
    HomeBannerEventFangjia,//房价
    HomeBannerEventGeshui,//个税
    HomeBannerEventJiangjin//奖金
};

# pragma mark 事件代理
@protocol MIFHomeBannerViewDelegate <NSObject>

- (void)clickHomeBannerEvent:(HomeBannerEvent)eventType;

@end


NS_ASSUME_NONNULL_BEGIN

@interface MIFHomeBannerView : UIView

@property(nonatomic,weak) id<MIFHomeBannerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
