//
//  UIProgressAlertView.h
//  SpeechToText
//
//  Created by dima on 7/3/12.
//  Copyright (c) 2012 Dmitry Klimkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIProgressAlertView : UIAlertView
{
    @private
    UIActivityIndicatorView *activityIndicator_;
}

- (id)initWithTitle:(NSString *)title delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;

@end
