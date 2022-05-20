class User < ApplicationRecord
  has_secure_password
  has_one_attached :image, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness:true
  validates :password, presence: true, on: :create

  scope :recent, -> { order(created_at: :asc) }

  has_many :posts, dependent: :destroy
  has_many :careers, dependent: :destroy

  enum gender: { 男性: 1, 女性: 2}

  def self.ransackable_attributes(auth_object = nil)
    %w(name idnumber workplace gender admin retired created_at)
  end

  def self.ransackable_assosiations(auth_object = nil)
    []
  end

  def self.csv_attributes
    ["idnumber", "name", "workplace", "email", "birth", "join_date", "gender", "retired", "admin", "root", "HR","created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers:true, encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
      csv << csv_attributes
      all.each do |user|
        csv << csv_attributes.map{|attr| user.send(attr)}
      end
    end
  end

end
