# EasyMailSender

Easy to send e-mail by `MFMailComposeViewController`.

You don't worry about `MFMailComposeViewControllerDelegate`,

## Installation

``` sh
pod 'EasyMailSender'
```

## Usage

1. Setup `MFMailComposeViewController`
2. Call `showFromViewController:`


``` objc
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
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT