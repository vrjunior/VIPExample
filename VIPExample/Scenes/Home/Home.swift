/// VIP Use Cases Models
/// Usados para abstrair os parametros necessários em um VIP cycle.
/// Vantagem: Caso altere os parametros, não irá quebrar os protocolos.
enum Home {
    
    // MARK: - FetchComponents Use Case
    
    enum FetchComponents {
        struct Request {}
        
        enum Success {
            struct Response {
                let title: String
            }
            
            struct ViewModel {
                let title: String
            }
        }
        
        enum Failure {
            struct Response {
                let error: Error
            }
            
            struct ViewModel {
                let errorMessage: String
            }
        }
    }
}
