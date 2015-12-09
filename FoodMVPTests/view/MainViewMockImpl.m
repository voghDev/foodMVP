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
#import "MainViewMockImpl.h"

@implementation MainViewMockImpl

@synthesize isViewLoading;
@synthesize elementCount;
@synthesize didNavigateToDetail;
@synthesize detailPosition;

-(void) showLoading{
    isViewLoading = YES;
}

-(void) hideLoading{
    isViewLoading = NO;
}

-(void) onListReceived:(NSArray *)array
{
    elementCount = (int)[array count];
}

-(void) navigateToDetail: (int) position
{
    detailPosition = position;
    didNavigateToDetail = YES;
}

#pragma Mark - status

-(BOOL) isLoading
{
    return isViewLoading;
}

-(BOOL) hasElementsOnList
{
    return elementCount > 0;
}

-(int) getCount
{
    return (int) elementCount;
}

-(BOOL) hasNavigatedToDetail
{
    return didNavigateToDetail;
}

-(int) getDetailPosition
{
    return detailPosition;
}

@end
