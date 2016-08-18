function httpless
  http --pretty=all --print=hb "$argv" | less -dMFRX;
end
