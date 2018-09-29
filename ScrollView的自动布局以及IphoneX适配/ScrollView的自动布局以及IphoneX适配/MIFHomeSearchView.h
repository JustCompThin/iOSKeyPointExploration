//
//  MIFHomeSearchView.h
//  ProvidentFundHome
//
//  Created by huangchengdu on 2018/9/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, HomeSearchShowModule){
    HomeSearchShowModuleDefault = 1,
    HomeSearchShowModuleQuery = 2
};

@protocol MIFHomeSearchViewDelegate <NSObject>

- (void)clickDetailButton;
- (void)clickSearchButton;

@end


@interface MIFHomeSearchView : UIView

@property(nonatomic,weak) id<MIFHomeSearchViewDelegate> delegate;

- (void)updateWithMoney:(CGFloat)money showModule:(HomeSearchShowModule)showModule;
@end

NS_ASSUME_NONNULL_END
