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

#import "RandomUserApiMapper.h"

@implementation RandomUserApiMapper

-(instancetype) initWithData:(NSData *)data
{
    self = [super init];
    
    if(self){
        self.data = data;
    }
    
    return self;
}

-(NSArray*) parseUsers
{
    NSMutableArray* ret = [[NSMutableArray alloc] init];
    
    if(!_data)
        return ret;
    
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:nil];
    
    if ([dict isKindOfClass:[NSDictionary class]] && dict[@"results"]) {
        NSArray *results = dict[@"results"];
        if ([results count] > 0) {
            NSDictionary* user = [results objectAtIndex:0][@"user"];
            [ret addObject: [self parseUser: user]];
        }
    }
    
    return ret;
}

-(User*) parseUser: (NSDictionary*) user
{
    User* u = [[User alloc] initWithId:1 name:user[@"name"][@"first"] imageUrl:user[@"picture"][@"large"]];
    return u;
}

-(NSArray*) parseUsersUsingData:(NSData *)data
{
    self.data = data;

    return [self parseUsers];
}

@end