//
//  TestViewController.m
//  CenterTest
//

#import "TestViewController.h"

@implementation TestViewController

@synthesize button = _button;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.button setTitle:@"This can be any width Dynamic title contents" forState:UIControlStateNormal];
    [self.button sizeToFit];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
//    self.button.center = self.button.superview.center;
//    self.button.center = CGPointMake(self.button.superview.bounds.size.width/2, self.button.superview.bounds.size.height/2);
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.button.center = [self.button convertPoint:self.button.superview.center fromView:self.button.superview.superview];
}
- (void)viewDidAppear:(BOOL)animated
{
    CGRect workframe = CGRectZero;

    [super viewDidAppear:animated];
    self.button.center = CGPointMake(self.button.superview.bounds.size.width/2, self.button.superview.bounds.size.height/2);

    // Align on a pixel boundary to avoid fuzzy text
    workframe = self.button.frame;
    workframe.origin.x = floorf(self.button.frame.origin.x);
    workframe.origin.y = floorf(self.button.frame.origin.y);
    self.button.frame = workframe;
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
