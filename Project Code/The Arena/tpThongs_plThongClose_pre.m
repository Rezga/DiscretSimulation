function [fire, transition] = tpThongs_plThongClose_pre(transition)

tokID = tokenAnyColor('pThongs',1,{'closeThong'});
transition.selected_tokens = tokID;
granted = request(transition.name, {'robot2',1});
transition.selected_tokens = tokID;

fire = (tokID)&&(granted);
end

