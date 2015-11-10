

#import "DownLoadViewController.h"

@interface DownLoadViewController ()

@end

@implementation DownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getImages];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];;
    
}

-(void)getImages{
    PFQuery *imageGetter = [PFQuery queryWithClassName:@"ImageObject"];
    [imageGetter orderByDescending:@"createdAt"];
    [imageGetter findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error) {
            self.objectsArray = objects;
            [self loadObjectViews];
        }
        else{
            [[[UIAlertView alloc] initWithTitle:@"Failure" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"Goddamnit" otherButtonTitles:nil] show];
        }
    }];
}
-(void)loadObjectViews{
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isMemberOfClass:[UIView class]])[obj removeFromSuperview];
    }];
    
    __block int originY = 5;
    [self.objectsArray enumerateObjectsUsingBlock:^(PFObject *imageObject, NSUInteger idx, BOOL *stop) {
        UIView *cell = [[UIView alloc]initWithFrame:CGRectMake(10.0f, originY, self.view.frame.size.width-20.0f, 300.0f)];
        PFFile* image =(PFFile *)imageObject[@"image"];
        UIImage* trueImage = [UIImage imageWithData:[image getData]];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:trueImage];
        imageView.frame =  CGRectMake(0.0, 0.0, cell.frame.size.width, 200.0f);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [cell addSubview:imageView];
        
        [self.scrollView addSubview:cell];
        [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height+originY)];
        originY += (cell.frame.size.height+5.0f);
    }];
}

@end
