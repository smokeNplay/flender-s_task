class Message < ApplicationRecord
  validates :email, :first_name, :last_name, :amount, presence: true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'Requires a valid email format'
  }
  validates :amount, numericality: { only_integer: true }

  scope :by_email, ->(str) { where('email like ?', "%#{str}%") }
  scope :by_last_name, ->(str) { where('last_name like ?', "%#{str}%") }

  scope :sorted_by, ->(sort_option) {
    direction = /desc$/.match?(sort_option) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^first_name/
      order("LOWER(first_name) #{direction}")
    when /^amount/
      order("amount #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  filterrific(available_filters: %i[sorted_by by_email by_last_name])

  def self.options_for_sorted_by
    [
      ['First name', 'first_name_asc'],
      ['Amount', 'amount_asc'],
    ]
  end
end
