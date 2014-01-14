//
//  SpeechRecognition.m
//  VoiceRecognition
//
//  Created by Rahul on 1/11/14.
//
//

#import "SpeechRecognition.h"

static NSString *output;
@implementation SpeechRecognition
@synthesize callbackId;

-(void)startRecording:(CDVInvokedUrlCommand *)command
{
    self.callbackId = callbackId;
    self.speech = [[SpeechToTextModule alloc] initWithNoGUIAndLocale:kLANG_ENGLISH];
    [self.speech setDelegate:self];
    [self.speech beginRecording];
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK]; //messageAsString:recognizedText];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    
    
}

-(void)stopRecording:(CDVInvokedUrlCommand *)command
{
    self.callbackId=command.callbackId;
    [self.speech stopRecording:YES];
    
}

-(void)didRecognizeResponse:(NSString *)recognizedText
{
    
    output = recognizedText;
    NSLog(@"Recognized Text = %@ and Output = %@",recognizedText,output);
    
}

-(void)speechStartRecording
{
    NSLog(@"REC...");
}

-(void)showOutput:(CDVInvokedUrlCommand *)command {
    self.callbackId = command.callbackId;
    CDVPluginResult* pluginResult = nil;
    NSString* jString;
    NSLog(@"Output = %@",output);
    if (output != NULL) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:output];
        //jString = [pluginResult toSuccessCallbackString:callbackId];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error Description"];
        //jString = [pluginResult toErrorCallbackString:callbackId];
    }
    output = NULL;
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    //[self writeJavascript:jString];
}

-(void)speechStopRecording
{
    NSLog(@"STOP");
}

@end
