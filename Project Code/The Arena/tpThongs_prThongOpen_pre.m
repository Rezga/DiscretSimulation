function [fire, transition] = tpThongs_prThongOpen_pre(transition)

tokID = tokenAnyColor('pThongs',1,{'openThong'});
transition.selected_tokens = tokID;

fire = (tokID);
end
