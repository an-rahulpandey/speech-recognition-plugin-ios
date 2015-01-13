//
//  UIWaveAlertView.h
//  SpeechToText
//
//  Created by dima on 7/3/12.
//  Copyright (c) 2012 Dmitry Klimkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaveDisplay.h"

@interface UIWaveAlertView : UIAlertView
{
    @private
    WaveDisplay *waveDisplay_;
}

@property(nonatomic, retain, readonly) WaveDisplay *waveDisplay;
@property (nonatomic, retain) NSArray *dataPoints;

- (id)initWithTitle:(NSString *)title delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;

- (void)updateWaveDisplay;

@end