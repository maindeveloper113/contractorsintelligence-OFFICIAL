//
//  Queries.m
//
//
//  Created by Brian Roy Villanueva on 1/11/13.
//  Copyright (c) 2013 BRX Mobile Inc. All rights reserved.
//

#import "Queries.h"
#import "AppDelegate.h"

#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
@interface UIDevice(Private)

- (NSString *) macaddress;

@end
@interface Queries ()

@end
@implementation Queries

//FOR EXPLANATION
/*
+(NSString *) formatString:(NSString *)dString{
    
    NSString *temp =@"";
    temp = dString;
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"0x26" withString:@"&"];
    //temp = [temp stringByReplacingOccurrencesOfString:@"0x22" withString:@"'"];
    //temp = [temp stringByReplacingOccurrencesOfString:@"0x24" withString:@"$"];
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"0X26" withString:@"&"];
    //temp = [temp stringByReplacingOccurrencesOfString:@"0X22" withString:@"'"];
    //temp = [temp stringByReplacingOccurrencesOfString:@"0X24" withString:@"$"];
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"{amp}" withString:@"&"];
    //temp = [temp stringByReplacingOccurrencesOfString:@"?" withString:@"'"];

    
    //2016
    //temp = [temp stringByReplacingOccurrencesOfString:@"%3B" withString:@";"];

    
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%3F" withString:@"?"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%3A" withString:@":"];
    temp = [temp stringByReplacingOccurrencesOfString:@"23%" withString:@"#"];
    //temp = [temp stringByReplacingOccurrencesOfString:@"26%" withString:@"&"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%3D" withString:@"="];
    //temp = [temp stringByReplacingOccurrencesOfString:@"24%" withString:@"$"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%2C" withString:@","];
    temp = [temp stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    //temp = [temp stringByReplacingOccurrencesOfString:@"25%" withString:@"%"];
    
 
    temp = [temp stringByReplacingOccurrencesOfString:@"%3C" withString:@"<"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%3E" withString:@">"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%2F" withString:@"/"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%7E" withString:@"~"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%22" withString:@"\""];
    
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%26" withString:@"&"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%0D" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"%0A" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%28" withString:@"("];
    temp = [temp stringByReplacingOccurrencesOfString:@"%29" withString:@")"];
    temp = [temp stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%27" withString:@"'"];
    
    
    temp = [temp stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    
    
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%&2339" withString:@"'"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%5B" withString:@"["];
    temp = [temp stringByReplacingOccurrencesOfString:@"%5D" withString:@"]"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%25" withString:@"%"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%21" withString:@"!"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"\"\n\n" withString:@"\"\n\n"];
    
    //NEW
    temp = [temp stringByReplacingOccurrencesOfString:@"%24" withString:@"$"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%&238220;" withString:@"-"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%&238220;" withString:@"\""];
    temp = [temp stringByReplacingOccurrencesOfString:@"%&238221;" withString:@"\""];
    temp = [temp stringByReplacingOccurrencesOfString:@"%F7" withString:@"÷"];
    temp = [temp stringByReplacingOccurrencesOfString:@"&#960;" withString:@"π"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%9D" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"&23960;" withString:@""];
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"%23" withString:@"#"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%09" withString:@""];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"&#176;" withString:@""];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"\n\n" withString:@""];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    
    return temp;
    
}
*/

//FORMAT ANSWER
+(NSString *) formatStringAns:(NSString *)dString{
    
    NSString *temp =@"";
    temp = dString;
    
    
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%3B" withString:@";"];
    
    //NEW
    temp = [temp stringByReplacingOccurrencesOfString:@"&#247;" withString:@"÷"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    
    //DEGREES
    temp = [temp stringByReplacingOccurrencesOfString:@"%B0" withString:@"°"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"&#176;" withString:@"°"];
    
   
    temp = [temp stringByReplacingOccurrencesOfString:@"%24" withString:@"$"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%22" withString:@"\""];

    temp = [temp stringByReplacingOccurrencesOfString:@"%F7" withString:@"÷"];
    
    
    //2016
    temp = [temp stringByReplacingOccurrencesOfString:@"%3B" withString:@";"];
    //
    

    
    temp = [temp stringByReplacingOccurrencesOfString:@"%3F" withString:@"?"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%3A" withString:@":"];
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"23%" withString:@"#"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"26%" withString:@"&"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%3D" withString:@"="];
    //temp = [temp stringByReplacingOccurrencesOfString:@"24%" withString:@"$"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%2C" withString:@","];
    //temp = [temp stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    //temp = [temp stringByReplacingOccurrencesOfString:@"25%" withString:@"%"];
    
    //STRONG NOT WORKING
    temp = [temp stringByReplacingOccurrencesOfString:@"%3C" withString:@"<"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%3E" withString:@">"];
    //
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%2F" withString:@"/"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%7E" withString:@"~"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%26" withString:@"&"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%0D" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"%0A" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%28" withString:@"("];
    temp = [temp stringByReplacingOccurrencesOfString:@"%29" withString:@")"];
    temp = [temp stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    temp = [temp stringByReplacingOccurrencesOfString:@"%27" withString:@"'"];
    
    //
    //2016
    temp = [temp stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    //
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%&2339" withString:@"'"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%5B" withString:@"["];
    temp = [temp stringByReplacingOccurrencesOfString:@"%5D" withString:@"]"];
    temp = [temp stringByReplacingOccurrencesOfString:@"%25" withString:@"%"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"%21" withString:@"!"];
    
   
    
    temp = [temp stringByReplacingOccurrencesOfString:@"\n\n" withString:@""];
    
    //NEW 2016
    temp = [temp stringByReplacingOccurrencesOfString:@"&#960;" withString:@"π"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"<sup>2</sup>" withString:@"\u00B2"];
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"%23" withString:@"#"];
   
    temp = [temp stringByReplacingOccurrencesOfString:@"%&23960;" withString:@"π"];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"';" withString:@"'"];
    
    //temp = [temp stringByReplacingOccurrencesOfString:@"%3B" withString:@"π"];

    
   // temp = [temp stringByReplacingOccurrencesOfString:@"&quot%3B" withString:@"\""];
    
    
  
    //temp = [temp stringByReplacingOccurrencesOfString:@";" withString:@""];
    
    
    /* Sup
    \u2070 is superscript 0
    
    \u00B9 is superscript 1
    
    \u00B2 is superscript 2
    
    \u00B3 is superscript 3
    
    \u2074 is superscript 4
    
    \u2075 is superscript 5
    
    \u2076 is superscript 6
    
    \u2077 is superscript 7
    
    \u2078 is superscript 8
    
    \u2079 is superscript 9
    */
  
   

    return temp;
    
}

+(UIImage*)imageContentFile:(NSString*)imageName{
    UIImage *tempImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                           pathForResource:imageName ofType:@"png"]];
    return tempImage;

}

+(void)setDefault:(NSString*)userObject objectKey:(NSString*)keyString{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userObject forKey:keyString];
}

@end
