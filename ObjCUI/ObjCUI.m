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
