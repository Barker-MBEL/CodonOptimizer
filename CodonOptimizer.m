% Codon optimizer main. Version 0.3
% Author: Leandro Moretti
% 
% Description: function opens a file in .fasta format, converts it to aa
% sequence then picks the best codons for E Coli expression according to the
% frequency tables from the work of Welch et al., PLOS one 2009. 
% A new file containing the new DNA sequence is produced. 
% 
% In future versions, new functionality will be added in order to check for
% RNA secondary structure, deleterious domains and restriction sites.
%**************************************************************************

%%
clc, clear
%obtain file name
title=input('Type complete file name.\nEnsure it''s in same directory as this script \n','s');
% %opening FASTA file
sequence=fastaread(char(title),'TrimHeaders',true);

%checking if FASTA file is in aminoacid format
%(program expects aa sequences to start with M methionine)
if sequence.Sequence(1) == 'M' || sequence.Sequence(1) == 'm'
   seqAA=sequence.Sequence; 
else
    
    seqAA=nt2aa(sequence.Sequence);
end

n=length(seqAA);

%%
newseq='';
%calling actual optimizer function
for i=1:1:n
    codon=optimscFv(seqAA(i));
    %putting new codon together with DNA sequence
    newseq=strcat(newseq, codon);
end

%%
%writing newly found sequence to a new FASTA file
%NOTE: if this script is run multiple files, the FASTA file is appended,
%not overwritten. This might help during testing phase.
optimized='Optimized_';
new_title=strcat(optimized,title);
fastawrite(new_title, newseq);



