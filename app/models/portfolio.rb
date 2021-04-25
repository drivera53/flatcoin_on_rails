class Portfolio < ApplicationRecord
    def self.search(query)
        self.where("name like %?%", query)
    end

    def self.most_recent
        self.order(created_at: :asc)
    end
end
