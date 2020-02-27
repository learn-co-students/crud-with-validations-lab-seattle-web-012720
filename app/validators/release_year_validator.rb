class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
      if record.released == true
        unless !record.release_year.nil? && record.release_year <= Time.now.year
            record.errors[:release_year] << "Release year must be present and in the past."
        end
      end
    end
end