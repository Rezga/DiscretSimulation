function [fire, transition] = tpRobot1_pCannon_pre(transition)

tokID = tokenEXColor('pRobot1',1,{'cannon'});
transition.selected_tokens = tokID;

fire = (tokID);
end

