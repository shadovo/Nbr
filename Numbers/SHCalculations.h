//
//  SHCalculations.h
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-11.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHCalculations : NSObject
{
    NSArray *results;
}

@property (nonatomic) NSUInteger number;

@property (nonatomic, copy) NSString *square;
@property (nonatomic, copy) NSString *root;
@property (nonatomic, copy) NSString *hex;
@property (nonatomic, copy) NSString *binary;
@property (nonatomic, copy) NSString *roman;

@property (nonatomic) BOOL prime;
@property (nonatomic) BOOL palindrome;
@property (nonatomic) BOOL tringle;



+(id)calculateForNumber:(NSUInteger)number;

-(id)initWithNumber:(NSUInteger)number;


@end
