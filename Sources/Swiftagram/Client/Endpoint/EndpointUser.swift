//
//  EndpointUser.swift
//  Swiftagram
//
//  Created by Stefano Bertagno on 08/03/2020.
//

import Foundation

public extension Endpoint {
    /// A `struct` holding reference to `users` `Endpoint`s. Requires authentication.
    struct User {
        /// The base endpoint.
        private static let base = Endpoint.version1.users.defaultHeader().locked()

        /// A user matching `identifier`'s info.
        /// - parameter identifier: A `String` holding reference to a valid user identifier.
        public static func summary(for identifier: String) -> Locked<ComposableRequest> {
            return base.append(identifier).info
        }

        /// All user matching `query`.
        /// - parameter query: A `String` holding reference to a valid user query.
        public static func all(matching query: String) -> Paginated<Locked<ComposableRequest>, Response> {
            return base.search.query("q", value: query).paginating()
        }
    }
}
