//
//  MYImagePickerController.h
//  Pods
//
//  Created by Vincil Bishop on 2/18/14.
//
//

#import <UIKit/UIKit.h>

typedef void (^MYImagePickerBlock)(id sender, BOOL didPickImage, NSError *error, NSDictionary *info, UIImage *originalImage);

@interface MYImagePickerController : UIImagePickerController<UIImagePickerControllerDelegate>

+ (void) presentPickerWithCompletion:(MYImagePickerBlock)completionBlock;

@end
 