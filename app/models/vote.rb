class Vote < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :votable, polymorphic: true
end
