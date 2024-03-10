function fish_user_key_bindings
  bind \cr 'builtin history merge; peco_select_history'
  bind \e\[A 'history merge; up-or-search'
end
