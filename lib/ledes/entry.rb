module Ledes
  class Entry
 
    ATTRS = [
      :invoice_date,
      :invoice_number,
      :client_id,
      :law_firm_matter_id,
      :invoice_total,
      :billing_start_date,
      :billing_end_date,
      :invoice_description,
      :line_item_number,
      :exp_fee_inv_adj_type,
      :line_item_number_of_units,
      :line_item_adjustment_amount,
      :line_item_total,
      :line_item_date,
      :line_item_task_code,
      :line_item_expense_code,
      :line_item_activity_code,
      :timekeeper_id,
      :line_item_description,
      :law_firm_id,
      :line_item_unit_cost,
      :time_keeper_name,
      :time_keeper_classification,
      :client_matter_id
    ]
  
    attr_accessor *ATTRS

    def initialize(attrs = {})
      self.attributes = attrs
    end



    def attributes
      ATTRS.inject({}) do |result, attr|
        result[attr] = instance_variable_get "@#{attr}"
        result
      end
    end


    private 

    def attributes=(attrs)
      return if attrs.empty?
      attrs.each_pair do |key, value|
        if respond_to?(:"#{key}=")
          self.send(:"#{key}=", value)
        end
      end
    end

  end
end
