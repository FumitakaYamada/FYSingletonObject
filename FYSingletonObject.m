//
//  SWSingletonObject.m
//  Swingmail
//
//  Created by andpdas on 11/5/13.
//  Copyright (c) 2013 BHIInc. All rights reserved.
//

#import "SWSingletonObject.h"

static NSMutableDictionary *_instances;

@implementation SWSingletonObject

+ (id)singletonObject
{
	@synchronized(self) {
		if (!_instances[NSStringFromClass(self)]) {
			id hoge = [[self alloc] init];
			hoge = hoge; // to remove warning
		}
	}
	
	return _instances[NSStringFromClass(self)];
}

+ (id)allocWithZone:(NSZone *)zone
{
	@synchronized(self) {
		if (!_instances[NSStringFromClass(self)]) {
			id instance = [super allocWithZone:zone];
			
			if ([_instances count] == 0)
				_instances = [[NSMutableDictionary alloc] initWithCapacity:0];
			
			_instances[NSStringFromClass(self)] = instance;
			
			return instance;
		}
	}
	
	return nil;
}

- (id)copyWithZone:(NSZone *)zone { return self; }
@end
