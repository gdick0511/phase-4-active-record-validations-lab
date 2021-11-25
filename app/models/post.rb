class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :click_bait 
    def click_bait
        if title 
            unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any?{|phrase| title.include? phrase}
                errors.add(:title, "This is not enough clickbait")
            end
        end
    end
    # def click_bait
#     baits = [“Won’t Believe”,“Secret”,“Top [number]“,”Guess”]
#     if title
#       if baits.none? {|bait| title.include?(bait)}
#         errors.add(:title, “not click bait enough”)
#       end
#     end
#   end
end
