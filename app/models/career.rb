class Career < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w(name workplace career1 career2 career3 career4 career5 career6 career7 career8 career9 created_at)
  end

  def self.ransackable_assosiations(auth_object = nil)
    []
  end

  def self.csv_attributes
    ["career1", "career2", "career3", "career4", "career5", "career6", "career7", "career8", "career9", "created_at", "updated_at", "user_id"]
  end

  def self.generate_csv
    CSV.generate(headers:true, encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
      csv << csv_attributes
      all.each do |career|
        csv << csv_attributes.map{|attr| career.send(attr)}
      end
    end
  end

end
