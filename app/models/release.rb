class Release < ActiveModel::Validator
    def validate(song)
        if song.released == true
            unless Integer === song.release_year && song.release_year <= Time.now.year
                song.errors[:release_year] << "Needs to be an integer earlier than this year"
            end
        end
    end
end