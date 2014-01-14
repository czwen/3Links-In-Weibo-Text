//
//  CustomTextView.m
//  3Link In Weibo Text
//
//  Created by Ryan ChenZhiWen on 1/13/14.
//  Copyright (c) 2014 Ryan ChenZhiWen. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

-(void)mouseDown:(NSEvent *)theEvent
{
	//获得鼠标位置
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    //获取点击的位置在text中的位置
	NSInteger charIndex = [self characterIndexForInsertionAtPoint:point];
    
	//是否在text上点击
	if (NSLocationInRange(charIndex, NSMakeRange(0, [[self string] length])) == YES ) {
		
        //获取点击的字符属性
		NSDictionary *attributes = [[self attributedString] attributesAtIndex:charIndex effectiveRange:NULL];
        
        //处理点击链接后的事件
		if( [attributes objectForKey:@"LinkMatch"] != nil ) {
			NSLog( @"LinkMatch: %@", [attributes objectForKey:@"LinkMatch"] );
            [[NSWorkspace sharedWorkspace]openURL:[NSURL URLWithString:[attributes objectForKey:@"LinkMatch"]]];
		}
		
		if( [attributes objectForKey:@"UsernameMatch"] != nil ) {
			NSLog( @"UsernameMatch: %@", [attributes objectForKey:@"UsernameMatch"] );
		}
		
		if( [attributes objectForKey:@"HashtagMatch"] != nil ) {
			NSLog( @"HashtagMatch: %@", [attributes objectForKey:@"HashtagMatch"] );
		}
		
	}
	
	[super mouseDown:theEvent];

}

@end
