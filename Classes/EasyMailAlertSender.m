//
// Created by azu on 2014/05/22.
//


#import <MessageUI/MessageUI.h>
#import "EasyMailAlertSender.h"


@implementation EasyMailAlertSender {

}

- (void)alertWithTitle:(NSString *) title message:(NSString *) message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    });
}

- (void)mailComposeController:(MFMailComposeViewController *) controller didFinishWithResult:(MFMailComposeResult) result error:(NSError *) error {
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    NSString *bundlePath = [classBundle pathForResource:@"EasyMailSender" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath] ?: [NSBundle mainBundle];
    switch (result) {
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent: {
            [self alertWithTitle:nil message:[bundle localizedStringForKey:@"EasyMailSender_Sent" value:@"Mail Sent" table:@"EasyMailSenderLocalizable"]];
            break;
        }
        case MFMailComposeResultFailed: {
            [self alertWithTitle:nil message:[bundle localizedStringForKey:@"EasyMailSender_Failed" value:@"Mail sending failed" table:@"EasyMailSenderLocalizable"]];
            break;
        }
    }
    [super mailComposeController:controller didFinishWithResult:result error:error];
}

@end