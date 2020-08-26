import Foundation

class ErrorHandler {
    weak var messagesView: UserMessagesView?

    func handleError(error: Error) {
        Logger.debugLog("Error: \(error)")
        let message = error.localizedDescription
        messagesView?.showErrorAlert(withMessage: message)
    }

    func handleMessage(message: String) {
        messagesView?.showMessageAlert(withMessage: message)
    }
}
