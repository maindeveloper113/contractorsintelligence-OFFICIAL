//
//  Queries.h
//  
//
//  Created by Brian Roy Villanueva on 1/11/13.
//  Copyright (c) 2013 BRX Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
@interface Queries : NSObject
//+(NSString *)formatString:(NSString *)dString;
+(NSString *)formatStringAns:(NSString *)dString;
+(UIImage*)imageContentFile:(NSString*)imageName;
+(void)setDefault:(NSString*)userObject objectKey:(NSString*)keyString;
@end

