//
//  InputTextController.m
//  Wordle
//
//  Created by Quan, Xiaosha on 4/17/13.
//  Copyright (c) 2013 Quan Xiaosha. All rights reserved.
//

#import "InputTextController.h"
#import "InputTextView.h"

#import "RenderingController.h"

@interface InputTextController () <InputTextViewDelegate>

@end


@implementation InputTextController


- (void) loadView
{
    self.view = [[[InputTextView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
    
    [(InputTextView*)[self view] setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.view setNeedsLayout];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.view setNeedsLayout];
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma UITextViewDelegate

- (void) endInputWithString:(NSString *)string
{
    RenderingController* lpRenderingController = [[[RenderingController alloc] init] autorelease];
    [lpRenderingController renderingWithInputText:string];
    
    [self.navigationController pushViewController:lpRenderingController animated:YES];
}

@end