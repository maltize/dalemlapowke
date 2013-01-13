# == Schema Information
#
# Table name: bribes
#
#  id           :integer          not null, primary key
#  kind         :integer          not null
#  area         :integer          not null
#  service      :integer          not null
#  when         :date             not null
#  amount       :decimal(9, 2)    not null
#  subject      :string(255)      not null
#  description  :text
#  user         :string(255)
#  validated_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Bribe < ActiveRecord::Base
  attr_accessible :amount, :area, :description, :kind, :service, :subject, :user, :validated_at, :when

  validates :kind, :area, :service, :when, :amount, :subject, :presence => true

  scope :valid, where("validated_at IS NOT NULL")

  def valid!
    update_attribute :validated_at, Time.now
  end

  def user=(ip)
    write_attribute(:user, Digest::MD5.hexdigest(ip))
      rescue nil
  end
end
