# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many_attached :images

  attribute :status, :integer, default: 2
end
