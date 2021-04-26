class Portfolio < ApplicationRecord
    belongs_to :user
    
    has_many :comments
    has_many :users, through: :comments


    # You must include at least one class level ActiveRecord scope method
    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

    def self.most_recent
        self.order(created_at: :asc)
    end
end
