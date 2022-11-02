class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :title_is_clickbate

    

    def title_is_clickbate

        if title == nil
            return
        end

    clickbateTitle = [
            "Won't Believe",
            "Secret",
            "Top [number]",
            "Guess"
        ]

        if clickbateTitle.none? {|c| title.include?(c)}
            errors.add(:title, "Not clickbait-y enough!")
        # elsif title == nil
        #     return
        end
    end
end
