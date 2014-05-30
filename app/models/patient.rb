class Patient < ActiveRecord::Base
	has_many :writings
end
