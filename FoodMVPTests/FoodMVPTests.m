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
#import "MainView.h"
#import "MainPresenter.h"
#import "MainPresenterStatus.h"
#import "MainPresenterMockImpl.h"
#import "FoodMockRepository.h"

@interface FoodMVPTests : XCTestCase{
    id< MainView, MainViewStatus > mockView;
    id< FoodRepository, FoodRepositoryStatus > repository;
    id< MainPresenter, MainPresenterStatus > presenter;
}
@end

@implementation FoodMVPTests

- (void)setUp {
    // Coño!! tests! no me lo creo ni yo
    [super setUp];
    mockView = [[MainViewMockImpl alloc] init];
    repository = [[FoodMockRepository alloc] init];
    presenter = [[MainPresenterMockImpl alloc] init];
}

- (void)tearDown {
    [super tearDown]; // Tiene nombre de coche, seat ibiza superteardown
}

- (void)testThatIHaventFuckedUpTheInitializersBecauseImVeryLikelyToDoTheseThings {
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(repository);
    XCTAssertNotNil(mockView);
}

-(void)testThatPresenterLoadsElementsOnStart{
    XCTAssertFalse([mockView hasElementsOnList]);
    [presenter initWithView:mockView andRepository:repository];
    XCTAssertFalse([mockView isLoading]); // Would be fantastic to test loading:YES/NO while loading
    XCTAssertTrue([mockView hasElementsOnList]);
}

-(void)testThatPresenterHasValidRepositoryOnStart{
    id<MainPresenter, MainPresenterStatus> p = [[MainPresenterMockImpl alloc] init];
    [p initWithView:mockView andRepository:repository];
    XCTAssertTrue([p hasValidRepository]);
}

-(void)testThatPresenterHasValidViewOnStart{
    id<MainPresenter, MainPresenterStatus> p = [[MainPresenterMockImpl alloc] init];
    [p initWithView:mockView andRepository:repository];
    XCTAssertTrue([p hasValidView]);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Madre mia que performance tiene esto
        // Fijate si es rapido que no hace nada
    }];
}

@end
