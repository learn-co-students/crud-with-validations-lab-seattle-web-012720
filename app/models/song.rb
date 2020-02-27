class Song < ApplicationRecord
    include ActiveModel::Validations
    validates :title, {presence: true, uniqueness: {scope: [:release_year, :artist_name] }}
    validates :artist_name, presence: true
    validates_with ReleaseYearValidator

end
