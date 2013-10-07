from percol.key import SPECIAL_KEYS
from percol.finder import FinderMultiQueryRegex

# Prompt
percol.view.PROMPT  = ur"<bold><yellow>Q</yellow></bold>: %q"
percol.view.__class__.PROMPT = property(
    lambda self:
    ur"<bold><cyan>Q</cyan></bold> [a]: %q" if percol.model.finder.case_insensitive
    else ur"<bold><yellow>Q</yellow></bold> [A]: %q"
)

percol.view.prompt_replacees["F"] = lambda self, **args: self.model.finder.get_name()
percol.view.RPROMPT = ur"(%F) [%i/%I]"

# Mac で delete (backspace) が効くようにする
SPECIAL_KEYS.update({
    127: '<backspace>'
})
# Emacs like
percol.import_keymap({
    "C-h" : lambda percol: percol.command.delete_backward_char(),
    "C-d" : lambda percol: percol.command.delete_forward_char(),
    "C-k" : lambda percol: percol.command.kill_end_of_line(),
    "C-y" : lambda percol: percol.command.yank(),
    "C-a" : lambda percol: percol.command.beginning_of_line(),
    "C-e" : lambda percol: percol.command.end_of_line(),
    "C-b" : lambda percol: percol.command.backward_char(),
    "C-f" : lambda percol: percol.command.forward_char(),
    "C-n" : lambda percol: percol.command.select_next(),
    "C-p" : lambda percol: percol.command.select_previous(),
    "C-v" : lambda percol: percol.command.select_next_page(),
    "M-v" : lambda percol: percol.command.select_previous_page(),
    "M-<" : lambda percol: percol.command.select_top(),
    "M->" : lambda percol: percol.command.select_bottom(),
    "C-m" : lambda percol: percol.finish(),
    "C-j" : lambda percol: percol.finish(),
    "C-g" : lambda percol: percol.cancel(),
    "M-c" : lambda percol: percol.command.toggle_case_sensitive(),
    "M-r" : lambda percol: percol.command.toggle_finder(FinderMultiQueryRegex),
})
