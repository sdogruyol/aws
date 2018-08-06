require "spec"
require "webmock"

Spec.before_each do
  WebMock.reset
end

require "../src/aws"
