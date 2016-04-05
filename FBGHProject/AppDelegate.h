//
//  AppDelegate.h
//  FBGHProject
//
//  Created by Anatoliy on 4/2/16.
//  Copyright © 2016 mobex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import <Google/SignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

