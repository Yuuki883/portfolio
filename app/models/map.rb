class Map < ApplicationRecord
    geocoded_by :name
    after_validation :geocode, if: :name_changed?
    belongs_to :user
end
