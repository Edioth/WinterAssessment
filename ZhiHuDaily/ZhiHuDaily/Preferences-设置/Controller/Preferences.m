//
//  Preferences.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "Preferences.h"

@interface Preferences ()

@end

@implementation Preferences

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 4) {
        return 1;
    } else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.text = @"大字体";
        [cell.textLabel setFont:[UIFont systemFontOfSize:22]];
        cell.detailTextLabel.text = @"更大的字体";
        cell.accessoryView = [[UISwitch alloc] init];
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"清除缓存";
    } else if (indexPath.section == 2) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"证书中心";
        } else {
            cell.textLabel.text = @"协议中心";
        }
    } else if (indexPath.section == 3) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"去好评";
        } else {
            cell.textLabel.text = @"去吐槽";
        }
    } else {
        cell.textLabel.textAlignment = UIListContentTextAlignmentCenter;
        cell.textLabel.text = @"退出登陆";
        [cell.textLabel setTextColor:[UIColor redColor]];
        [cell.textLabel setFont:[UIFont systemFontOfSize:20]];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 4) {
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"isLogin"];
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"userName"];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

@end
