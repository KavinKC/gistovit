class Query < ActiveRecord::Base
    has_one :emotion, dependent: :destroy
end
