//
//  LaunchViewController.m
//  FBGHProject
//
//  Created by Anatoliy on 4/3/16.
//  Copyright © 2016 mobex. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO(developer) Configure the sign-in button look/feel
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    [[GIDSignIn sharedInstance] signInSilently];
    
    // [START_EXCLUDE silent]
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(receiveToggleAuthUINotification:)
     name:@"ToggleAuthUINotification"
     object:nil];
    
    [self toggleAuthUI];
    [self statusText].text = @"Google Sign in\niOS Demo";
    // [END_EXCLUDE]

}

- (void)toggleAuthUI {
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
        // Not signed in
        [self statusText].text = @"Google Sign in\niOS Demo";
        self.signInButtonGoogle.hidden = NO;
        self.signOutButton.hidden = YES;
        self.disconnectButton.hidden = YES;
    } else {
        // Signed in
        self.signInButtonGoogle.hidden = YES;
        self.signOutButton.hidden = NO;
        self.disconnectButton.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapDisconnect:(id)sender {
    [[GIDSignIn sharedInstance] disconnect];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    NSLog(@"Customer details: %@ %@ %@ %@", userId, idToken, name, email);
    // ...
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:@"ToggleAuthUINotification"
     object:nil];
}

- (void)receiveToggleAuthUINotification:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"ToggleAuthUINotification"]) {
        [self toggleAuthUI];
        self.statusText.text = [notification userInfo][@"statusText"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
