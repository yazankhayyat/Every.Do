
//
//  Todo.m
//  Every.Do
//
//  Created by Yazan Khayyat on 2015-08-18.
//  Copyright (c) 2015 Yazan. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle: (NSString *)title todoDescription:(NSString *)todoDescription priorityNumber:(int)priotiyNumber isCompletedIndicator:(BOOL)isCompletedIndicator
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = todoDescription;
        _priorityNumber = priotiyNumber;
        _isCompletedIndicator = isCompletedIndicator;


    }
    return self;
}

@end
