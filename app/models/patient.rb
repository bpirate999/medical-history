class Patient < ActiveRecord::Base
	has_many :writings, dependent: :destroy
	def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
      Patient.create! row.to_hash
        end
    end
end
