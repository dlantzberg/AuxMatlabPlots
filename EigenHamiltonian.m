function [ U , D , Flow ] = EigenHamiltonian( H )
%EIGENHHAMILTONIAN quantizes the Hamiltonian function "H" in the
% Kohn-Nirenberg formalism and returns its EigenDecomposition
%   USAGE: [ U , D ] = EigenHamiltonian( H )
%	INPUT:
%		H			: Hamiltonian as Matrix
%	OUTPUT:
%		U			: Eigenbasis
%       D           : Eigenvalues
%       Flow        : 1-parameter Unitary group of operators in time-domain
%
%	AUTHOR:	dlantzberg, 2017-2018

    % get quantized Hamiltonian
    Ham = fft( fftshift(H) .* dftmtx( size( H ) )' ); 
    % get eigendecomposition of self-adjoint part
    [ U , D ] = eig( ( Ham + Ham' )/2 );
    U = fftshift(U,1);
    % get Unitary Flow via Eigendecomposition
    Flow = @(t) U * diag(exp(-2*pi*1j*t*(1:length(H)))) * U';
end
