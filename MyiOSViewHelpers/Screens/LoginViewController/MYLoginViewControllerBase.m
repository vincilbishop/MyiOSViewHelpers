//
//  MYLoginViewControllerBase.m
//  Pods
//
//  Created by Vincil Bishop on 3/9/14.
//
//

#import "MYLoginViewControllerBase.h"
#import "MBProgressHUD.h"

@interface MYLoginViewControllerBase ()

@end

@implementation MYLoginViewControllerBase

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - IBAction -

- (IBAction)loginPressed:(id)sender {
    
    if (self.loginBlock) {
        self.loginBlock(self.usernameTextField.text, self.passwordTextField.text);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
