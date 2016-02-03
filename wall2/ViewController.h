//
//  ViewController.h
//  wall2
//
//  Created by Sathish Chinniah on 28/12/15.
//  Copyright © 2015 Sathish Chinniah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"
#import "UUChart.h"

@interface ViewController : UIViewController<UUChartDataSource,UIGestureRecognizerDelegate>
{
    UUChart *viewChart;
}

@property(weak,nonatomic) IBOutlet UIView *viewGreen;

@property(weak,nonatomic) IBOutlet UIView *viewBlue;

@property(weak,nonatomic) IBOutlet UILabel *lblLeftDays;

@property(weak,nonatomic) IBOutlet UILabel *lblUsage;

@property(weak,nonatomic) IBOutlet UIView *viewGraph;

@property(weak,nonatomic) IBOutlet UILabel *lblCost1,*lblCost2;

@property(weak,nonatomic) IBOutlet UILabel *lblSubCost1,*lblSubCost2;

@property(weak,nonatomic) IBOutlet CircleView *arrowViewGreen;

@property(weak,nonatomic) IBOutlet CircleView *arrowViewBlue;

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *ImgYConstraint1;

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *ImgYConstraint2;

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *lblXConstraint;

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *lblWidthConstraint;

@property(weak,nonatomic) IBOutlet UIButton *rightBtn;

@property(weak,nonatomic) IBOutlet UIButton *leftBtn;

@property(weak,nonatomic) IBOutlet UILabel *dateLabel;

@property(weak,nonatomic) IBOutlet UILabel *lblFlext,*lblEconomy;

@property(weak,nonatomic) IBOutlet UILabel *label1,*label2,*label3,*label4,*label5,*label6,*label7;

@end

