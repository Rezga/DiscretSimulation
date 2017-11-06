function [fire, transition] = tpRobot1_pCannon_pre(transition)

tokID = tokenAnyColor('pRobot1',1,{'cannon'});
transition.selected_tokens = tokID;

fire = (tokID);
end

