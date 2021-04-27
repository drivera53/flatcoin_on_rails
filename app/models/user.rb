class User < ApplicationRecord
  has_secure_password

  # Remane relationship to group another name
  has_many :created_portfolios, foreign_key: "user_id", class_name: "Portfolio"
  has_many :trades, through: :created_portfolios

  has_many :comments
  has_many :portfolios, through: :comments

end
