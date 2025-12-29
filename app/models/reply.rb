# app/models/reply.rb
class Reply < ApplicationRecord
  belongs_to :post
end
