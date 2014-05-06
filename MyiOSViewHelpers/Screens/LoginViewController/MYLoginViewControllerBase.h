//
//  MYLoginViewControllerBase.h
//  Pods
//
//  Created by Vincil Bishop on 3/9/14.
//
//

#import "MYFormViewControllerBase.h"
#import "MyiOSLogicBlocks.h"

typedef void (^MYLoginBlock)(NSString *username, NSString *password);

@interface MYLoginViewControllerBase : MYFormViewControllerBase

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (copy, nonatomic) MYLoginBlock loginBlock;

- (IBAction)loginPressed:(id)sender;

@end
