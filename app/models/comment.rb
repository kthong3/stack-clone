class Comment < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :commentable, polymorphic: true
end
