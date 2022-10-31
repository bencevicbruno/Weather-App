import Foundation

protocol GeonamesAPIServiceProtocol {
    typealias SuccessHandler = ([String]) -> Void
    typealias FailureHandler = (Failure) -> Void
    
    func fetchListOfCities(prefixedWith prefix: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?)
}
