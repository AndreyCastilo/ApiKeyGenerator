class RequestController < ApplicationController
  def index
  end

  def find_duplicates
      dataD = params[:data]
      data =Array.new
      dataD.each do |word|
        data.push(word.strip)
      end
      api_key = params[:api_key]
      unless data.nil? || api_key.nil?
        key = Key.find_by(api_key: api_key)
        unless key.nil?
          key.update(cantidadReq: key.cantidadReq+1)
          dataIndex = {}
          duplicates = []
          data.each_with_index do |value, indx|
            index_key = value
            index_value = indx
            if !dataIndex.has_key?(index_key)
              dataIndex.store(index_key, [])
            end
            dataIndex[index_key].push(index_value)
          end
          dataIndex.each do |key, indxs|
            if indxs.count > 1
              duplicates.push({word: key,positions: indxs})
            end
          end
          response = {status:"success", code:200, duplicates:duplicates}
          render json:  response, status: :ok
        else
          response = {status:"unauthorized", code:401}
          render json:  response, status: :ok
        end
      end
  end
end
