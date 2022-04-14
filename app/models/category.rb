class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    {id: 1, name: 'レディース'},
    {id: 2, name: 'メンズ'},
    {id: 3, name: 'ベビー・キッズ'},
    {id: 4, name: 'インテリア・住まい・小物'},
    {id: 5, name: 'おもちゃ・ホビー・グッズ'},
    {id: 5, name: '家電・スマホ・カメラ'},
    {id: 6, name: 'スポーツ・レジャー'},
    {id: 7, name: 'ハンドメイド'},
    {id: 8, name: 'その他'},
    ]

    include ActiveHash::Associations
  has_many :items
  end