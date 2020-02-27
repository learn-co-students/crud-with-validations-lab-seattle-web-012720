require 'pry'

class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :must_be_released_if_has_release_year
    validate :cannot_repeat
    validates :released, inclusion: { in: [true, false] }
    validates :released, exclusion: { in: [nil] }
    validate :release_year_max
    # validates :release_year, numericality: true
    # validates :release_year, numericality: { less_than: Time.now.year + 1}
    
    def release_year_max
        if release_year
            if release_year > Time.now.year
                errors.add(:release_year, "Not the future dawg")
            end
        end
    end

    def must_be_released_if_has_release_year
        # byebug
            if released == true
                if release_year == nil
                    # byebug
                errors.add(:release_year, "Yo they released this")
                # errors.add(:released, "Yup")
            end
        end
    end

    def cannot_repeat
        @same_title = Song.all.find {|song| song.title == title}
        # byebug
        if @same_title != self
            if @same_title
                if @same_title.artist_name
                    if @same_title.artist_name == artist_name
                        if @same_title.release_year
                            if @same_title.release_year == release_year
                                errors.add(:title, "This song is in our f********* databse arlready")
                            end
                        end
                    end
                end
            end
        end
    end

end

#     Nil: <%= f.radio_button :released, nil, :checked => false %><br>

