

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DownLoadViewController : UIViewController
@property (nonatomic, strong)IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong)IBOutlet NSArray *objectsArray;
@property (nonatomic, strong)IBOutlet UIActivityIndicatorView *activity;



@end
