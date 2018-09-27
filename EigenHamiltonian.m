function [ U , D ] = EigenHamiltonian( H )
%EIGENHHAMILTONIAN quantizes the Hamiltonian function "H" in the
% Kohn-Nirenberg formalism and returns its EigenDecomposition
%   USAGE: [ U , D ] = EigenHamiltonian( H )
%	INPUT:
%		H			: Hamiltonian as Matrix
%	OUTPUT:
%		U			: Eigenbasis
%		D           : Eigenvalues
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    % get quantized Hamiltonian
    Ham = fft( fftshift(H) .* dftmtx( size( H ) )' ); 
    % get eigendecomposition of self-adjoint part
    [ U , D ] = eig( ( Ham + Ham' )/2 );
    U = fftshift(U,1);
end