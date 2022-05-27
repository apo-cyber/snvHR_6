module ApplicationHelper

  def CalcAge(birthday)
       (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end

  def place
    @place = ['経営戦略本部', '生産本部', '品質本部', '管理本部', 'CMC開発部', '企画部', '製剤部', '包装部','生産推進部', '信頼性保証部', '品質管理部', '薬制安全部', '生産管理部', '総務部', '営業部']
  end

  def place2
    @place2=['１グループ', '２グループ']
  end

end
