//
//  CharacterTest.m
//  GuildBrowser
//
//  Created by アリャビマ　アウリア ラーマン on 2013/03/05.
//  Copyright (c) 2013年 Charlie Fulton. All rights reserved.
//

#import "CharacterTest.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTest

{
    // 1
    NSDictionary *_characterDetailJson;
}

// 2
-(void)setUp
{
    // 3
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class]
                             URLForResource:@"character" withExtension:@"json"];
    
    // 4
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    // 5
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    STAssertNotNil(json, @"invalid test data");
    
    
    _characterDetailJson = json;
}

-(void)tearDown
{
    // 6
    _characterDetailJson = nil;
}

- (void)testCreateCharacterFromDetailJSon
{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"could not create");
    
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"could not create from nil");
}
@end
