//
//  main.m
//  prog4
//
//  Created by nhoangson on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    int sum; 
    /* COMPUTE RESULT */ 
    sum = 25 + 37 - 19 ;
     // DISPLAY RESULTS // 
     NSLog (@"The answer is %i", sum); 

    [pool drain];
    return 0;
}

