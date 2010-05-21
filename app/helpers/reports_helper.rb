module ReportsHelper
  def pie_graphs(attributes, controller)
    attributes.collect{|attribute| pie_graph(attribute, controller)}.join "\n"
  end
  
  def pie_graph(attribute, controller)
    %Q\<script type="text/javascript">
    var myChart = new FusionCharts("/swfs/Pie3D.swf", "#{attribute}", "464px", "300px");
    myChart.setDataURL("#{controller}/pie_graphs/#{attribute}.xml");
    myChart.render("#{attribute}");
    </script>\
  end
  
  def bar_graphs(relations, controller)
    relations.collect {|relation| bar_graph(relation, controller) }.join "\n"
  end
  
  def bar_graph(relation, controller)
    %Q\<script type="text/javascript">
    var myChart = new FusionCharts("/swfs/Column3D.swf", "#{relation}", "944px", "450px");
    myChart.setDataURL("#{controller}/bar_graphs/#{relation}.xml");
    myChart.render("#{relation}");
    </script>\
  end
  
  def attribute_check_box(controller, survey, attribute)
    html= check_box_tag "#{attribute}_#{survey[attribute]}",
			survey[attribute],
			!session[:"#{controller}_unchecked_ids"].include?("#{attribute}_#{survey[attribute]}")
		html+= %Q\<script type="text/javascript">
			$('##{attribute}_#{survey[attribute]}').click( function() {
				if($(this).attr('checked'))
					$.get('/reports/add_ids/#{controller}', { attribute: '#{attribute}', value: $(this).val(), checkbox_id: $(this).attr('id') });
				else
					$.get('/reports/remove_ids/#{controller}', { attribute: '#{attribute}', value: $(this).val(), checkbox_id: $(this).attr('id') });
			})
		</script> \
		html+=survey.chosen(attribute).to_s
  end
  
  def relation_check_box(controller, model, relation)
    html = check_box_tag "#{relation}_#{model.id}",
			model.id,
			!session[:"#{controller}_unchecked_ids"].include?("#{relation}_#{model.id}")
		html+= %Q\<script type="text/javascript">
			$('##{relation}_#{model.id}').click( function() {
				if($(this).attr('checked'))
					$.get('/reports/add_relation_ids/#{controller}', { model: '#{model.class.class_name}', value: $(this).val(), checkbox_id: $(this).attr('id') });
				else
					$.get('/reports/remove_relation_ids/#{controller}', { model: '#{model.class.class_name}', value: $(this).val(), checkbox_id: $(this).attr('id') });
			})
		</script> \
		html+=model.respond_to?(:to_label) ? model.to_label : model.respond_to?(:name) ? model.name[0..20] : model.to_s
  end
  
  def question_has_graph?(graphs, attributes)
    graphs.each do |graph|
      attributes.each do |attribute|
        return true if graph.to_s == attribute.to_s
      end
    end
    return false
  end
  
end
