//
//  ViewController.m
//  DiceGame
//
//  Created by Jeff Chen on 2016/5/11.
//  Copyright © 2016年 Jeff Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for(UIImageView * imageView in self.dices){
        imageView.animationImages = @[[UIImage imageNamed:@"1.png"], [UIImage imageNamed:@"2.png"], [UIImage imageNamed:@"3.png"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"5.png"], [UIImage imageNamed:@"6.png"]];
        imageView.animationDuration = 0.3f;
    }
}

//1.
-(BOOL) canBecomeFirstResponder {
    return YES;
}

//2.
-(void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

-(void) viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
}

//3.
-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake){
        for(UIImageView *imageView in self.dices){
            [imageView startAnimating];
        }
    }
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake){
        for(UIImageView *imageView in self.dices){
            [imageView stopAnimating];
            [UIView transitionWithView:imageView duration:0.3f options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve animations:^{
                NSString *image = [NSString stringWithFormat:@"%d", arc4random()%6+1];
                imageView.image = [UIImage imageNamed:image];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
