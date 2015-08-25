//
//  Todo.h
//  Every.Do
//
//  Created by Yazan Khayyat on 2015-08-18.
//  Copyright (c) 2015 Yazan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic, strong) NSString *todoDescription;

@property (nonatomic, assign) int priorityNumber;

@property (nonatomic, assign) BOOL isCompletedIndicator;

- (instancetype)initWithTitle: (NSString *)title todoDescription:(NSString *)todoDescription priorityNumber:(int)priotiyNumber isCompletedIndicator:(BOOL)isCompletedIndicator;


@end
