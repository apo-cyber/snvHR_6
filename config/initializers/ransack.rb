Ransack.configure do |config|
  config.add_predicate :during_year,
                       arel_predicate: :between,
                       formatter: proc { |v|
                         Time.zone.parse("#{v.year}-4-1").to_date...Time.zone.parse("#{v.year + 1}-3-31").to_date
                       },
                       type: :date
end
