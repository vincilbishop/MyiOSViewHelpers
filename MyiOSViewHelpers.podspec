Pod::Spec.new do |spec|
    
	spec.name		= 'MyiOSViewHelpers'
	spec.version	= '1.0.1'
	spec.homepage   = "http://github.com/premosystems/MyiOSViewHelpers"
	spec.author     = { "Vincil Bishop" => "vincil.bishop@vbishop.com" }
	spec.license	= 'MIT'
	spec.summary	= 'A collection of often used but time consuming to recreate view logic for iOS.'
	spec.source	= { :git => 'https://github.com/premosystems/MyiOSViewHelpers.git', :tag => spec.version.to_s }
	spec.requires_arc = true
    
	spec.ios.deployment_target = '7.0'
    
	spec.resource = 'MyiOSViewHelpers.podspec'
    
    spec.prefix_header_contents = '#import "UIStoryboard+KPAConvenience.h"', '#import "UIAlertView+Blocks.h"', '#import "EDColor.h"'
    spec.ios.dependency 'KPAStoryboardConvenience', '~>1.0.1'
    spec.ios.dependency 'UIAlertView+Blocks', '~>0.8'
    spec.ios.dependency 'EDColor', '~>0.4.0'
    
    myiOSHelpers_version = '~>1.0.0'
    
	spec.source_files = 'MyiOSViewHelpers/*.{h,m}'
	
		spec.subspec "Categories" do |view_categories|
			view_categories.source_files = 'MyiOSViewHelpers/Categories/*.{h,m}'
            
            categoriesArray = ["UIView"]
            
            for category in categoriesArray
                view_categories.subspec category do |cat|
                    cat.source_files = "MyiOSViewHelpers/Categories/#{category}/*.{h,m}"
                end
            end
            
            view_categories.subspec "UIImage" do |uiimage|
                uiimage.source_files = "MyiOSViewHelpers/Categories/UIImage/*.{h,m}"
                uiimage.resource = 'MyiOSViewHelpers/Categories/UIImage/*.png'
            end
            
            view_categories.subspec "UIImageView" do |uiimageview|
                uiimageview.source_files = "MyiOSViewHelpers/Categories/UIImageView/*.{h,m}"
                uiimageview.ios.dependency 'MyiOSViewHelpers/Categories/UIImage', spec.version.to_s
            end
		end
		
		spec.subspec "Screens" do |screens|
			screens.source_files = 'MyiOSViewHelpers/Screens/*.{h,m}'
            
			screens.subspec "Drawers" do |drawers|
				drawers.prefix_header_contents = 	'#import "MMDrawerController.h"',
                '#import "MMDrawerBarButtonItem.h"',
                '#import "UIViewController+MMDrawerController.h"',
                '#import "UIStoryboard+KPAConvenience.h"'
				drawers.source_files = 'MyiOSViewHelpers/Screens/Drawers/*.{h,m}'
				drawers.ios.dependency 'MMDrawerController', '~> 0.5.2'
                drawers.ios.dependency 'KPAStoryboardConvenience', '~>1.0.1'
			end
            
            screens.subspec "ImagePicker" do |imagePicker|
				imagePicker.source_files = 'MyiOSViewHelpers/Screens/ImagePicker/*.{h,m}'
                imagePicker.ios.dependency 'UIActionSheet+Blocks'
                imagePicker.ios.dependency 'MyiOSHelpers/Logic/Categories', myiOSHelpers_version
			end
			
			screens.subspec "FormViewController" do |form|
                form.prefix_header_contents = '#import "MyiOSLogicCategories.h"', '#import "MyiOSLogicBlocks.h"', '#import "UIAlertView+Blocks.h"', '#import "Underscore.h"', '#ifndef _', '#define _ Underscore', '#endif'
				form.source_files = 'MyiOSViewHelpers/Screens/FormViewController/*.{h,m}'
				form.ios.dependency 'UIAlertView+Blocks', '~>0.8'
                form.ios.dependency 'TPKeyboardAvoiding', '~>1.2.3'
				form.ios.dependency 'US2FormValidator', '~> 1.1.2'
                form.ios.dependency 'ALPValidator', '~> 0.0.3'
                form.ios.dependency 'CWStatusBarNotification', '~> 2.1.1'
                form.ios.dependency 'APLKeyboardControls', '~>0.1.2'
                form.ios.dependency 'ASCFlatUIColor', '~>0.1.0'
				form.ios.dependency 'MyiOSHelpers/Logic/Blocks', myiOSHelpers_version
                form.ios.dependency 'MyiOSHelpers/Logic/Categories', myiOSHelpers_version
				form.ios.dependency 'MyiOSViewHelpers/Categories', spec.version.to_s
                form.ios.dependency 'Underscore.m', '~>0.2.1'
			end
			
			screens.subspec "LoginViewController" do |login|
				login.source_files = 'MyiOSViewHelpers/Screens/LoginViewController/*.{h,m}'
				login.ios.dependency 'MyiOSViewHelpers/Screens/FormViewController', spec.version.to_s
				login.ios.dependency 'MBProgressHUD', '~>0.8'
            end
            
            screens.subspec "PickerView" do |pickerView|
				pickerView.source_files = 'MyiOSViewHelpers/Screens/PickerView/*.{h,m}'
				pickerView.ios.dependency 'MyiOSViewHelpers/Screens/PickerView', spec.version.to_s
                pickerView.ios.dependency 'MyiOSHelpers/Logic/Blocks', myiOSHelpers_version
				pickerView.ios.dependency 'RMDateSelectionViewController', '~>1.2.1'
            end

            screens.subspec "TableViewControllerBase" do |table|
				table.source_files = 'MyiOSViewHelpers/Screens/TableViewControllerBase/*.{h,m}'
                table.ios.dependency 'DZNEmptyDataSet', '~>1.3.1'
            end
            
            screens.subspec "ModelObjectTableViewControllerBase" do |modeltable|
                modeltable.source_files = 'MyiOSViewHelpers/Screens/ModelObjectTableViewControllerBase/*.{h,m}'
            	modeltable.ios.dependency 'MyiOSHelpers/Logic/ThirdPartyHelpers/KeyValueObjectMapping'
                modeltable.ios.dependency 'MyiOSViewHelpers/Screens/FormViewController', spec.version.to_s
                modeltable.ios.dependency 'MyiOSViewHelpers/Screens/TableViewControllerBase', spec.version.to_s
            end
            
            screens.subspec "ModelObjectCollectionViewControllerBase" do |modelcollection|
                modelcollection.source_files = 'MyiOSViewHelpers/Screens/ModelObjectCollectionViewControllerBase/*.{h,m}'
            	modelcollection.ios.dependency 'MyiOSHelpers/Logic/ThirdPartyHelpers/KeyValueObjectMapping'
                modelcollection.ios.dependency 'MyiOSViewHelpers/Screens/FormViewController', spec.version.to_s
                modelcollection.ios.dependency 'MyiOSViewHelpers/Screens/TableViewControllerBase', spec.version.to_s
            end
            
		end
        
        spec.subspec "ThirdPartyHelpers" do |third_party|
			third_party.source_files = 'MyiOSViewHelpers/ThirdPartyHelpers/*.h'
            
            third_party.subspec "MBProgressHUD" do |hud|
                hud.source_files = 'MyiOSViewHelpers/ThirdPartyHelpers/MBProgressHUD/*.{h,m}'
                hud.ios.dependency 'MBProgressHUD', '~>0.8'
            end
        end
        
end