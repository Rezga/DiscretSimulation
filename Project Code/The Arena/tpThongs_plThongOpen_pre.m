function [fire, transition] = tpThongs_plThongOpen_pre(transition)

tokID = tokenAnyColor('pThongs',1,{'openThong'});
transition.selected_tokens = tokID;
granted = request(transition.name, {'robot2',1});
transition.selected_tokens = tokID;

fire = (tokID)&&(granted);
end
