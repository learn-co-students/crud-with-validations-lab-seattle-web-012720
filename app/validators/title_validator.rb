class TitleValidator < ActiveModel::Validator
    def validate(record)
        @songs = Song.where(artist_name: record[:artist_name])
        @songs.where(release_year: record[:release_year]).delete_all
        if @songs.include?(record[:title])
            record.errors[:title] << "This artist already has a song by this name"
        end
    end
end