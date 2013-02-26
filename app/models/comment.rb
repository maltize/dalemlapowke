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

  validates :bribe, :comment, :presence => true

  scope :valid, where("validated_at IS NOT NULL")
  scope :not_valid, where("validated_at IS NULL")

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
