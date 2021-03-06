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

  PER_PAGE = 10

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

  def area_title
    area.title
  end

  def kind_title
    kind.title
  end

  def service_title
    service.title
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
    self.month = sprintf "%02d", self.month.to_i
    %(#{year} - #{month})
  end

  def to_param
    "#{id}-#{subject.parameterize}"
  end

end
