//
//  Login.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/27.
//

#import "Login.h"
#import "Portrait.h"    //个人界面
@interface Login ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordText;
@end

@implementation Login

NSString *userName = @"zhangsan";
NSString *userPassword = @"zhang";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clickLogin:(id)sender {
    NSString *name = self.userNameText.text;
    NSString *password = self.userPasswordText.text;
    
    //登陆逻辑
    if ([name isEqualToString:userName] && [password isEqualToString:userPassword]) {
        NSString *isLogin = @"YES";
        //存值
        [[NSUserDefaults standardUserDefaults] setValue:isLogin forKey:@"isLogin"];
        [[NSUserDefaults standardUserDefaults] setValue:userName forKey:@"userName"];
        //登录成功后跳转到用户界面
        [self.navigationController popViewControllerAnimated:YES];
        Portrait *vc = [[Portrait alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//- (BOOL)verifyPasswordWithUserName:(NSString *)name UserPassword:(NSString *)password {
//    if (name == userName && password == userPassword) {
//        return YES;
//    }
//    return NO;
//}



@end
