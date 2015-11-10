

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface UploadViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic, strong)IBOutlet UIImageView *uploadImage;
@property(nonatomic, strong)UIImagePickerController *imagePicker;




@end
