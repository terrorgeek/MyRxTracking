//
//  Constants.m
//  MyRxTracking
//
//  Created by Yu Song on 8/27/15.
//  Copyright (c) 2015 EagleForce. All rights reserved.
//

#import "Constants.h"

@implementation Constants
NSString *SERVER_URL = @"http://10.0.80.66:3000/my_rx_tracking/";
//NSString *SERVER_URL = @"http://127.0.0.1:3000/my_rx_tracking/";

NSString *BASE_URL = @"http://10.0.80.66:3000";
//NSString *BASE_URL = @"http://127.0.0.1:3000";

NSUserDefaults *userDefaults;

NSString *DRUG_PHOTO_URL=@"http://10.0.80.66:3000/my_rx_tracking/medications/upload_drug_photo";
//NSString * DRUG_PHOTO_URL=@"http://127.0.0.1:3000/my_rx_tracking/medications/upload_drug_photo";

NSString *AVATAR_URL=@"http://10.0.80.66:3000/my_rx_tracking/profiles/upload_avatar";
//NSString * AVATAR_URL=@"http://127.0.0.1:3000/my_rx_tracking/profiles/upload_avatar";

int const THEME_COLOR_RED = 39;
int const THEME_COLOR_GREEN = 82;
int const THEME_COLOR_BLUE = 214;
@end
