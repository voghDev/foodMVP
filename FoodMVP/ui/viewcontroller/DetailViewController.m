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

#import "DetailViewController.h"
#import "UserRepositoryImpl.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _presenter = [[DetailPresenterImpl alloc] init];
    _userRepository = [[UserRepositoryImpl alloc] init];
    [_presenter initWithView: self item: _foodItem andRepository: _userRepository];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) showFood:(FoodItem*) item
{
    [_lblTitle setText:[item foodName] ];
}

-(void) showLoading
{
    [_loading setHidden:NO];
}

-(void) hideLoading
{
    [_loading setHidden:YES];
}

-(void) onListReceived:(NSArray *)array
{
    [_lblUsers setText:[NSString stringWithFormat:@"%ld users liked this recipe",  [array count]] ];
    // TODO fill _tableView
}

@end
