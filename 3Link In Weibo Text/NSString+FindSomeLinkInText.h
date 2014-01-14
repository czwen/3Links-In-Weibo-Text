//
//  NSString+FindSomeLinkInText.h
//  WeeBoo
//
//  Created by Ryan ChenZhiWen on 12/20/13.
//  Copyright (c) 2013 Ryan ChenZhiWen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FindSomeLinkInText)

- (NSArray *)scanStringForLinks;
- (NSArray *)scanStringForUsernames;
- (NSArray *)scanStringForHashtags;
- (NSArray *)scanStringForEmoji;
@end
