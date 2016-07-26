class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence:true, uniqueness: true
	validates :body, presence:true, length: { minimum: 20}
	#validates :name, format:{ with: /Expresion Regular/ }
	before_create :set_visits_count

	def set_visits_count
		self.visits_count = 0
	end
	def update_visits_count
		if self.visits_count.nil? 
			self.set_visits_count
		end
		self.update(visits_count: self.visits_count + 1)
	end
end
