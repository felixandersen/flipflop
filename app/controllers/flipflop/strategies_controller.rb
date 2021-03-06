module Flipflop
  class StrategiesController < ApplicationController
    def update
      strategy.switch!(feature_key, enable?)
      redirect_to(features_url)
    end

    def destroy
      strategy.clear!(feature_key)
      redirect_to(features_url)
    end

    private

    def enable?
      params[:commit].to_s.downcase.include?("on")
    end

    def feature_key
      params[:feature_id].to_sym
    end

    def strategy
      FeatureSet.current.strategy(params[:id])
    end
  end
end
