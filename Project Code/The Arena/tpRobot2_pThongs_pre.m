function [fire, transition] = tpRobot2_pThongs_pre(transition)

tokID = tokenAnyColor('pRobot2',1,{'openThong','closeThong'});
transition.selected_tokens = tokID;
granted = request(transition.name, {'robot2',1});        

%if(tokID)
%   colors=get_color('pRobot2',tokID);
%end

fire = tokID&&granted;
end