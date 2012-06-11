require 'spec_helper'

describe Ethon::Easies::Http::Actions::Put do
  let(:easy) { Ethon::Easy.new }
  let(:url) { "http://localhost:3001/" }
  let(:params) { nil }
  let(:form) { nil }
  let(:put) { described_class.new(url, {:params => params, :body => form}) }

  describe "#setup" do
    before { put.setup(easy) }

    it "sets url" do
      easy.url.should eq(url)
    end

    it "sets upload" do
      easy.upload.should be
    end

    it "sets infile_size" do
      easy.infilesize.should eq(0)
    end

    it "makes a put request" do
      easy.prepare
      easy.perform
      easy.response_body.should include('"REQUEST_METHOD":"PUT"')
    end

    context "when params" do
      let(:params) { {:a => "1&"} }

      it "attaches escaped to url" do
        easy.url.should eq("#{url}?a=1%26")
      end

      context "when requesting" do
        before do
          easy.prepare
          easy.perform
        end

        it "makes a put request" do
          easy.response_body.should include('"REQUEST_METHOD":"PUT"')
        end
      end

    end

    context "when body"

    context "when params and body"
  end
end
