//
//  NSString+FindSomeLinkInText.m
//  WeeBoo
//
//  Created by Ryan ChenZhiWen on 12/20/13.
//  Copyright (c) 2013 Ryan ChenZhiWen. All rights reserved.
//

#import "NSString+FindSomeLinkInText.h"
#import "RegexKitLite.h"
@implementation NSString (FindSomeLinkInText)

- (NSArray *)scanStringForLinks {
	return [self componentsMatchedByRegex:@"(([http]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))[\\x00-\\xff]"];
}

- (NSArray *)scanStringForUsernames {
	return [self componentsMatchedByRegex:@"@[\\u4e00-\\u9fa5\\w\\-]+"];
}

- (NSArray *)scanStringForHashtags {
	return [self componentsMatchedByRegex:@"#([^\\#|.]+)#"];
}

- (NSArray *)scanStringForEmoji {
	return [self componentsMatchedByRegex:@"\\[([^\\#|.]+)\\]"];
}
@end
