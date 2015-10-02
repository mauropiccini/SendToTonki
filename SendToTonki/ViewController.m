//
//  ViewController.m
//  testInvioImmagine
//
//  Created by Mauro Piccini on 30/06/15.
//  Copyright (c) 2015 tonki. All rights reserved.
//

#import "ViewController.h"

@import MobileCoreServices;

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)didPressSendMultiple {

    UIPasteboard *pst = [self tonkiPasteboard];
    UIImage *img1 = [UIImage imageNamed:@"A.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"B.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"G.png"];
    [pst addItems:@[
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img1, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img2, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img3, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img1, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img2, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img3, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img1, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img2, 1)},
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img3, 1)}
                    ]];
    NSLog(@"%@", pst.images);
    [self callTonki];
}

- (IBAction)didPressSendOne {
    UIPasteboard *pst = [self tonkiPasteboard];
    UIImage *img = [UIImage imageNamed:@"A.jpg"];
    [pst addItems:@[
                    @{(NSString *)kUTTypeJPEG:UIImageJPEGRepresentation(img, 1)}
                    ]];
    NSLog(@"%@", pst.images);
    [self callTonki];
}

- (UIPasteboard *)tonkiPasteboard {
    UIPasteboard *tPst = [UIPasteboard generalPasteboard];
    [tPst setValue:@"" forPasteboardType:(NSString *)kUTTypeUTF8PlainText];
    tPst.persistent = YES;
    return tPst;
}

- (void) callTonki {
    NSURL *canUrl = [NSURL URLWithString:@"tonki://"];
    NSURL *url = [NSURL URLWithString:@"tonki://create/clipboard"];
    if( [[UIApplication sharedApplication] canOpenURL:canUrl] ) {
        [[UIApplication sharedApplication] openURL:url];
        return;
    }
        
    NSURL *urlStore = [NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id964498250"];
    if( [[UIApplication sharedApplication] canOpenURL:urlStore] ) {
        [[UIApplication sharedApplication] openURL:urlStore];
        return;
    }

    NSURL *urlWeb = [NSURL URLWithString:@"https://geo.itunes.apple.com/it/app/tonki.com/id964498250?mt=8"];
    [[UIApplication sharedApplication] openURL:urlWeb];
}

@end
