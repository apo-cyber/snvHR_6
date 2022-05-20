class Post < ApplicationRecord
  belongs_to :user
  validates :post1, presence: true

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w(name workplace post1 post2 post3 post4 post5 post6 post7 post8 post9 post10 post11 post12 post13 post14 post15 post16 post17 post18 post19 post20 post21 post22 created_at)
  end

  def self.ransackable_assosiations(auth_object = nil)
    []
  end

  def self.csv_attributes
    ["post1", "post2", "post3", "post4", "post5", "post6", "post7", "post8", "post9", "post10", "post11", "post12", "post13", "post14", "post15", "post16", "post17", "post18", "post19", "post20", "post21","post22", "name", "workplace", "created_at", "updated_at", "user_id"]
  end

  def self.generate_csv
    CSV.generate(headers:true, encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
      csv << csv_attributes
      all.each do |post|
        csv << csv_attributes.map{|attr| post.send(attr)}
      end
    end
  end

end
