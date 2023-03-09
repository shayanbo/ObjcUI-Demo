//
//  ViewController.m
//  ObjCUI
//
//  Created by shayanbo on 2023/3/9.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/SDWebImage.h>

#import "ViewController.h"
#import "ViewModel.h"
#import "ObjCUI.h"

#define Observe(target, keypath) [target rac_valuesForKeyPath:NSStringFromSelector(@selector(keypath)) observer:target]

/**
## Demo Project for using UIKit in a `SwiftUI` way
 */

@interface ViewController ()

@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// ViewModel
    ViewModel *vm = [[ViewModel alloc] init];
    self.viewModel = vm;
    
    /// View
    UIView *v = HStack(fill, @[
        AvatarView(vm),
        VStack(fill, @[
            NameView(vm),
            TimeView(vm),
        ])
    ]);
    
    [self.view addSubview:v];
    v.frame = self.view.bounds;
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

static UIView *AvatarView(ViewModel *viewModel) {
    UIImageView *img = [UIImageView new];
    img.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
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
