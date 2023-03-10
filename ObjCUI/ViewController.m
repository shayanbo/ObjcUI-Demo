//
//  ViewController.m
//  ObjCUI
//
//  Created by shayanbo on 2023/3/9.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>

#import "ViewController.h"
#import "ViewModel.h"
#import "ObjCUI.h"

#define Observe(target, keypath) [target rac_valuesForKeyPath:NSStringFromSelector(@selector(keypath)) observer:target]

@interface ViewController ()

@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    /// ViewModel
    ViewModel *vm = [[ViewModel alloc] init];
    self.viewModel = vm;
    
    /// View
    UIView *v = HStack(fill, @[
        AvatarView(vm),
        HSpace(8),
        VStack(fill, @[
            VSpace(20),
            NameView(vm),
            AnySpace(),
            TimeView(vm),
            VSpace(20),
        ])
    ]);
    
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        [make install];
    }];
}

static UIView *AvatarView(ViewModel *viewModel) {
    UIImageView *img = [UIImageView new];
    img.layer.cornerRadius = 50;
    img.layer.masksToBounds = YES;
    img.layer.borderColor = [UIColor blackColor].CGColor;
    img.layer.borderWidth = 1;
    [img.widthAnchor constraintEqualToConstant:100].active = YES;
    [img.heightAnchor constraintEqualToConstant:100].active = YES;
    img.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    [img addGestureRecognizer:tap];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        [viewModel updateName: @"Yanbo Sha"];
    }];
    
    [Observe(viewModel, avatarUrl) subscribeNext:^(id x) {
        [img sd_setImageWithURL:[NSURL URLWithString:x]];
    }];
    return img;
}

static UIView *NameView(ViewModel *viewModel) {
    UILabel *lbl = [UILabel new];
    [Observe(viewModel, name) subscribeNext:^(id x) {
        lbl.text = x;
    }];
    return lbl;
}

static UIView *TimeView(ViewModel *viewModel) {
    UILabel *lbl = [UILabel new];
    [Observe(viewModel, time) subscribeNext:^(id x) {
        lbl.text = x;
    }];
    return lbl;
}

@end
