# require 'rails_helper'

# RSpec.describe 'Lists', type: :system do
#   let(:user) { create(:user) }
#   let(:list) { create(:list, user:) }

#   describe 'お気に入りリストCRUD' do
#     describe 'お気に入りリストの一覧' do
#       before { login(user) }
#       it 'ユーザーメニューにお気に入りリスト一覧へのリンクがあることを確認する' do
#         expect(page).to have_link 'お気に入りリスト', href: list_design_tips_path, visible: false
#       end

#       context 'お気に入りリストが一件もない場合' do
#         it '「リストが作成されていません」と表示されること' do
#           visit list_design_tips_path
#           expect(page).to have_content('リストが作成されていません')
#         end
#       end

#       context 'お気に入りリストがある場合' do
#         it 'お気に入りリストの一覧が表示されること' do
#           list
#           visit list_design_tips_path
#           expect(page).to have_content(list.name)
#         end
#       end
#     end
#   end
# end
