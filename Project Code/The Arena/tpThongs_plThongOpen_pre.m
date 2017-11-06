function [fire, transition] = tpThongs_plThongOpen_pre(transition)

tokID = tokenAnyColor('pThongs',1,{'openThong'});
transition.selected_tokens = tokID;

fire = (tokID);
end
