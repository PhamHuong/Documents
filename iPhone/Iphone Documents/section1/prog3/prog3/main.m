//
//  main.m
//  prog3
//
//  Created by nhoangson on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    int result = 87 - 15;
    NSLog(@"87 - 15 = %i", result);

    [pool drain];
    return 0;
}

