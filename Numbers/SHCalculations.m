//
//  SHCalculations.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-11.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHCalculations.h"
#import "SHNumberStore.h"

@interface SHCalculations (hidden)

-(NSString*)calcSquare;

-(NSString*)calcRoot;

-(NSString*)inHex;

-(NSString*)inBinary;

-(NSString *)inRoman;

-(BOOL)isPrime;

-(BOOL)isTriangleNumber;

-(BOOL)isNumberPalindrome;

-(BOOL)isStringPalindrome:(NSString*)str;

-(void)sendResultsToStore;

@end

/*
 *
 */

@implementation SHCalculations (hidden)

// Calculate and return the square of the number
-(NSString*)calcSquare
{
    if (self.number > 36678) {
        return @"Number to large";
    }
    return [NSString stringWithFormat:@"%u", (self.number*self.number)];
}

// Calculate and return the squareroot of the number
-(NSString*)calcRoot
{
    return [NSString stringWithFormat:@"%f", sqrt(self.number)];
   
}

// Return a string with the hex value of the number
-(NSString*)inHex
{
    return [NSString stringWithFormat:@"%X", self.number];
}

// Return a string with the number in binary
-(NSString*)inBinary
{
    if (self.number == 0) {
        return @"0";
    }
    NSMutableString *binary = [[NSMutableString alloc] init];
    
    for (NSUInteger numberCopy = self.number; numberCopy > 0; numberCopy >>= 1) {
        [binary insertString:((numberCopy & 1 ) ? @"1" : @"0") atIndex: 0];
    }
    return binary;
}

// Return a string with the number in roman numbers
-(NSString *)inRoman
{
    
    if (self.number == 0) {
        return @"N";
    }
    if (self.number > 5000) {
        return @"Number to large";
    }
    NSUInteger newNumber = self.number;
    NSArray *numbers = @[@"1000", @"900", @"500", @"400", @"100", @"90", @"50", @"40", @"10", @"9", @"5", @"4", @"1"];
    NSArray *letters = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
    
    NSMutableString *roman = [[NSMutableString alloc] init];
    
    for (int i = 0; i < 13 ;  i++) {
        while (newNumber >= [[numbers objectAtIndex:i]intValue]) {
            newNumber -= [[numbers objectAtIndex:i]intValue];
            [roman appendString:[letters objectAtIndex:i]];
        }
    }
    return roman;
}

// Return a BOOL of weather or not the number is a prime number
-(BOOL)isPrime
{
    NSUInteger root = sqrtl(self.number)+1;
    if (self.number%2 == 0 && self.number != 2) {
        return NO;
    }
    for (NSUInteger ref = 3; ref < root; ref += 2) {
        NSUInteger res = self.number%ref;
        if(!res){
            return NO;
        }
    }
    return YES;
}
// Return a BOOL of weather or not the number is a triangle number
-(BOOL)isTriangleNumber
{
    int sum = 0;
    for (int i = 0; sum < self.number; i++) {
        sum = sum + i;
        
        if(sum == self.number){
            return YES;
        }
    }
    return NO;
}

// Return a BOOL of weather or not the number is a palindrome
-(BOOL)isNumberPalindrome
{
    BOOL oui = YES;
    NSInteger newNumber = self.number;
    while (oui) {
        
        NSInteger lastDigit = newNumber%10, firstDigit = newNumber, digits = 0;
        
        while (firstDigit > 10) {
            firstDigit = firstDigit/10;
            digits++;
        }
        if (firstDigit == lastDigit) {
            newNumber = (newNumber - firstDigit * pow(10.0, digits))/10;
        } else {
            return NO;
        }
        
        if (newNumber == 0) {
            return YES;
        }
        
    }
    return NO;
}

// Check if a string is a palindrome
-(BOOL)isStringPalindrome:(NSString*)str
{
    return NO;
}

-(void)sendResultsToStore
{
    [[SHNumberStore sharedStore] updateResultsWithArray:@[self.square, self.root, self.hex, self.binary, self.roman, [NSString stringWithFormat:@"%@", (self.prime ? @"YES" : @"NO")] , [NSString stringWithFormat:@"%@", (self.palindrome ? @"YES" : @"NO")], [NSString stringWithFormat:@"%@", (self.tringle ? @"YES" : @"NO")]] number:self.number];
}

@end

/*
 *
 */

@implementation SHCalculations

@synthesize number = _number;
@synthesize square = _square;
@synthesize root = _root;
@synthesize hex = _hex;
@synthesize binary = _binary;
@synthesize prime = _prime;
@synthesize palindrome = _palindrome;
@synthesize tringle = _tringle;
@synthesize roman = _roman;

+(id) calculateForNumber:(NSUInteger)number
{
    return [[self alloc]initWithNumber:number];
}

// Designated initialiser
-(id)initWithNumber:(NSUInteger)number
{
    if (self = [super init]) {
        _number = number;
        _square = [self calcSquare];
        _root = [self calcRoot];
        _hex = [self inHex];
        _binary = [self inBinary];
        _roman = [self inRoman];
        _prime = [self isPrime];
        _palindrome = [self isNumberPalindrome];
        _tringle = [self isTriangleNumber];
        
        [self sendResultsToStore];
    }
    return self;
}


-(id)init
{
    return [self initWithNumber:73];
}

-(NSString *)description
{
    return [NSString stringWithFormat: @"\nnumber: %u\nisPrime: %@\nsquare: %@\nroot: %@\nhex: %@\nbinary: %@\nroman: %@\npalindrome: %@\ntriangle: %@", self.number, (self.prime ? @"YES" : @"NO"), self.square, self.root, self.hex, self.binary, self.roman, (self.palindrome ? @"YES" : @"NO"), (self.tringle ? @"YES" : @"NO")];
}



@end
