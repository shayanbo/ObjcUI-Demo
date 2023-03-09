//
//  ViewModel.h
//  ObjCUI
//
//  Created by shayanbo on 2023/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

#pragma mark - Output

@property (nonatomic, copy, readonly) NSString *avatarUrl;

@property (nonatomic, copy, readonly) NSString *name;

@property (nonatomic, copy, readonly) NSString *time;

#pragma mark - Input

- (void)updateName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
