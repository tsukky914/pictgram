require 'rails_helper'

RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
    describe '#age' do
        before do
            allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2018/04/01'))
        end
        context '20年前の生年月日の場合'  do
            let(:user){User.new(birthday: Time.zone.now - 20.years)}
            
            it '年齢が20歳であること' do
               expect(user.age).to eq 20
            end
       end
    end
end
