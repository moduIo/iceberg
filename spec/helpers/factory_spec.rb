require 'rails_helper'

describe FactoryGirl do
	described_class.factories.map(&:name).each do |factory_name|
		describe "#{factory_name} factory" do
			it 'is valid' do
				factory = described_class.build(factory_name)
				expect(factory).to be_valid, -> { factory.errors.full_messages.join("\n") }

			end # end do
		end # end do
	end # end do
end # end do
