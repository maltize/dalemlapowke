# == Schema Information
#
# Table name: bribes
#
#  id           :integer          not null, primary key
#  kind         :integer          not null
#  area         :integer          not null
#  service      :integer          not null
#  year         :string           not null
#  month        :string           not null
#  amount       :decimal(9, 2)    not null
#  subject      :string(255)      not null
#  description  :text
#  user         :string(255)
#  validated_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Bribe < ActiveRecord::Base
  attr_accessible :amount, :area, :description, :kind, :service, :subject, :year, :month

  has_many :comments, :dependent => :destroy

  validates :kind, :area, :service, :year, :month, :amount, :subject, :presence => true

  validates :month, :format => { :with => /\d{1,2}/ }

  validates :year, :format => { :with => /\d{4}/ }

  scope :valid, where("validated_at IS NOT NULL")

  def valid!
    update_attribute(:validated_at, Time.now)
  end

  def user=(ip)
    write_attribute(:user, Digest::MD5.hexdigest(ip))
      rescue nil
  end

  def service
    Service.find( read_attribute(:service) )
  end

  def area
    Area.find( read_attribute(:area) )
  end

  def kind
    Kind.find( read_attribute(:kind) )
  end

  def bribe_date
    self.month = sprintf "%02d", self.month
    %(#{year} - #{month})
  end

end
