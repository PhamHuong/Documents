//
//  main.m
//  prog2
//
//  Created by nhoangson on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Test memory");
    MyClass *frac1 = [[MyClass alloc] init];
    MyClass *frac2 = [[MyClass alloc] init];
    
    // print current counts
    printf( "Fraction 1 retain count: %i\n", [frac1 retainCount] );
    printf( "Fraction 2 retain count: %i\n", [frac2 retainCount] );
    
    // increment them
    [frac1 retain]; // 2
    [frac1 retain]; // 3
    [frac2 retain]; // 2
    
    // print current counts
    printf( "Fraction 1 retain count: %i\n", [frac1 retainCount] );
    printf( "Fraction 2 retain count: %i\n", [frac2 retainCount] );
    
    // decrement
    [frac1 release]; // 2
    [frac2 release]; // 1
    
    // print current counts
    printf( "Fraction 1 retain count: %i\n", [frac1 retainCount] );
    printf( "Fraction 2 retain count: %i\n", [frac2 retainCount] );
    
    // release them until they dealloc themselves
    [frac1 release]; // 1
    [frac1 release]; // 0
    [frac2 release]; // 0
 


    [pool drain];
    return 0;
}

