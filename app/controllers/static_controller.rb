class StaticController < ApplicationController
    def home
        @dreams = Dream.all.made_public
    end
end