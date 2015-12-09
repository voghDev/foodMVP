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
#import <XCTest/XCTest.h>
#import "FoodMockRepository.h"

@implementation FoodMockRepository

-(BOOL) hasFood
{
    return [food count] > 0;
}
-(int) getCount
{
    return (int)[food count];
}
-(FoodItem*) getItemAt: (int) position
{
    return [food objectAtIndex:position];
}

-(NSArray*) get
{
    
    FoodItem* f1 = [[FoodItem alloc] initWithId:1 name:@"Grilled salmon with potatoes" description:@"So tasty"];
    food = [[NSMutableArray alloc] init];
    [food addObject:f1];

    return food;
}

@end
