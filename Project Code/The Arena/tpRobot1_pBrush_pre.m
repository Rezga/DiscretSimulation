function [fire, transition] = tpRobot1_pBrush_pre(transition)

tokID = tokenAnyColor('pRobot1',1,{'brush'});
transition.selected_tokens = tokID;

fire = (tokID);
end

