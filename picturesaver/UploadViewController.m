

#import "UploadViewController.h"

@interface UploadViewController ()

@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)imagePickerPressed:(id)sender{
    _imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.delegate=self;
    _imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
//    [_imagePicker presentViewController:self.imagePicker animated:YES completion:nil];
    [self addChildViewController:_imagePicker];
    [self.view addSubview:_imagePicker.view];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
//    [picker dismissViewControllerAnimated:YES completion:nil];
    [_imagePicker.view removeFromSuperview];
    self.uploadImage.image = info[UIImagePickerControllerOriginalImage];
}
-(IBAction)uploadPressed:(id)sender{
    
    
    
    NSData *pictureData = UIImagePNGRepresentation(self.uploadImage.image);
    
    
    
    PFFile *image = [PFFile fileWithName:@"image" data:pictureData];
    [image saveInBackground];
    PFObject *imageObject = [PFObject objectWithClassName:@"ImageObject"];
    [imageObject setObject:image forKey:@"image"];
    [imageObject saveInBackground];
     }
     
*/

@end
