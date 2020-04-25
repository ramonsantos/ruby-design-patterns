# frozen_string_literal: true

describe Maria do
  context 'when the current state is litte' do
    it 'takes fire flower and changes state to fire flower' do
      subject.take_fire_flower
      expect(subject.current_state).to be_kind_of(FireFlower)
    end

    it 'takes ice flower and changes state to ice flower' do
      subject.take_ice_flower
      expect(subject.current_state).to be_kind_of(IceFlower)
    end

    it 'take star and change state to star' do
      subject.take_star
      expect(subject.current_state).to be_kind_of(Star)
    end

    it 'takes damage and dies' do
      subject.take_damage
      expect(subject.current_state).to be_kind_of(Dead)
    end
  end

  context 'when the current state is ice flower' do
    it 'takes fire flower and changes state to fire flower' do
      subject.take_ice_flower
      subject.take_fire_flower
      expect(subject.current_state).to be_kind_of(FireFlower)
    end

    it 'picks ice flower and remains in ice flower state' do
      subject.take_ice_flower
      subject.take_ice_flower
      expect(subject.current_state).to be_kind_of(IceFlower)
    end

    it 'take star and change state to star' do
      subject.take_ice_flower
      subject.take_star
      expect(subject.current_state).to be_kind_of(Star)
    end

    it 'takes damage and gets little' do
      subject.take_ice_flower
      subject.take_damage
      expect(subject.current_state).to be_kind_of(Little)
    end
  end

  context 'when the current state is star' do
    it 'catches fire flower and remains in the star state' do
      subject.take_star
      subject.take_fire_flower
      expect(subject.current_state).to be_kind_of(Star)
    end

    it 'picks ice flower and remains in star state' do
      subject.take_star
      subject.take_ice_flower
      expect(subject.current_state).to be_kind_of(Star)
    end

    it 'picks up star and remains in star state' do
      subject.take_star
      subject.take_star
      expect(subject.current_state).to be_kind_of(Star)
    end

    it 'takes damage and remains in the star state' do
      subject.take_star
      subject.take_damage
      expect(subject.current_state).to be_kind_of(Star)
    end
  end

  context 'when the current state is flower of fire' do
    it 'catches fire flower and remains in fire flower state' do
      subject.take_fire_flower
      subject.take_fire_flower
      expect(subject.current_state).to be_kind_of(FireFlower)
    end

    it 'takes ice flower and changes state to ice flower' do
      subject.take_fire_flower
      subject.take_ice_flower
      expect(subject.current_state).to be_kind_of(IceFlower)
    end

    it 'take star and change state to star' do
      subject.take_fire_flower
      subject.take_star
      expect(subject.current_state).to be_kind_of(Star)
    end

    it 'takes damage and gets little' do
      subject.take_fire_flower
      subject.take_damage
      expect(subject.current_state).to be_kind_of(Little)
    end
  end
end
