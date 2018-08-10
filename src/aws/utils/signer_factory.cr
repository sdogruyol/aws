module Aws
  module Utils
    # Fetches an `Awscr::Signer::Signers` based on the signing version
    # requested, and configures it with the region, key and secret.
    class SignerFactory
      # Fetch and configure a signer based on a version algorithm
      def self.get(service_name : String, region : String, aws_access_key : String,
                   aws_secret_key : String, version : Symbol)
        case version
        when :v4
          Awscr::Signer::Signers::V4.new(
            service: service_name,
            region: region,
            aws_access_key: aws_access_key,
            aws_secret_key: aws_secret_key
          )
        when :v2
          Awscr::Signer::Signers::V2.new(
            service: service_name,
            region: region,
            aws_access_key: aws_access_key,
            aws_secret_key: aws_secret_key
          )
        else
          raise "Unknown signer version: #{version}"
        end
      end
    end
  end
end
