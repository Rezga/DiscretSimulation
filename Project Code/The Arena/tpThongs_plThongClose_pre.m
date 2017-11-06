function [fire, transition] = tpThongs_plThongClose_pre(transition)

tokID = tokenAnyColor('pThongs',1,{'closeThong'});
transition.selected_tokens = tokID;

fire = (tokID);
end

