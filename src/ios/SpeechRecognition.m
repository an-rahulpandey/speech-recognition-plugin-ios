//
//  SpeechRecognition.m
//  VoiceRecognition
//
//  Created by Rahul on 1/11/14.
//
//

#import "SpeechRecognition.h"


@implementation SpeechRecognition
@synthesize callbackId;

-(void)startRecording:(CDVInvokedUrlCommand *)command
{
    self.callbackId = callbackId;
    CDVPluginResult *pluginResult = nil;
    self.speech = [[SpeechToTextModule alloc] initWithNoGUIAndLocale:kLANG_ENGLISH];
    [self.speech setDelegate:self];
    [self.speech beginRecording];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

-(void)stopRecording:(CDVInvokedUrlCommand *)command
{
    [self.speech stopRecording:YES];
}

-(void)didRecognizeResponse:(NSString *)recognizedText
{
    NSLog(@"Recognized Text = %@",recognizedText);
}

-(void)speechStartRecording
{
    NSLog(@"REC...");
}

-(void)speechStopRecording
{
    NSLog(@"STOP");
}

@end
