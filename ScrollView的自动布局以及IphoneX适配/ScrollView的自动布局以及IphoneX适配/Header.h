//
//  Header.h
//  ScrollView的自动布局以及IphoneX适配
//
//  Created by huangchengdu on 2018/9/28.
//  Copyright © 2018年 huangchengdu. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height

#define RGBColorHex(colorInHex) [UIColor colorWithRed:((float) ((colorInHex & 0xFF0000) >> 16)) / 0xFF green:((float) ((colorInHex & 0xFF00)   >> 8))  / 0xFF blue:((float)  (colorInHex & 0xFF)) / 0xFF alpha:1.0]

#endif /* Header_h */
