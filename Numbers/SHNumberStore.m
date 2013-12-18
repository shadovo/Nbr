//
//  SHNumberStore.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-14.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHNumberStore.h"

@implementation SHNumberStore

+(SHNumberStore *)sharedStore
{
    static SHNumberStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

-(id)init
{
    if (self = [super init]) {
        allResults = [[NSArray alloc]init];
        descriptionTexts = @[@"Square", @"Square root", @"Hex", @"Binary", @"Roman", @"Prime number", @"Palindrome", @"Triangle number"];
        
        extendedDescriptionTexts = @[@"In algebra, a square is the result of multiplying a number, or other expression, by itself. In other words, squaring is exponentiation to the power 2.",
                                    @"In mathematics, a square root of a number a is a number y such that y^2 = a, or, in other words, a number y whose square (the result of multiplying the number by itself, or y × y) is a.[1] For example, 4 is a square root of 16 because 42 = 16.",
                                    @"In mathematics and computer science, hexadecimal (also base 16, or hex) is a positional numeral system with a radix, or base, of 16. It uses sixteen distinct symbols, most often the symbols 0–9 to represent values zero to nine, and A, B, C, D, E, F (or alternatively a–f) to represent values ten to fifteen.",
                                    @"The binary numeral system, or base-2 number system, represents numeric values using two symbols: 0 and 1. More specifically, the usual base-2 system is a positional notation with a radix of 2. Because of its straightforward implementation in digital electronic circuitry using logic gates, the binary system is used internally by almost all modern computers.",
                                    @"Roman numerals, the numeric system of ancient Rome, uses combinations of letters from the Latin alphabet to signify values. The numbers 1 to 10 can be expressed in Roman numerals as follows:I, II, III, IV, V, VI, VII, VIII, IX, and X",
                                    @"A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself. A natural number greater than 1 that is not a prime number is called a composite number. For example, 5 is prime, as only 1 and 5 divide it, whereas 6 is composite, since it has the divisors 2 and 3 in addition to 1 and 6.",
                                    @"A palindromic number or numeral palindrome is a number that remains the same when its digits are reversed. Like 16461, for example, it is \"symmetrical\". The term palindromic is derived from palindrome, which refers to a word (such as rotor or racecar) whose spelling is unchanged when its letters are reversed.",
                                    @"A triangular number is the sum of all natural numbers of an interval starting with 1. 10 is a triangular number because it is the sum of all numbers in the interval 1 - 4, 1+2+3+4 = 10. The first 6 triangular numbers are 1, 3, 6, 10, 15 and 21."];
    }
    return self;
}

-(NSUInteger)number
{
    return number;
}

-(NSArray *)allResults
{
    return allResults;
}

-(NSArray *)allDescriptionTexts
{
    return descriptionTexts;
}
-(NSString *)extendedDescriptionForIndex:(NSInteger)index
{
    return [extendedDescriptionTexts objectAtIndex:index];
}

-(void)updateResultsWithArray:(NSArray *)results number:(NSUInteger)nr
{
    number = nr;
    allResults = results;
}

@end
