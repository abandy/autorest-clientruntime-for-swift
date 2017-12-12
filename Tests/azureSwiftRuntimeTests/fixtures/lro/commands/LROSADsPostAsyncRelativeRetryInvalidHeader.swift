import Foundation
import azureSwiftRuntime
// PostAsyncRelativeRetryInvalidHeader long running post request, service returns a 202 to the initial request, with an
// entity that contains ProvisioningState=’Creating’. The endpoint indicated in the azureAsyncOperation header is
// invalid. This method may poll for completion. Polling can be canceled by passing the cancel channel argument. The
// channel will be used to cancel polling and any outstanding HTTP requests.
class LROSADsPostAsyncRelativeRetryInvalidHeaderCommand : BaseCommand {
    var product :  ProductTypeProtocol?

    override init() {
        super.init()
        self.method = "Post"
        self.isLongRunningOperation = true
        self.path = "/lro/error/postasync/retry/invalidheader"
    }

    override func preCall()  {
        self.body = product
    }

    override func encodeBody() throws -> Data? {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(product as! ProductType?)
        return jsonData
    }

    public func execute(client: RuntimeClient) throws -> Decodable? {
        return try client.execute(command: self)
    }
    }