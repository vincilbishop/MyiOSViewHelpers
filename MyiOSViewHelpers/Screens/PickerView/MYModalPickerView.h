//
//  MYModalPickerView.h
//  CustomPicker
//
//

#import <UIKit/UIKit.h>
#import "MYModalPickerBase.h"

@interface MYModalPickerView : MYModalPickerBase <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic, strong) id selectedValue;
@property (nonatomic, strong) NSString *selectedTitle;
@property (nonatomic, strong) NSArray *titles;

+ (MYModalPickerView*) pickerWithValues:(NSArray*)values
                                  titles:(NSArray*)titles
                                   block:(MYModalPickerViewCallback)callback;

/* Initializes a new instance of the picker with the values to present to the user.
 (Note: call presentInView:withBlock: or presentInWindowWithBlock: to display the control)
 */
- (id)initWithTitles:(NSArray *)values;

@end
