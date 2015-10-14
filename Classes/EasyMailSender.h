//
// Created by azu on 2014/05/22.
//


#import <Foundation/Foundation.h>

@class MFMailComposeViewController;


@interface EasyMailSender : NSObject <MFMailComposeViewControllerDelegate>
typedef void(^EasyMailBuilder)(MFMailComposeViewController *controller);

typedef void(^EasyMailComplete)(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error);

+ (instancetype)easyMail:(EasyMailBuilder) builder complete:(EasyMailComplete) complete;

- (void)showFromViewController:(UIViewController *) viewController;
- (void)showFromViewController:(UIViewController *) viewController competion:(void(^)(void))completion;

@end