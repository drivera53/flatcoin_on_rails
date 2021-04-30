class Portfolio < ApplicationRecord
    belongs_to :user
    
    has_many :comments
    has_many :users, through: :comments

    has_many :trades

    validates :name, presence: true
    validates :description, presence: true
    validates :initial_balance, presence: true, numericality: { only_integer: true }

    # You must include at least one class level ActiveRecord scope method
    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

    # def self.most_recent
    #     self.order(created_at: :asc)
    # end
    scope :most_recent, -> { self.order(created_at: :desc) }

    def max_coins(price)
        (self.current_balance / price).to_i
    end
end
