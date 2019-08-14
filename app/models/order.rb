# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :response_to_orders

  has_many_attached :images
  enum status: [:new, :completed, :in_progress], _prefix: :order

end
