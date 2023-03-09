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
        self.avatarUrl = @"";
        self.time = @"2023-03-09 12:00:00";
    }
    return self;
}

- (void)updateName:(NSString *)name {
    self.name = name;
}

@end
