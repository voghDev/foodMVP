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

#import "GetUsersMockImpl.h"
#import "User.h"

@implementation GetUsersMockImpl{
    int mockId;
}

-(NSArray*) get
{
    NSArray* arr = [[NSArray alloc] initWithObjects:
        [self createUserWithName:@"Sebastian" andImageUrl:@"http://lorempixel.com/animals/1"],
        [self createUserWithName:@"Juan" andImageUrl:@"http://lorempixel.com/animals/2"],
        [self createUserWithName:@"Esteban" andImageUrl:@"http://lorempixel.com/animals/3"],
        [self createUserWithName:@"José" andImageUrl:@"http://lorempixel.com/animals/4"],
                    nil];
    
    return arr;
}

-(id) createUserWithName: (NSString*) name andImageUrl: (NSString*) url
{
    return [[User alloc] initWithId:mockId++ name:name imageUrl:url];
}

@end
