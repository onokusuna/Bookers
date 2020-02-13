class Book < ApplicationRecord
	#title,bodyフィールドについて空欄での登録を禁止
	validates :title, presence: true #(presence=存在)
	validates :body, presence: true
end
