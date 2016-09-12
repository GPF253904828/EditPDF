#import "EFormUIImageView.h"
#import "EFormBaseViewController.h"
//#import "UIViewComponent.h"
@implementation EFormUIImageView
@synthesize isInputUI = _isInputUI;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{

    EFormBaseViewController *instance = [EFormBaseViewController sharedInstance];
    if (instance == nil) {
        return;
    }
}


//}
@end
