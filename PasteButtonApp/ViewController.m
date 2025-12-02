//
//  ViewController.m
//  PasteButtonApp
//
//  Created by Book Develop on 2025/12/02.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


UITextView *mTextView;
UIPasteControl *mPasteControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setting self.view
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // setting text view
    CGRect textRect = self.view.frame;
    mTextView = [[UITextView alloc] initWithFrame:CGRectMake(textRect.origin.x, textRect.size.height/2, textRect.size.width, textRect.size.height/2)];
    [self.view addSubview:mTextView];
    mTextView.backgroundColor = [UIColor whiteColor];
    mTextView.tintColor = [UIColor darkGrayColor];

    // setting paste control
    UIPasteControlConfiguration *pConConfig = [[UIPasteControlConfiguration alloc] init];
    pConConfig.cornerRadius = 5;
    pConConfig.cornerStyle = UIButtonConfigurationCornerStyleDynamic;
    pConConfig.displayMode = UIPasteControlDisplayModeIconOnly;
    pConConfig.baseForegroundColor = [UIColor grayColor];
    pConConfig.baseBackgroundColor = [UIColor whiteColor];

    mPasteControl = [[UIPasteControl alloc] initWithConfiguration: pConConfig];
    mPasteControl.frame = CGRectMake(0, 0, 34, 34);
    mPasteControl.contentMode = UIViewContentModeRedraw;
    [mPasteControl setEnabled:TRUE];
    [mPasteControl setHidden:FALSE];
    mPasteControl.target = mTextView;
    
    // setting navigation bar, default setting is defined on AppDelegate.m
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"Navigation Bar Sample"];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:mPasteControl];
    [navItem setRightBarButtonItem:rightButton];
    
    if (@available(iOS 26, *)) {
        rightButton.hidesSharedBackground = true;
    }

    [_mNaviBar setItems:@[navItem]];

    //[_mNaviBar setNeedsDisplay]; // NG
    //[mPasteControl setNeedsDisplay]; // NG
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // resize text view
    CGRect textRect = self.view.frame;
    mTextView.frame = CGRectMake(textRect.origin.x, textRect.size.height/2, textRect.size.width, textRect.size.height/2);
}

@end
