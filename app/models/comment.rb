# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  bribe_id     :integer          not null
#  comment      :text             default(""), not null
#  user         :string(255)
#  validated_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :bribe_id, :comment

  belongs_to :bribe

  PER_PAGE = 10

  validates :bribe, :comment, :presence => true

  scope :valids, where("validated_at IS NOT NULL").order('id DESC')
  scope :not_valids, where("validated_at IS NULL").order('id DESC')

  def self.valid(page = 1)
    valids.paginates(page)
  end

  def self.not_valid(page = 1)
    not_valids.paginates(page)
  end

  def self.all(page = 1)
    order('id DESC').paginates(page)
  end

  def self.paginates(page = 1)
    paginate(
      :page     => page,
      :per_page => PER_PAGE
    )
  end

  def valid!
    update_attribute(:validated_at, Time.now)
  end

  def validated?
    validated_at.present?
  end

  def unvalid!
    update_attribute(:validated_at, nil)
  end

  def user=(ip)
    write_attribute(:user, Digest::MD5.hexdigest(ip))
      rescue nil
  end
end
