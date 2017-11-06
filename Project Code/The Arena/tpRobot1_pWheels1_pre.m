function [fire, transition] = tpRobot1_pWheels1_pre(transition)

tokID = tokenAnyColor('pRobot1',1,{'wheels'});
transition.selected_tokens = tokID;

fire = (tokID);
end

