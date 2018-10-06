//
//  LoginViewController.m
//  团购
//
//  Created by Jones on 10/31/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "LoginViewController.h"
#import "Util.h"
@interface LoginViewController (){
    UITextField *tf_userName;
    UITextField *tf_password;
    
    UIView *loginView2;
    BOOL login2hidden;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1 UIlabel
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    UILabel *lb_title = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 20, 100, 60)];
    lb_title.text = @"登陆";
    lb_title.textAlignment = NSTextAlignmentCenter;
    lb_title.textColor = [UIColor blackColor];
    lb_title.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:lb_title];
    
    // 2 用户名 密码
    tf_userName = [[UITextField alloc]initWithFrame:CGRectMake(0, lb_title.frame.size.height+20, SCREEN_WIDTH, 50)];
    tf_userName.placeholder = @" 用户名｜邮箱｜账号";
    tf_userName.backgroundColor = [UIColor whiteColor];
    tf_userName.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:tf_userName];
    
    tf_password = [[UITextField alloc]initWithFrame:CGRectMake(0, lb_title.frame.size.height+72, SCREEN_WIDTH, 50)];
    tf_password.placeholder = @" 密码";
    tf_password.backgroundColor = [UIColor whiteColor];
    tf_password.borderStyle = UITextBorderStyleNone;
    tf_password.secureTextEntry = true;
    [self.view addSubview:tf_password];
    
    // 3 登陆
    UIButton *bt_login = [[UIButton alloc]initWithFrame:CGRectMake(20, tf_password.frame.origin.y+tf_password.frame.size.height+20, SCREEN_WIDTH-40, 60)];
    [bt_login addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    bt_login.backgroundColor = [UIColor colorWithRed:50/255.0 green:189/255.0 blue:170/255.0 alpha:1.0];
    [bt_login setTitle:@"登陆" forState:UIControlStateNormal];
    [bt_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bt_login.layer.cornerRadius = 2.0;
    [self.view addSubview:bt_login];
    // 4 2 label
    UILabel *lb_forgetKey = [[UILabel alloc]initWithFrame:CGRectMake(20, bt_login.frame.origin.y+bt_login.frame.size.height+10, 50, 20)];
    lb_forgetKey.text = @"忘记密码";
    lb_forgetKey.textAlignment = NSTextAlignmentLeft;
    lb_forgetKey.textColor = [UIColor colorWithRed:50/255.0 green:189/255.0 blue:170/255.0 alpha:1.0];
    lb_forgetKey.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:lb_forgetKey];
    
    UILabel *lb_register = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, bt_login.frame.origin.y+bt_login.frame.size.height+10, 50, 20)];
    lb_register.text = @"立即注册";
    lb_register.textAlignment = NSTextAlignmentCenter;
    lb_register.textColor = [UIColor colorWithRed:50/255.0 green:189/255.0 blue:170/255.0 alpha:1.0];
    lb_register.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:lb_register];
    // 5 换种登陆方式 100=40 + 60
    loginView2 = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-40, SCREEN_WIDTH, 100)];
    UIButton *bt_login2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [bt_login2 setTitle:@"--换种方式--" forState:UIControlStateNormal];
    [bt_login2 setTitleColor:[UIColor colorWithRed:50/255.0 green:189/255.0 blue:170/255.0 alpha:1.0] forState:UIControlStateNormal];
    [bt_login2 addTarget:self action:@selector(loginAction2) forControlEvents:UIControlEventTouchUpInside];
    [loginView2 addSubview:bt_login2];
    [self.view addSubview:loginView2];
    
    UIImageView *loginQQ = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-40-40-20)/2, 50, 40, 40)];
    loginQQ.image = [UIImage imageNamed:@"qq.png"];
    [loginView2 addSubview:loginQQ];
    
    UIImageView *loginchat = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-40-40-20)/2+60, 50, 40, 40)];
    loginchat.image = [UIImage imageNamed:@"chat.png"];
    [loginView2 addSubview:loginchat];
    
    // 6 返回
    UIButton *bt_return = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, 60, 60)];
    [bt_return setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [bt_return addTarget:self action:@selector(returnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt_return];
}
-(void)returnAction{
    [self dismissViewControllerAnimated:true completion:nil];
}
-(void)loginAction{
    [tf_userName resignFirstResponder];
    [tf_password resignFirstResponder];
    NSString *userName = [tf_userName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [tf_password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    // 正则
    if ([userName containsString:@"#"] || [userName containsString:@"$" ] || [userName containsString:@"%"]) {
        [self showAlert:@"警告！" message: @"包含非法字符！"];
    }else if (password.length<8){
        [self showAlert:@"警告！" message: @"密码长度不够！"];
    }else{
        CGRect frame = CGRectMake(0, 0, 100, 100);
        UIView *activityBg = [[UIView alloc]initWithFrame:frame];
        activityBg.center = self.view.center;
        activityBg.backgroundColor = [UIColor grayColor];
        activityBg.alpha = 0.7;
        activityBg.layer.cornerRadius = 5.0;
        [self.view addSubview:activityBg];
        
        UIActivityIndicatorView *loadActivity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        loadActivity.frame = CGRectMake(30, 30, 40, 40);
        [loadActivity sizeToFit];
        loadActivity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [activityBg addSubview:loadActivity];
        [loadActivity startAnimating];
        // 网络请求 延迟时间
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, 2000*NSEC_PER_MSEC);
        // 延迟方法
        // 1 delayTime 2 thread 3 代码
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [loadActivity stopAnimating];
            [activityBg removeFromSuperview];
            [self dismissViewControllerAnimated:true completion:nil];
        });
        
    }
}
-(void)loginAction2{
    // 动画 1 动画开始 2 设置动画属性 3 动画执行
    // 1 动画开始
    [UIView beginAnimations:nil context:nil];
    // 2 周期
    [UIView setAnimationDuration:0.5];
    if (!login2hidden) {
        loginView2.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);
    }else{
        loginView2.frame = CGRectMake(0, SCREEN_HEIGHT-40, SCREEN_WIDTH, 100);
    }
    login2hidden = !login2hidden;
    // 3 动画执行
    [UIView commitAnimations];
    
}

-(void)showAlert:(NSString *)title message:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:true completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
