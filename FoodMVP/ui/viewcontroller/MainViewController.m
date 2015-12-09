/*
 * Copyright (C) 2015 Olmo Gallegos Hernández.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "MainViewController.h"
#import "NavigateToDetailSegue.h"

#define kSegueNavigateToDetail @"navigateToDetail"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _presenter = [[MainPresenterImpl alloc] init];
    _foodRepository = [[MockFoodRepository alloc] init];
    [_presenter initWithView:self andRepository: _foodRepository];
    
    [self.tableView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:kSegueNavigateToDetail]){
        NavigateToDetailSegue* ns = (NavigateToDetailSegue*) segue;
        ns.foodItem = [_food objectAtIndex:_selectedIndex];
    }
}

#pragma Mark - View methods (reactions to Presenter orders)

-(void) showLoading{
    [_loading setHidden:NO];
}

-(void) hideLoading{
    [_loading setHidden:YES];
}

-(void) onListReceived:(NSArray *)array
{
    _food = array;
    _tableViewDataSource = [[FoodTableViewDataSource alloc] initWithFood:array];
    self.tableView.dataSource = _tableViewDataSource;
    
    [self.tableView reloadData];
}

-(void) navigateToDetail: (int) position
{
    _selectedIndex = position;
    [self performSegueWithIdentifier:kSegueNavigateToDetail sender:self];
}

#pragma Mark - selectors (reactions to user interactions - they have to be notified to the Presenter)

-(IBAction) button1Clicked:(id)sender
{
    [_presenter onButton1Clicked];
}

-(IBAction) button2Clicked:(id)sender
{
    [_presenter onButton2Clicked];
}

#pragma Mark - TableView delegate methods

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_presenter onListItemClicked: indexPath.row];
}

@end
