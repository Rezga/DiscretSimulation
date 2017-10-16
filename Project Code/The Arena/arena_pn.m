clear all; clc;
global global_info;
global_info.STOP_AT = 15;

pns = pnstruct('arena_pn_pdf');

dynamic.m0 = {'py1', 1}; % # of tokens initially
dynamic.ft = {'ty1', 3, 'ty2', 7, 'tTower', 3}; % seconds each transition takes
pni = initialdynamics(pns, dynamic);

sim = gpensim(pni);

plotp(sim, {'py1', 'pyRamp', 'py2'});
prnss(sim);