class Song < ActiveRecord::Base
  has_many :upvotes
end
