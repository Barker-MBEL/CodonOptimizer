function [dna] = optimscFv(aa)
%Function reads an amminoacid and returns EColi optimized codon

% Codons are chosen based on frequency table from Welch et al., PLOS one 2009
% Various amminoacids are sorted through thanks to a case statement
% Random number generator is reseeded every time the function is called.
% Fnc takes in a string and returns a three letter string

%Leandro Moretti, June 10th 2016

%seeding random number generator and getting value
rng('shuffle');
n=rand;

%Beginning switch statment, one case per amminoacid
switch aa
%%
%alanine
    case {'A','a'}
        if n<=0.24
            dna='GCA';
        else if n<=43
                dna='GCC';
            else if n<=55
                    dna='GCT';
                else
                    dna='GCG';
                end
            end
        end
%% 
%arginine 
    case {'R','r'}
        if n<=0.03
            dna='AGA';
        else if n<=0.38
                dna='CGC';
            else
                dna='CGT';
            end
        end
%%
%asparagine
    case {'N','n'}
        if n<=0.47
            dna='AAT';
        else
            dna='AAC';
        end
        
 %%
 %aspartic acid
    case {'D','d'}
        if n<=0.46
            dna='GAT';
        else
            dna='GAC';
        end
        
%%
%cysteine
    case {'C','c'}
        if n<=0.42
            dna='TGT';
        else 
            dna='TGC';
        end
        
%%
%glutamine
    case {'Q','q'}
        if n<=0.45
            dna='CAA';
        else
            dna='CAG';
        end
        
%%
%glutamic acids
    case {'E','e'}
        if n<=0.43
            dna='GAA';
        else
            dna='GAG';
        end

%%
%glycine
    case {'G','g'}
        if n<=0.39
            dna='GGC';
        else
            dna='GGT';
        end
        
%%
%histidine
    case {'H','h'}
        if n<=0.38
            dna='CAT';
        else
            dna='CAC';
        end
        
%%
%isoleucine
    case {'I','i'}
        if n<=0.49
            dna='ATT';
        else
            dna='ATC';
        end
        
%%
%leucine
    case {'L','l'}
        if n<=0.03
            dna='CTC';
        else if n<=0.05
                dna='CTT';
            else if n<=0.08
                    dna='TTA';
                else if n<=0.22
                        dna='TTG';
                    else
                        dna='CTG';
                    end
                end
            end
        end
        
 %%
 %lysine
    case {'K','k'}
        if n<=0.49
            dna='AAG';
        else
            dna='AAA';
        end
     
%%
%methionine
    case {'M','m'}
        dna='ATG';
        
%%
%phenylananine
    case {'F','f'}
        if n<=0.45
            dna='TTT';
        else
            dna='TTC';
        end
        
%%
%proline
    case {'P','p'}
        if n<=0.1
            dna='CCA';
        else if n<=0.19
                dna='CCT';
            else
                dna='CCG';
            end
        end
        
%%
%serine
    case {'S','s'}
        if n<=0.02
            dna='TCA';
        else if n<=0.12
                dna='TCT';
            else if n<=0.17
                    dna='TCG';
                else if n<=0.3
                        dna='TCC';
                    else
                        dna='AGC';
                    end
                end
            end
        end
        
%%
%threonine
    case {'T','t'}
        if n<=0.1
            dna='ACT';
        else if n<=0.43
                dna='ACG';
            else
                dna='ACC';
            end
        end
       
%%
%tryptophane
    case {'W','w'}
        dna='TGG';
        
%%
%tyrosine
    case {'Y','y'}
        if n<=0.42
            dna='TAT';
        else
            dna='TAC';
        end
        
%%
%valine
    case {'V','v'}
        if n<=0.03
            dna='GTA';
        else if n<=0.31
                dna='GTC';
            else if n<=0.65
                    dna='GTG';
                else
                    dna='GTT';
                end
            end
        end

%%
%stop codon
    case {'*'}
        dna='TAG';
        %always Amber codon as stop codon
        
%%
%end of switch statement
    otherwise
        fprintf('undefined amino acid letter/n try again');
        dna='XXX';
end

 

        
     
        
    
end

