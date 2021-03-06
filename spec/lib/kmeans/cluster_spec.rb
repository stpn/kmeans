# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Kmeans::Cluster do
  before :all do
    @uniform_hash = {
      "test01"=>
        {"hoge"=>0,
         "fuga"=>1,
         "piyo"=>0
        },
      "test02"=>
        {"hoge"=>2,
         "fuga"=>1,
         "piyo"=>3
        },
      "test03"=>
        {"hoge"=>3,
         "fuga"=>0,
         "piyo"=>1
        },
      "test04"=>
        {"hoge"=>0,
         "fuga"=>2,
         "piyo"=>0
        },
      "test05"=>
        {"hoge"=>4,
         "fuga"=>2,
         "piyo"=>3
        },
      "test06"=>
        {"hoge"=>3,
         "fuga"=>1,
         "piyo"=>1
        }
      }

    @unequal_hash = {
      "test01"=>
        {"hoge"=>0,
         "fuga"=>1,
         "piyo"=>0
        },
      "test02"=>
        {"hoge"=>2,
         "fuga"=>1,
         "piyo"=>3
        },
      "test03"=>
        {"hoge"=>3,
         "fuga"=>0,
         "poyo"=>1
        },
      "test04"=>
        {"puyo"=>0,
         "fuga"=>2,
         "piyo"=>0
        },
      "test05"=>
        {"hoge"=>4,
         "fuga"=>2,
         "poyo"=>3
        },
      "test06"=>
        {"hoge"=>3,
         "hohe"=>1,
         "piyo"=>1
        }
      }
  end

  context 'の Cluster クラスにおいて' do
    describe 'キーの均一な二次元ハッシュを渡すと' do
      it "Kmeans::Cluster クラスが返却される" do
        result = Kmeans::Cluster.new(@uniform_hash, {
          :centroids => 5,
          :loop_max => 10
          })
        result.class.should be_equal Kmeans::Cluster
      end

      it "ハッシュの配列が返却される (結果は実行ごとに異なる)" do
        result = Kmeans::Cluster.new(@uniform_hash, {
          :centroids => 5,
          :loop_max => 10
          })
        result.make_cluster
        result.cluster.class.should be_equal Hash
        result.cluster.values.class.should be_equal Array
      end
    end

    describe 'キーの不均一な二次元ハッシュを渡すと' do
      it "Kmeans::Cluster クラスが返却される" do
        result = Kmeans::Cluster.new(@unequal_hash, {
          :centroids => 5,
          :loop_max => 10
          })
        result.class.should be_equal Kmeans::Cluster
      end

      it "ハッシュの配列が返却される (結果は実行ごとに異なる)" do
        result = Kmeans::Cluster.new(@unequal_hash, {
          :centroids => 5,
          :loop_max => 10
          })
        result.make_cluster
        result.cluster.class.should be_equal Hash
        result.cluster.values.class.should be_equal Array
      end
    end
  end
end
