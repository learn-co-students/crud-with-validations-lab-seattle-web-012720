class ReleaseyearValidator < ActiveModel::Validator
    def validate(record)
        if record[:released] == true
            if record[:release_year].class != Integer
                record.errors[:release_year] << "The release year must be an integer"
            end
            if record[:release_year] > Time.now.year
                reord.errors[:release_year] << "The release year cannot be in the future"
            end
        end
    end
end