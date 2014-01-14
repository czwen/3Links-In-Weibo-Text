//
//  AppDelegate.m
//  3Link In Weibo Text
//
//  Created by Ryan ChenZhiWen on 1/13/14.
//  Copyright (c) 2014 Ryan ChenZhiWen. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize textView = _textView;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(void)awakeFromNib
{
    [self findSomeLink];
}



- (void)findSomeLink
{
    NSString *text = _textView.textStorage.string;
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:text];
    //设置属性
    NSDictionary *fullAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont systemFontOfSize:18.0], NSFontAttributeName, nil];
    [attributeString addAttributes:fullAttributes range:NSMakeRange(0, [text length])];
    
    //遍历text，利用正则表达式获取所需的字符串，并存在数组里
    NSArray *linkMatches = [text scanStringForLinks];
    NSArray *usernameMatches = [text scanStringForUsernames];
    NSArray *hashtagMatches = [text scanStringForHashtags];
    NSArray *emojiMathces = [text scanStringForEmoji];
    //为链接添加属性（颜色、字体……）
    for (NSString *linkMatchedString in linkMatches) {
        NSRange range = [text rangeOfString:linkMatchedString];
        
        if (range.location != NSNotFound) {
            // Add custom attribute of LinkMatch to indicate where our URLs are found. Could be blue
            // or any other color.
            NSDictionary *LinkMatch = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      [NSCursor pointingHandCursor], NSCursorAttributeName,
                                      [NSColor blueColor], NSForegroundColorAttributeName,
                                      [NSFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,
                                      linkMatchedString, @"LinkMatch",
                                      nil];
            [attributeString addAttributes:LinkMatch range:range];
        }
    }
    
    for (NSString *usernameMatchedString in usernameMatches) {
        NSRange range = [text rangeOfString:usernameMatchedString];
        
        if (range.location != NSNotFound) {
            // Add custom attribute of UsernameMatch to indicate where our usernames are found
            NSDictionary *UsernameMatch = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       [NSColor orangeColor], NSForegroundColorAttributeName,
                                       [NSCursor pointingHandCursor], NSCursorAttributeName,
                                       [NSFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,
                                       usernameMatchedString, @"UsernameMatch",
                                       nil];
            [attributeString addAttributes:UsernameMatch range:range];
        }
    }
    
    for (NSString *hashtagMatchedString in hashtagMatches) {
        NSRange range = [text rangeOfString:hashtagMatchedString];
        
        if (range.location != NSNotFound) {
            // Add custom attribute of HashtagMatch to indicate where our hashtags are found
            NSDictionary *HashtagMatch = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       [NSColor grayColor], NSForegroundColorAttributeName,
                                       [NSCursor pointingHandCursor], NSCursorAttributeName,
                                       [NSFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,
                                       hashtagMatchedString, @"HashtagMatch",
                                       nil];
            [attributeString addAttributes:HashtagMatch range:range];
        }
    }
    
    for (NSString *emojiMatchedString in emojiMathces) {
        NSRange range = [text rangeOfString:emojiMatchedString];
        
        if (range.location != NSNotFound) {
            // Add custom attribute of HashtagMatch to indicate where our hashtags are found
            NSDictionary *emojiMatch = [[NSDictionary alloc] initWithObjectsAndKeys:
                                          [NSColor redColor], NSForegroundColorAttributeName,
                                          [NSCursor pointingHandCursor], NSCursorAttributeName,
                                          [NSFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,
                                          emojiMatchedString, @"EmojiMatch",
                                          nil];
            [attributeString addAttributes:emojiMatch range:range];
        }
    }
    
    //设置text
    [[_textView textStorage]setAttributedString:attributeString];
}


@end
