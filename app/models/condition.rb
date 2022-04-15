class Condition < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    {id: 1, name: '新品・未使用'},
    {id: 2, name: '未使用に近い'},
    {id: 3, name: '目立った汚れや傷なし'},
    {id: 4, name: 'やや汚れや傷あり'},
    {id: 5, name: '汚れや傷あり'},
    {id: 6, name: '全体的に状態が悪い'}
    ]

    include ActiveHash::Associations
  has_many :items
  end