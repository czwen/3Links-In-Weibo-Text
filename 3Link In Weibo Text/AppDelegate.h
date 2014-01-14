//
//  AppDelegate.h
//  3Link In Weibo Text
//
//  Created by Ryan ChenZhiWen on 1/13/14.
//  Copyright (c) 2014 Ryan ChenZhiWen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CustomTextView.h"
#import "NSString+FindSomeLinkInText.h"
@interface AppDelegate : NSObject <NSApplicationDelegate,NSTextDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (unsafe_unretained) IBOutlet CustomTextView *textView;

- (void)mouseDown:(NSEvent*)event;
@end
