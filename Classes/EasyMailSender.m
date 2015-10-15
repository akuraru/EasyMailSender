//
// Created by azu on 2014/05/22.
//


#import <MessageUI/MessageUI.h>
#import "EasyMailSender.h"


@interface EasyMailSender ()
@property(nonatomic, copy) EasyMailComplete completeAction;
@property(nonatomic, strong) id keepInMemory;
@property(nonatomic, strong) MFMailComposeViewController *mailComposeViewController;
@end

@implementation EasyMailSender {

}

- (void)mailComposeController:(MFMailComposeViewController *) controller didFinishWithResult:(MFMailComposeResult) result error:(NSError *) error {
    self.completeAction(controller, result, error);
    self.keepInMemory = nil;
}


- (instancetype)initWithBuilder:(EasyMailBuilder) builder complete:(EasyMailComplete) complete {
    self = [super init];
    MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
    self.completeAction = complete;
    self.mailComposeViewController = mailComposeViewController;
    mailComposeViewController.mailComposeDelegate = self;
    builder(mailComposeViewController);
    return self;
}

+ (instancetype)easyMail:(EasyMailBuilder) builder complete:(EasyMailComplete) complete {
    return [[self alloc] initWithBuilder:builder complete:complete];
}

- (void)showFromViewController:(UIViewController *) viewController {
    if ([MFMailComposeViewController canSendMail]) {
        [viewController presentViewController:self.mailComposeViewController animated:YES completion:nil];
        [self setKeepInMemory:self];
    }
}

- (void)showFromViewController:(UIViewController *) viewController competion:(void(^)(void))completion {
    if ([MFMailComposeViewController canSendMail]) {
        [viewController presentViewController:self.mailComposeViewController animated:YES completion:completion];
        [self setKeepInMemory:self];
    }
}

@end