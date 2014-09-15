
# jr@oblique:  15/9/14


class Micropost < ActiveRecord::Base
  belongs_to :user
  
  default_scope -> { order('created_at DESC') }

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
end
