//
//  main.m
//  Project_Euler_44
//
//  Created by Virata Yindeeyoungyeon on 4/27/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:
 
 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
 
 It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is not pentagonal.
 
 Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?
 */

#import <Foundation/Foundation.h>

BOOL isPentagonalNumber(int num)
{
    //Quadratic formula
    //x1 = (-b + sqrt(b^2 - 4ac))/2a
    
    //val=n(3n−1)/2
    //0 = 3n^2 -n -2*val
    
    int a = 3;
    int b = -1;
    int c = -2 * num;
    
    double x = (-b + sqrt(b*b - 4*a*c)) / (2*a);
    
    if (x != (int)x) {
        return NO;
    }
    
    return YES;
}

int minimizedPantagonalNumber()
{
    int minimizedVal = INT_MAX;
    int i = 1;
    while (minimizedVal == INT_MAX) {
        for (int j = i-1; j > 0; j--) {
            int pentagonalI = i*(3*i - 1)/2;
            int pentagonalJ = j*(3*j - 1)/2;
            
            if (isPentagonalNumber(pentagonalJ + pentagonalI) && isPentagonalNumber(pentagonalI - pentagonalJ)) {
                minimizedVal = pentagonalI - pentagonalJ;
            }
        }
        i++;
    }
    
    return minimizedVal;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", minimizedPantagonalNumber());
        //5482660
    }
    return 0;
}