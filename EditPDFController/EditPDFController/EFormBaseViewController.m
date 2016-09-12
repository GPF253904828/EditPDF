//
//  EFormBaseViewController.m
//  AIA
//
//  Created by aiait on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EFormBaseViewController.h"
@implementation EFormBaseViewController
static EFormBaseViewController *instance;

+(EFormBaseViewController *)sharedInstance
{
    return instance;
}

#pragma mark - For Date check and Format
//- (void)formatDateWithDay:(UITextField *)day andMonth:(UITextField *)months
//andYear:(UITextField *)year{
//    NSString* dateString = [day.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSString* monthString = [months.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSString* yearString = [year.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    
//    if ([yearString length] > 0) {
//        year.text = [[yearString componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
//        NSInteger minYear = 0;
//        NSInteger maxYear = 9999;
//        if ([year.text intValue] < minYear) {
//            year.text = [NSString stringWithFormat:@"%ld", (long)minYear];
//        }
//        if ([year.text intValue] > maxYear) {
//            year.text = [NSString stringWithFormat:@"%ld", (long)maxYear];
//        }
//    }
//    
//    if (([dateString length] > 0) && ([monthString length] > 0) && ([yearString length] > 0)) {
//        NSString* birthdateString = [NSString stringWithFormat:@"%@/%@/%@", dateString, monthString, yearString];
//        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
//        NSDate* date = [dateFormatter dateFromString:birthdateString];
//        if (date == nil) {
//            day.text = [NSString stringWithFormat:@"%d",  1] ;
//            months.text = [NSString stringWithFormat:@"%d",  1];
//            year.text = [NSString stringWithFormat:@"%d", 1];
//        }
//        
//    }
//    else {
//        if ([months.text length] > 0) {
//            months.text = [[months.text componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
//            NSInteger minMonth = 1;
//            NSInteger maxMonth = 12;
//            if ([months.text intValue] < minMonth) {
//                months.text = [NSString stringWithFormat:@"%ld", (long)minMonth];
//            }
//            if ([months.text intValue] > maxMonth) {
//                months.text = [NSString stringWithFormat:@"%ld", (long)maxMonth];
//            }
//        }
//        
//        if ([day.text length] > 0) {
//            day.text = [[day.text componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
//            NSInteger minDate = 1;
//            NSInteger maxDate = 30;
//            if ([months.text length] > 0) {
//                int month = [months.text intValue];
//                switch (month) {
//                    case 1: // Jan
//                    case 3: // Mar
//                    case 5: // May
//                    case 7: // Jul
//                    case 8: // Aug
//                    case 10: // Oct
//                    case 12: // Dec
//                        maxDate = 31;
//                        break;
//                    case 2: //Feb
//                        maxDate = 29;
//                        break;
//                    case 4: // Apr
//                    case 6: // Jun
//                    case 9: // Sep
//                    case 11: // Nov
//                        maxDate = 30;
//                        break;                
//                    default:
//                        break;
//                }
//            }
//            
//            if ([day.text intValue] < minDate) {
//                day.text = [NSString stringWithFormat:@"%ld", (long)minDate];
//            }
//            if ([day.text intValue] > maxDate) {
//                day.text = [NSString stringWithFormat:@"%ld", (long)maxDate];
//            }
//        }
//    }
//    
//    
//}

//+(NSDate *)getDateWith:(NSString *)day andMonth:(NSString *)month andYear:(NSString *)year
//{
//    NSString* dateString = [NSString stringWithFormat:@"%@-%@-%@",
//                            month,
//                            day,
//                            year];
//    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
//    NSDate *date =  [dateFormatter dateFromString:dateString];
//    return  date;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    instance = self;
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    instance = self;
}

#pragma mark - UIViewControllerRotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
