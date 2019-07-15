require "../spec_helper"

module Aws::S3
  describe Bucket do
    it "is equal to another bucket if name and creation time are equal" do
      time = Time.utc
      bucket = Bucket.new("test", time)
      Bucket.new("test", time).should eq(bucket)
    end

    it "not equal to another bucket if name and creation time differ" do
      time = Time.utc
      bucket = Bucket.new("test2", time)
      new_bucket_time = Time.utc + 2.minutes
      new_bucket = Bucket.new("test", new_bucket_time)

      (new_bucket == bucket).should eq(false)
    end

    it "has a name" do
      bucket = Bucket.new("name", Time.utc)

      bucket.name.should eq("name")
    end

    it "has a creation_time" do
      time = Time.utc
      bucket = Bucket.new("name", time)

      bucket.creation_time.should eq(time)
    end
  end
end
