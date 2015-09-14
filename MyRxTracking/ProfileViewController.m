//
//  ProfileViewController.m
//  MyRxTracking
//
//  Created by Yu Song on 8/24/15.
//  Copyright (c) 2015 EagleForce. All rights reserved.
//

#import "ProfileViewController.h"
#import "Manifest.h"


@interface ProfileViewController()

@end

@implementation ProfileViewController
@synthesize contact_info;
@synthesize insurance_info;

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"My Profile";
    [self setUpStyle];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [[AFNetwork getAFManager] GET:[SERVER_URL stringByAppendingString:@"profiles"] parameters:@{@"patient_id": [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *all_info = (NSMutableDictionary *)responseObject;
        [self loadContactInfo: all_info];
        [self loadInsuranceInfo:all_info];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *responseObject) {
        
    }];
}

-(void)loadContactInfo: (NSMutableDictionary *)all_info{
    contact_info = all_info[@"contact_info"];
    self.full_name.text = [NSString stringWithFormat:@"%@ %@", contact_info[@"fname"], contact_info[@"lname"]];
    self.city.text = [NSString stringWithFormat:@"city: %@", contact_info[@"city"]];
    self.state.text = [NSString stringWithFormat:@"state: %@", contact_info[@"state"]];
    self.country.text = [NSString stringWithFormat:@"country: %@", contact_info[@"country"]];
    self.county.text = [NSString stringWithFormat:@"county: %@", contact_info[@"county"]];
    self.zipcode.text = [NSString stringWithFormat:@"zipcode: %@", contact_info[@"zipcode"]];
    self.phone.text = [NSString stringWithFormat:@"phone: %@", contact_info[@"cell_phone_number"]];
    self.email.text = [NSString stringWithFormat:@"email: %@", contact_info[@"email_address"]];
    self.address.text = [NSString stringWithFormat:@"address: %@", contact_info[@"home_address1"]];
    if ([contact_info[@"avatar"] isEqual: [NSNull null]]) {
        if ([[contact_info[@"gender"] uppercaseString] isEqualToString:@"F"])
            self.avatar.image = [UIImage imageNamed: @"female_default_avatar.png"];
        else self.avatar.image = [UIImage imageNamed:@"male_default_avatar.png"];
    }
    else{}
}

-(void)loadInsuranceInfo: (NSMutableDictionary *)all_info{
    insurance_info = all_info[@"insurance_info"];
}

-(void)setUpStyle{
    self.avatar.layer.borderWidth = 3.0f;
    self.avatar.layer.cornerRadius = 10.0f;
    self.avatar.clipsToBounds = YES;
    
    //scrollView
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(375, 800);
}
- (IBAction)edit_profile_action:(id)sender {
    self.edit_profile_view = [self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
    //assign the info to edit view controller
    
    NSArray *full_name = [self.full_name.text componentsSeparatedByString:@" "];
    
    self.edit_profile_view.user_info = @{@"first_name": full_name[0], @"last_name": full_name[1], @"country": self.country.text, @"county": self.county.text, @"cell_phone": self.phone.text, @"address": self.address.text, @"state": self.state.text, @"city": self.city.text, @"zipcode": self.zipcode.text, @"email": self.email.text};
    [self.navigationController pushViewController:self.edit_profile_view animated:YES];
}
@end
