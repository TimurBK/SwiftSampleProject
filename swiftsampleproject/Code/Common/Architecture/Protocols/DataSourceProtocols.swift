//
//  DataSourceProtocols.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 01.02.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

protocol SectionDescription {
	func objectAtIndexedSubscript(index:UInt64) -> AnyObject?
	func set(object:AnyObject?, at indexedSubscript:UInt64)
	func rowsCount() -> UInt64
	func indexOf(object:AnyObject?) -> UInt64?
	func removeObject(at index:UInt64)
	func removeAllObjects()
	func add(object:AnyObject, at index:UInt64)
	func add(object:AnyObject)
	func set(object:AnyObject, at index:UInt64)
	func object(at index:UInt64) -> AnyObject?

	func rows() -> [AnyObject]
	func title() -> NSString
}

protocol DataSource {
	func title(`for` section:UInt64) -> String?
	func rows(`in` section:UInt64) -> UInt64?

	func sectionsCount() -> UInt64
	func totalCount() -> UInt64
}

//
//@protocol DataSource <NSObject>
//
//- (NSIndexPath *)indexPathOfObject:(id)object;
//
//- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
//- (id)objectAtIndex:(NSUInteger)index inSection:(NSUInteger)section;
//- (void)removeObjectAtIndexPath:(NSIndexPath *)indexPath;
//- (void)removeObjectAtIndex:(NSUInteger)index inSection:(NSUInteger)section;
//- (void)addObject:(id)object atIndexPath:(NSIndexPath *)indexPath;
//- (void)setObject:(id)object atIndexPath:(NSIndexPath *)indexPath;
//- (void)addObject:(id)object atIndex:(NSUInteger)index inSection:(NSUInteger)section;
//- (void)setObject:(id)object atIndex:(NSUInteger)index inSection:(NSUInteger)section;
//
//- (void)addSection:(id<SectionDescription>)section atIndex:(NSUInteger)index;
//- (void)addSection:(id<SectionDescription>)section;
//- (void)addSections:(NSArray <id<SectionDescription>>*)sections;
//- (NSArray <id<SectionDescription>>*)allSections;
//- (void)setSection:(id<SectionDescription>)section atIndex:(NSUInteger)index;
//- (void)removeSectionAtIndex:(NSUInteger)index;
//- (void)removeAllSections;
//- (id<SectionDescription>)sectionAtIndex:(NSUInteger)index;
//
//@end
