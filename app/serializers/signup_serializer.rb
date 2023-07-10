class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :actitvity_id, :time

  has_one :activity
end
