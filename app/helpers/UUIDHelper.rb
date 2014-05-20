require 'rubygems'
require 'uuidtools'
module UUIDHelper
  def UUIDcreate()
    UUID.timestamp_create().to_s
  end
end