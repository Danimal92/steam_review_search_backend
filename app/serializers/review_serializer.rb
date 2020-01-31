class ReviewSerializer < ActiveModel::Serializer
  attributes :id
  has_one :games
end
