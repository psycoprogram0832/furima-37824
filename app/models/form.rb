class Form
  include ActiveModel::Model
  attr_accessor :token, :user, :item

  validates :price, presence: true
  validates :token, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end