//
//  LaunchViewController.h
//  FBGHProject
//
//  Created by Anatoliy on 4/3/16.
//  Copyright © 2016 mobex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface LaunchViewController : UIViewController <GIDSignInDelegate>

@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButtonGoogle;
@property (weak, nonatomic) IBOutlet UIButton *signOutButton;
@property (weak, nonatomic) IBOutlet UIButton *disconnectButton;
@property (weak, nonatomic) IBOutlet UILabel *statusText;

@end
