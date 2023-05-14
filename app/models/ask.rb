class Ask < ApplicationRecord
  has_many :responses, dependent: :destroy

  validates :ask_detail, presence: true

  def self.create_response(params)
    responses = params[:responses]&.values || []
    responses.map { |response_id| Response.find(response_id).is_answer }.join
  end
end
