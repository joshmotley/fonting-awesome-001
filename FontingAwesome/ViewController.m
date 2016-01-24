//
//  ViewController.m
//  FontingAwesome
//
//  Created by Joshua Motley on 9/3/15.
//  Copyright (c) 2015 Motley. All rights reserved.
//

#import "ViewController.h"
#import "FontAwesomeKit/FontAwesomeKit.h"
#import "CWStatusBarNotification.h"

@interface ViewController () <UIGestureRecognizerDelegate>


@property (strong,nonatomic) CWStatusBarNotification *notification;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view, typically from a nib.
    FAKZocial *twitterIcon = [FAKZocial twitterIconWithSize:40];
    NSAttributedString *starAtt = [twitterIcon attributedString];

    [self.buttonOne setAttributedTitle:starAtt forState:UIControlStateNormal];
    
    [self.buttonOne addTarget:self action:@selector(changeFontAwesomeIcon:)
     forControlEvents:UIControlEventTouchDown];
    
    // This does not fire at all
    [self.buttonOne addTarget:self action:@selector(holdRelease)
     forControlEvents:UIControlEventTouchUpInside];
}


- (IBAction)changeFontAwesomeIcon:(id)sender {
        FAKFontAwesome *starIcon = [FAKFontAwesome starIconWithSize:40];
        NSAttributedString *starAtt = [starIcon attributedString];
        
        [self.buttonOne setAttributedTitle:starAtt forState:UIControlStateNormal];


    
    self.notification = [CWStatusBarNotification new];
    [self.notification displayNotificationWithMessage:@"Icon is being held" completion:nil];
    

}

-(void)holdRelease{
    FAKZocial *twitterIcon = [FAKZocial twitterIconWithSize:40];
    NSAttributedString *starAtt = [twitterIcon attributedString];
    
    [self.buttonOne setAttributedTitle:starAtt forState:UIControlStateNormal];
    
    [self.notification dismissNotification];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
