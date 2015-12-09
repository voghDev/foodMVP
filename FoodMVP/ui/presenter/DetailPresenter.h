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


#import <Foundation/Foundation.h>
#import "DetailPresenter.h"
#import "UserRepository.h"
#import "User.h"
#import "DetailView.h"

@protocol DetailPresenter<NSObject>

-(void) onListItemClicked: (int) position;
-(void) initWithView: (id < DetailView >) view item:(FoodItem*) item andRepository:(id < UserRepository >) repo;

@property(nonatomic,strong) id< DetailView > view;
@property(nonatomic,strong) id< UserRepository > repository;
@property(nonatomic,strong) FoodItem* item;

@end
