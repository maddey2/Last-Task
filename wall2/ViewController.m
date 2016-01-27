//
//  ViewController.m
//  wall2
//
//  Created by Sathish Chinniah on 28/12/15.
//  Copyright © 2015 Sathish Chinniah. All rights reserved.
//
//////
#import "ViewController.h"
#import "Global.h"

@interface ViewController ()
{
    
    NSDate *firstdate;
    
    Global *global;
    
    CGMutablePathRef circlePath;
}

@end

@implementation ViewController
//@synthesize flabel;
//@synthesize slabel;
//@synthesize tlabel;
//@synthesize folabel;
//@synthesize fivlabel;
//@synthesize sixlabel;
//@synthesize sevenlabel;
//@synthesize dateLabel;
////@synthesize walletView;
//@synthesize leftBtn;
//@synthesize rightBtn;
//@synthesize NumberLabel;



- (void)viewDidLoad {
    [super viewDidLoad];
    


    // Do any additional setup after loading the view, typically from a nib.
    //    firstdate = [NSDate date];
    //    firstdate = [NSDate dateWithTimeInterval:-(5*86400) sinceDate:firstdate];
    
    firstdate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:-6 toDate:[NSDate date] options:nil];
    //
    
    
    NSArray *jsonObject;
    jsonObject = @[@{@"Id1":@"mad",
                     @"people1":@"300"},
                   @{@"Id2":@"normal",
                     @"people2":@"9",@"total2":@6}];
    
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:nil];
    
    
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &err];
    
    
    global = [Global shareInstance];
    
    
    NSDictionary *dict = [jsonArray objectAtIndex:0];
    NSDictionary *dict2 = [jsonArray objectAtIndex:1];
    
    global.numDays = [NSNumber numberWithInteger:[[dict2 objectForKey:@"total2"] integerValue]];

    
    
    _lblLeftDays.text = [NSString stringWithFormat:@"%ld Days To Expire",[[dict2 objectForKey:@"total2"] integerValue]];
    
    
    // Distance between dots on circular path
    
            _arrowViewGreen.interval = 9.5;
            _arrowViewBlue.interval = 9.5;

    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    // Setting circle height and width here according to device size
    
    switch ((int)[UIScreen mainScreen].bounds.size.height) {
        case 480:
        {

            break;
        }
        case 568:
        {

            break;
        }
        case 667:
        {
            _widthConstraint.constant = 140;
            _heightConstraint.constant = 140;

            break;
        }
        case 736:
        {

            _widthConstraint.constant = 160;
            _heightConstraint.constant = 160;
            break;
        }
            
        default:
            break;
    }
    
    [self.view layoutIfNeeded];
}

//-(void)dateChange
//{
//    NSArray *labelArray = @[flabel, slabel, tlabel, folabel, fivlabel,sixlabel,sevenlabel];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    dateFormatter.dateFormat = @"ddMMM";
//    for (NSInteger i = 0; i < 7; ++i) {
//        NSDate *nextDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:i toDate:firstdate options:nil];
//        UILabel *label = (UILabel *)labelArray[i];
//        label.text = [dateFormatter stringFromDate:nextDate];
//        if (i==6) {
//            dateFormatter.dateFormat=@"MMM,yyyy";
//            dateLabel.text = [[dateFormatter stringFromDate:nextDate] capitalizedString];
//            
//            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//            [dateFormat setDateFormat:@"yyyy-MM-dd"];
//            
//            if ([[dateFormat stringFromDate:nextDate] isEqualToString:[dateFormat stringFromDate:[NSDate date]]])
//            {
//                rightBtn.enabled = false;
//                //It's the same day
//            }
//            else
//            {
//                rightBtn.enabled = true;
//            }
//        }
//    }
//}
//- (IBAction)calRight:(id)sender {
//    
//    
//    /////
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    firstdate = [calendar dateByAddingUnit:NSCalendarUnitDay value:7 toDate:firstdate options:nil];
//    [self dateChange];
//    //////
//    
//    
//}
//
//- (IBAction)calLeft:(id)sender {
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    firstdate = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:firstdate options:nil];
//    [self dateChange];
//    
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)createCircularPath
//{
//    circlePath = CGPathCreateMutable();
//    
//    CGPathMoveToPoint(circlePath, nil, _viewGreen.center.x, _viewGreen.center.y);
//    
//    CGPathAddEllipseInRect(circlePath, nil, CGRectMake(_viewGreen.bounds.origin.x+10, _viewGreen.bounds.origin.y+10, _viewGreen.bounds.size.width-20, _viewGreen.bounds.size.height-20));
//    
//    CAShapeLayer *cLayer = [CAShapeLayer layer];
//    
//    cLayer.path = circlePath;
//    
//    cLayer.strokeColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"dotb.png"]] CGColor];
//    
//    [_viewGreen.layer addSublayer:cLayer];
//    
////   UIImage *img =  [self maskImage:[UIImage imageNamed:@"dotb.png"] toPath:[UIBezierPath bezierPathWithCGPath:circlePath]];
////    
//    CGPathRelease(circlePath);
//    
//}
//
//
//- (UIImage *)maskImage:(UIImage *)originalImage toPath:(UIBezierPath *)path {
//    UIGraphicsBeginImageContextWithOptions(originalImage.size, NO, 0);
//    [path addClip];
//    [originalImage drawAtPoint:CGPointZero];
//    UIImage *maskedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return maskedImage;
//}

@end
