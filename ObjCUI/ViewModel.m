//
//  ViewModel.m
//  ObjCUI
//
//  Created by shayanbo on 2023/3/9.
//

#import "ViewModel.h"

@interface ViewModel ()

@property (nonatomic, copy, readwrite) NSString *avatarUrl;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *time;

@end

@implementation ViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        /// load mock data
        self.name = @"Rock";
        self.avatarUrl = @"https://miro.medium.com/v2/resize:fill:100:100/1*kOyC7Snkp0xpEFJCdIO4Yg.jpeg";
        self.time = @"Born in: 1992.11.23";
    }
    return self;
}

- (void)updateName:(NSString *)name {
    self.name = name;
}

@end
