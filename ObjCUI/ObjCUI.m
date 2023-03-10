//
//  ObjCUI.m
//  ObjCUI
//
//  Created by shayanbo on 2023/3/9.
//

#import "ObjCUI.h"

UIStackView *VStack(UIStackViewDistribution distribution, NSArray<UIView *> *subviews) {
     UIStackView *v = [[UIStackView alloc] initWithArrangedSubviews:subviews];
     v.axis = UILayoutConstraintAxisVertical;
     v.alignment = UIStackViewAlignmentFill;
     v.distribution = distribution;
     return v;
}

UIStackView *HStack(UIStackViewDistribution distribution, NSArray<UIView *> *subviews) {
     UIStackView *v = [[UIStackView alloc] initWithArrangedSubviews:subviews];
     v.axis = UILayoutConstraintAxisHorizontal;
     v.alignment = UIStackViewAlignmentFill;
     v.distribution = distribution;
     return v;
}

UIView *HSpace(CGFloat width) {
    UIView *v = [[UIView alloc] init];
    [v.widthAnchor constraintEqualToConstant:width].active = YES;
    return v;
}

UIView *VSpace(CGFloat height) {
    UIView *v = [[UIView alloc] init];
    [v.heightAnchor constraintEqualToConstant:height].active = YES;
    return v;
}

UIView *AnySpace() {
    return [[UIView alloc] init];
}
