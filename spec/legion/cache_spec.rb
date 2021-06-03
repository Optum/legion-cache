# frozen_string_literal: true

require 'legion/cache'

RSpec.describe Legion::Cache do
  it 'has a version number' do
    expect(Legion::Cache::VERSION).not_to be nil
  end

  it 'can setup' do
    expect { Legion::Cache.client }.not_to raise_exception
    expect(Legion::Cache.connected?).to eq true
  end

  it 'can set' do
    expect(Legion::Cache).to respond_to :set
    expect(Legion::Cache.set('test', 'foobar')).to eq true
    expect(Legion::Cache.set('test_ttl', 'ttl_value', 10)).to eq true
  end

  it 'can get' do
    expect(Legion::Cache).to respond_to :get
    expect(Legion::Cache.get('test')).to eq 'foobar'
    expect(Legion::Cache.get('nil')).to eq nil
  end

  it 'can delete' do
    expect(Legion::Cache).to respond_to :delete
    expect(Legion::Cache.delete('test')).to eq true
    expect(Legion::Cache.delete('test_nil')).to eq false
  end

  it 'can flush' do
    expect(Legion::Cache).to respond_to :flush
    expect(Legion::Cache.flush).to eq true
  end

  it 'can get size and available counts' do
    expect(Legion::Cache.size).to eq 10
    expect(Legion::Cache.available).to eq 10
  end

  it 'can shutdown' do
    Legion::Cache.client
    expect { Legion::Cache.shutdown }.not_to raise_exception
    expect(Legion::Cache.connected?).to eq false
  end

  it 'can restart with new values' do
    Legion::Cache.client
    expect(Legion::Cache.connected?).to eq true
    expect(Legion::Cache.available).to eq 10
    expect(Legion::Cache.timeout).to eq 5
    expect { Legion::Cache.restart(pool_size: 2, timeout: 2) }.not_to raise_exception
    expect(Legion::Cache.available).to eq 2
    expect(Legion::Cache.timeout).to eq 2
    expect(Legion::Cache.connected?).to eq true
    expect(Legion::Cache.set('test_ttl_restart', 'ttl_value_restart', 10)).to eq true
    expect(Legion::Cache.get('test_ttl_restart')).to eq 'ttl_value_restart'
  end

  it 'can setup' do
    expect { Legion::Cache.setup }.not_to raise_exception
    expect(Legion::Cache.connected?).to eq true
    expect { Legion::Cache.setup }.not_to raise_exception
    expect(Legion::Cache.connected?).to eq true
    expect { Legion::Cache.close }.not_to raise_exception
    expect(Legion::Cache.connected?).to eq false
    expect { Legion::Cache.setup }.not_to raise_exception
    expect(Legion::Cache.connected?).to eq true
  end
end
