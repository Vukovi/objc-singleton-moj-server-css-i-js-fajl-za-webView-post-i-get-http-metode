//
//  HTTPService.m
//  youtube
//
//  Created by Vuk on 5/14/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService


+ (id) singleton {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {  //ovo @synchronized je tu zbog bezbednijeg rada sa multi-threading-om
        if (sharedInstance == nil) { //prvi put ce biti nil, onda kad se u sl redu inicijalizuje, zbog gornjeg static to ce biti samo jednom, onda ce posle toga stalno imati rednost, tj biti singleton
            sharedInstance = [[self alloc] init];
        }
    }
    
    return sharedInstance;
}

- (void) test {
    NSLog(@"DOBAR DAN");
}

- (void) getTutorials:(nullable onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s,%s", URL_BASE,URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil,err.debugDescription);
            }
        } else {
            NSLog(@"NETworkErr: %@", error.debugDescription);
            completionHandler(nil,error.debugDescription);
        }
        
    }] resume];
}

@end
