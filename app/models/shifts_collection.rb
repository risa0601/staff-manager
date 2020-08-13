class ShiftsCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
	SHIFT_NUM = 5
	attr_accessor :collection
	
	# 初期化メソッド
def initialize(attributes = [])
  if attributes.present?
    self.collection = attributes.map do |value|
      Shift.new(
        user_id: value["user_id"],
        date: value['date'],
        category: value['category'],
        content: value['content']
      )
    end
  else
    self.collection = SHIFT_NUM.times.map{ Shift.new() }
  end
end
  
   # レコードが存在するか確認するメソッド
  def persisted?
    false
  end
  
  # コレクションをDBに保存するメソッド
  def save
    is_success = true
    collection.each do |result|
      # バリデーションを全てかけたいからsave!ではなくsaveを使用
      is_success = false unless result.save
    end
    return is_success
  end
end