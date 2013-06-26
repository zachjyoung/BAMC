class User < ActiveRecord::Base
  rolify
  attr_accessible :name
end
