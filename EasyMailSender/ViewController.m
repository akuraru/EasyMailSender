//
//  ViewController.m
//  EasyMailSender
//
//  Created by azu on 2014/05/22.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "ViewController.h"
#import "EasyMailSender.h"
#import "EasyMailAlertSender.h"

@interface ViewController ()

- (IBAction)handleMailButton:(id) sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleMailButton:(id) sender {
    NSString *attachedText = @"text";
    EasyMailAlertSender *mailSender = [EasyMailAlertSender easyMail:^(MFMailComposeViewController *controller) {
        // Setup
        [controller addAttachmentData:[attachedText dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"plain/text" fileName:@"test.txt"];
    } complete:^(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error) {
        // When Sent/Cancel - MFMailComposeViewControllerDelegate action
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [mailSender showFromViewController:self];
}

- (IBAction)handleMailButtonWithCompletion:(id) sender {
    NSString *attachedText = @"text";
    EasyMailAlertSender *mailSender = [EasyMailAlertSender easyMail:^(MFMailComposeViewController *controller) {
        // Setup
        [controller addAttachmentData:[attachedText dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"plain/text" fileName:@"test.txt"];
    } complete:^(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error) {
        // When Sent/Cancel - MFMailComposeViewControllerDelegate action
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [mailSender showFromViewController:self competion:^{
        [[[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail View is presented" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}
@end