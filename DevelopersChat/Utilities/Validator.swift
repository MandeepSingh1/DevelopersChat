

import Foundation

enum Validator {
   
    case email(_ value:String)
    case phone(_ value:String)
    case name(_ value: String)
    case username(_ value: String)
    case passwordLimit(_ value:String)
    case normalPassword(_ value:String)

    var validate:Bool {
        
        switch self {
        
        case .email(let value):
            return value.isEmail
        case .phone(let value):
            let filter : String = "^\\d{3}-\\d{3}-\\d{4}$"
            let emailTest : NSPredicate = NSPredicate(format: "SELF MATCHES %@", filter)
            return emailTest.evaluate(with: value)
        case .passwordLimit(let value):
            let filter : String = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{8,}$"
            let passwordTest : NSPredicate = NSPredicate(format: "SELF MATCHES %@", filter)
            return passwordTest.evaluate(with: value)
        case .normalPassword(let value):
            return value.count >= 8
        case .username(let value):
            return value.isValidUsername()
        case .name(let value):
            return value.isValid()
        }
    }
}


extension String {
    private static let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    private static let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    private static let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,6}"

    public var isEmail: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", type(of:self).__emailRegex)
        return predicate.evaluate(with: self)
    }
    
//    func isValidUsername() -> Bool {
//        let allowedCharacter = CharacterSet.alphanumerics
//        let characterSet = CharacterSet(charactersIn: self)
//        return allowedCharacter.isSuperset(of: characterSet)
//    }
    
    func isValidUsername() -> Bool {
        
        let RegEx = "^[0-9a-zA-Z\\_]{4,20}$"
//            "[a-z]+[0-9]*[_.-]?[a-z0-9]{4,18}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self)
    }

    func isValid() -> Bool {
        //Declaring the rule of characters to be used. Applying rule to current state. Verifying the result.
        let regex = "[A-Za-z ]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: self)
        return result
    }

}
