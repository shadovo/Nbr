//
//  SHNumberStore.h
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-14.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHNumberStore : NSObject
{
    NSArray *allResults;
    NSArray *descriptionTexts;
    NSArray *extendedDescriptionTexts;
    NSUInteger number;
}

+(SHNumberStore*)sharedStore;

-(NSUInteger)number;
-(NSArray *)allResults;
-(NSArray *)allDescriptionTexts;
-(NSString *)extendedDescriptionForIndex:(NSInteger)index;

-(void)updateResultsWithArray:(NSArray *)results number:(NSUInteger)nr;



@end
