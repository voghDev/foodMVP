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

#import <UIKit/UIKit.h>
#import "MainPresenterImpl.h"
#import "MainView.h"
#import "MockFoodRepository.h"
#import "FoodTableViewDataSource.h"

@interface MainViewController : UITableViewController< MainView, UITableViewDelegate >

@property id< FoodRepository > foodRepository;
@property MainPresenterImpl* presenter;
@property NSArray* food; // Should be removed
@property int selectedIndex; // Should be removed

@property (weak, nonatomic) IBOutlet UIButton *btnNavigate1;
@property (weak, nonatomic) IBOutlet UIButton *btnNavigate2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (nonatomic, strong) FoodTableViewDataSource* tableViewDataSource;

@end

