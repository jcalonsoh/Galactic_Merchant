# frozen_string_literal: true

require_relative '../lib/roman_converter'
require_relative 'spec_helper'

describe String do
  context '# Arabic Number' do
    it "converts 'V' to 5" do
      expect('V'.to_arabic_number).to eq 5
    end

    it "converts 'MCMIV' to 1904" do
      expect('MCMIV'.to_arabic_number).to eq 1904
    end

    it "converts 'MMMMCMXCIX' to 4999" do
      expect('MMMMCMXCIX'.to_arabic_number).to eq 4999
    end

    it 'returns nil for empty string' do
      expect(''.to_arabic_number).to be_nil
    end
  end

  context '# Process galactic words' do
    it 'convert galatic words to ammount' do
      expect(Merchant.new('glob is I').recon_sentence.to_s.to_arabic_number).to eq 1
    end
    it 'convert galatic words to ammount' do
      expect(Merchant.new('prok is V').recon_sentence.to_s.to_arabic_number).to eq 5
    end
    it 'convert galatic words to ammount' do
      expect(Merchant.new('pish is X').recon_sentence.to_s.to_arabic_number).to eq 10
    end
    it 'convert galatic words to ammount' do
      expect(Merchant.new('tegj is L').recon_sentence.to_s.to_arabic_number).to eq 50
    end
  end

  context '# trade mineral' do
    it '2 Silver is 34 Credits' do
      expect(Merchant.new('glob glob is Silver is 34 Credits').recon_sentence.unit_price).to eq 17.0
    end
    it '4 Gold is 57800 Credits' do
      expect(Merchant.new('glob prok Gold is 57800 Credits').recon_sentence.unit_price).to eq 14_450
    end
    it '20 Iron is 3910 Credits' do
      expect(Merchant.new('pish pish Iron is 3910 Credits').recon_sentence.unit_price).to eq 195.5
    end
  end

  context '# translate questions' do
    it 'how much is pish tegj glob glob ?' do
      expect(Merchant.new('how much is pish tegj glob glob ?').recon_sentence).to eq 'pish tegj glob glob is 42'
    end
    it 'how much is pish tegj glob glob ?' do
      expect(Merchant.new('how many Credits is glob prok Silver ?').recon_sentence).to eq 'glob prok Silver is 68 Credits'
    end
    it 'how much is pish tegj glob glob ?' do
      expect(Merchant.new('how many Credits is glob prok Gold ?').recon_sentence).to eq 'glob prok Gold is 57800 Credits'
    end
    it 'how much is pish tegj glob glob ?' do
      expect(Merchant.new('how many Credits is glob prok Iron ?').recon_sentence).to eq 'glob prok Iron is 782 Credits'
    end
    it 'how much is pish tegj glob glob ?' do
      expect(Merchant.new('how much wood could a woodchuck chuck if a woodchuck could chuck wood ?').recon_sentence).to eq 'I have no idea what you are talking about'
    end
  end
end
