//
//  ObjCUI.h
//  ObjCUI
//
//  Created by shayanbo on 2023/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define fill UIStackViewDistributionFill

#define equal_spacing UIStackViewDistributionEqualSpacing

UIStackView *VStack(UIStackViewDistribution distribution, NSArray<UIView *> *subviews);

UIStackView *HStack(UIStackViewDistribution distribution, NSArray<UIView *> *subviews);

NS_ASSUME_NONNULL_END
