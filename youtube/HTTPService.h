//
//  HTTPService.h
//  youtube
//
//  Created by Vuk on 5/14/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString *__nullable errMessage); //blok

@interface HTTPService : NSObject

+ (id) singleton; //singleton je objekat klase koji se moze instncirati samo jednom
- (void) test;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end
