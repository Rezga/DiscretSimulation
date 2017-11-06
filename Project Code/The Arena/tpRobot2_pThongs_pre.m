function [fire, transition] = tpRobot2_pThongs_pre(transition)

tokID = tokenAnyColor('pRobot2',1,{'openThong','closeThong'});
transition.selected_tokens = tokID;

fire = (tokID);
end