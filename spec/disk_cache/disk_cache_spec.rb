require 'spec_helper'

describe DiskCache do
  let(:path) { 'spec/asset/Trollface.svg' }
  let(:file) { File.open(path, 'r') }

  context "storing and accessing" do
    it ".put" do
      DiskCache.put(path)
      DiskCache.get(path).should_not be_nil
    end

    it ".get" do
      DiskCache.put(path)
      file_from_cache = DiskCache.get(path)
      FileUtils.compare_file(file, file_from_cache).should be_true
    end

    it ".pget" do
      DiskCache.del(path)
      file_from_cache = DiskCache.pget(path)
      FileUtils.compare_file(file, file_from_cache).should be_true
    end
  end

  context "removing data" do
    before(:each) { DiskCache.put(path) }

    it ".delete" do
      DiskCache.del(path)
      DiskCache.get(path).should be_nil
    end
  end
end