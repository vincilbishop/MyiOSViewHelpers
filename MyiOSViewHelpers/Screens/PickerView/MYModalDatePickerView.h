//
//  MYModalDatePickerView.h
//  CustomPicker
//
//

#import "MYModalPickerBase.h"

@interface MYModalDatePickerView : MYModalPickerBase

@property (nonatomic, strong) NSDate *selectedDate;
@property (nonatomic) UIDatePickerMode mode;
@property (nonatomic) BOOL showTodayButton;
@property (nonatomic) UIDatePicker *datePicker;

+ (MYModalDatePickerView*) pickerWithDate:(NSDate*)date block:(MYModalDatePickerViewCallback)callback;
+ (MYModalDatePickerView*) pickerWithDateAndTime:(NSDate*)date block:(MYModalDatePickerViewCallback)callback;
+ (MYModalDatePickerView*) pickerWithTime:(NSDate*)date block:(MYModalDatePickerViewCallback)callback;

/* Initializes a new instance of the date picker with the values to present to the user.
 (Note: call presentInView:withBlock: or presentInWindowWithBlock: to display the control)
 */
- (id)initWithDate:(NSDate *)date;

- (id)initWithDate:(NSDate *)date pickerMode:(UIDatePickerMode)mode;


@end
