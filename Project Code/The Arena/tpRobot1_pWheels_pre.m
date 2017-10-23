function [fire, transition] = tpRobot1_pWheels_pre(transition)

tokID = tokenEXColor('pRobot1',1,{'wheels'});
transition.selected_tokens = tokID;

fire = (tokID);
end

