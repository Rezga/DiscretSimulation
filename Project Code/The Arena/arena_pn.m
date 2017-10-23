clear all; clc;
global global_info;
global_info.STOP_AT = 15;

pns = pnstruct('arena_pn_pdf');

dynamic.m0 = {'py1', 1}; % # of tokens initially
dynamic.ft = {'allothers',1};
pni = initialdynamics(pns, dynamic);

sim = gpensim(pni);

plotp(sim, {'py1','pyRamp','py2', 'pyBasket','pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower','pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2'})

prnss(sim);