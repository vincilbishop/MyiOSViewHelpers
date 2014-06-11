//
//  MYModalPickerView.m
//  CustomPicker
//
//

#import "MYModalPickerView.h"

@interface MYModalPickerView ()

@property (nonatomic) NSUInteger indexSelectedBeforeDismissal;

@end

@implementation MYModalPickerView

#pragma mark - Static Convenience Methods -

+ (MYModalPickerView*) pickerWithValues:(NSArray*)values
                                  titles:(NSArray*)titles
                                   block:(MYModalPickerViewCallback)callback
{
    MYModalPickerView *picker = [[MYModalPickerView alloc] initWithTitles:titles];
    picker.values = values;
    picker.picker.backgroundColor =[UIColor whiteColor];
    picker.callbackBlock = callback;
    [picker presentInWindow];
    
    return picker;
}

#pragma mark - Designated Initializer

- (id)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        self.titles = titles;
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark - Custom Getters

- (UIView *)pickerWithFrame:(CGRect)pickerFrame {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    [pickerView selectRow:self.selectedIndex inComponent:0 animated:NO];
    return pickerView;
}

- (NSString *)selectedTitle {
    
    if (self.titles && self.titles.count > 0) {
        return [self.titles objectAtIndex:self.selectedIndex];
    } else {
        return nil;
    }
}

- (id)selectedValue {
    
    if (self.values && self.values.count > self.selectedIndex) {
        
        return [self.values objectAtIndex:self.selectedIndex];
    }
    else
    {
        return nil;
    }
}

#pragma mark - Custom Setters

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    if (_titles) {
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView reloadAllComponents];
            self.selectedIndex = 0;
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView selectRow:selectedIndex inComponent:0 animated:YES];
        }
    }
}

- (void)setSelectedValue:(NSString *)selectedValue {
    NSInteger index = [self.titles indexOfObject:selectedValue];
    [self setSelectedIndex:index];
}

#pragma mark - Event Handler

- (void)onDone:(id)sender {
    self.selectedIndex = self.indexSelectedBeforeDismissal;
    [super onDone:sender];
}

#pragma mark - Picker View Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.titles.count;
}

#pragma mark - Picker View Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.titles objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.indexSelectedBeforeDismissal = row;
}

@end
