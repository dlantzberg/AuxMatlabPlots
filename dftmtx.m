function F = dftmtx ( sz )
%DFTMTX gives the DiscreteFourierMatrix of size sz[0] x sz[1] 
  if( length(sz) >  2 )
    return;
  end

  F = exp(-2*pi*1j*(0:sz(1)-1)'*(0:sz(end)-1)/sz(end));
end
