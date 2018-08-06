require "../spec_helper"

module Aws
  module Sqs
    describe Client do
      it "allows signer version" do
        Client.new("adasd", "adasd", "adad", signer: :v2)
      end

      describe "create_queue" do
        it "creates a queue" do
          WebMock.stub(:get, "http://sqs.eu-west-1.amazonaws.com")
            .with(query: {"Action" => "CreateQueue", "QueueName" => "queue", "Version" => "2012-11-05"})
            .to_return(body: "")

          client = Client.new("eu-west-1", "key", "secret")
          result = client.create_queue("queue")

          result.should be_true
        end
      end

      describe "send_message" do
        it "sends a message" do
          WebMock.stub(:post, "http://sqs.eu-west-1.amazonaws.com/queue")
            .with(body: "Action=SendMessage&MessageBody=message&Version=2012-11-05", headers: {"Content-Type" => "application/x-www-form-urlencoded"})
            .to_return(body: "")

          client = Client.new("eu-west-1", "key", "secret")
          result = client.send_message("queue", "message")

          result.should be_true
        end
      end
    end
  end
end
