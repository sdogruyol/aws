require "spec"
require "timecop"
require "webmock"
require "./s3/fixtures"

#struct Time
#  def self.utc_now
#    Timecop.now
#  end
#end

Spec.before_each do
  WebMock.reset
end

require "../src/aws"
