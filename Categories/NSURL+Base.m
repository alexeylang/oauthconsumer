//
//  NSURL+Base.m
//  OAuthConsumer
//
//  Created by Jon Crosby on 10/19/07.
//  Copyright 2007 Kaboomerang LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "NSURL+Base.h"


@implementation NSURL (OABaseAdditions)

- (NSString *)URLStringWithoutQuery {
    NSArray *parts = [[self absoluteString] componentsSeparatedByString:@"?"];
    return [parts firstObject];
}

- (NSString *)URLQueryString {
    NSArray *parts = [[self absoluteString] componentsSeparatedByString:@"?"];
    if ( [parts count] > 1 )
    {
        return [parts objectAtIndex:1];
    }
    return nil;
}

- (NSDictionary *)URLParams {
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    NSArray *urlComponents = [[self URLQueryString] componentsSeparatedByString:@"&"];
    for (NSString *keyValuePair in urlComponents)
    {
        NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        if ( [pairComponents count] == 2 )
        {
            NSString *key = [pairComponents objectAtIndex:0];
            NSString *value = [pairComponents objectAtIndex:1];
            [paramsDict setObject:value forKey:key];
        }
    }
    return paramsDict;
}

@end
