module Aws
  module Sqs
    # An Sqs client for interacting with Sqs.
    #
    # Creating an Sqs Client
    #
    # ```
    # client = Client.new("region", "key", "secret")
    # ```
    #
    # Client with custom endpoint
    # ```
    # client = Client.new("region", "key", "secret", endpoint: "http://test.com")
    # ```
    #
    # Client with custom signer algorithm
    # ```
    # client = Client.new("region", "key", "secret", signer: :v2)
    # ```
    class Client
      @signer : Awscr::Signer::Signers::Interface

      def initialize(@region : String, @aws_access_key : String, @aws_secret_key : String, @endpoint : String? = nil, signer : Symbol = :v4)
        @signer = SignerFactory.get(
          version: signer,
          region: @region,
          aws_access_key: @aws_access_key,
          aws_secret_key: @aws_secret_key
        )
      end

      def create_queue(name : String)
        resp = http.get("/?Action=CreateQueue&QueueName=#{name}&Version=2012-11-05")

        resp.status_code == 200
      end

      def send_message(queue : String, message : String)
        params = "Action=SendMessage&MessageBody=#{message}&Version=2012-11-05"
        resp = http.post("/#{queue}", headers: {"Content-Type" => "application/x-www-form-urlencoded"}, body: params)

        resp.status_code == 200
      end

      # :nodoc:
      private def http
        Http.new(@signer, @region, @endpoint)
      end
    end
  end
end
