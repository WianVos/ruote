#--
# Copyright (c) 2009, John Mettraux, jmettraux@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# Made in Japan.
#++


module Ruote

  class FlowExpressionId

    attr_accessor :engine_id
    attr_accessor :wfid
    attr_accessor :expid

    def to_s
      "#{@engine_id}|#{@wfid}|#{@expid}"
    end

    def hash
      to_s.hash
    end

    def equal (other)
      return false unless other.is_a(FlowExpressionId)
      (hash == other.hash)
    end

    def child_id
      @expid.split('_').last.to_i
    end

    def new_child_fei (child_index)
      cfei = self.dup
      cfei.expid = "#{@expid}_#{child_index}"
      cfei
    end

    def parent_wfid
      @wfid.split('|').first
    end

    def sub_wfid
      @wfid.split('|').last
    end
  end
end

