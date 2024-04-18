{ svlib, ... }:
{
  plugins.mkdnflow = {
    enable = true;
    links = {
      conceal = true;
    };
    extraOptions = {
      modules = {
        maps = {
        MkdnNextLink = false;
        MkdnPrevLink = false;
        MkdnGoBack = false;
        MkdnGoForward = false;
        MkdnCreateLink = false;
        MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>p'}, -- see MkdnEnter;
        MkdnDestroyLink = false;
        MkdnTagSpan = false;
        MkdnMoveSource = {'n', '<F2>'};
        MkdnYankAnchorLink = {'n', 'yaa'};
        MkdnYankFileAnchorLink = {'n', 'yfa'};
        MkdnIncreaseHeading = {'n', '+'};
        MkdnDecreaseHeading = {'n', '-'};
        MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'};
        MkdnNewListItem = false;
        MkdnNewListItemBelowInsert = {'n', 'o'};
        MkdnNewListItemAboveInsert = {'n', 'O'};
        MkdnExtendList = false;
        MkdnUpdateNumbering = {'n', '<leader>nn'};
        MkdnTableNextCell = {'i', '<Tab>'};
        MkdnTablePrevCell = {'i', '<S-Tab>'};
        MkdnTableNextRow = false;
        MkdnTablePrevRow = {'i', '<M-CR>'};
        MkdnTableNewRowBelow = {'n', '<leader>ir'};
        MkdnTableNewRowAbove = {'n', '<leader>iR'};
        MkdnTableNewColAfter = {'n', '<leader>ic'};
        MkdnTableNewColBefore = {'n', '<leader>iC'};
        MkdnFoldSection = {'n', '<leader>f'};
        MkdnUnfoldSection = {'n', '<leader>F'};
        };
        cmp = true;
        yaml = true;
      };
      links = {
        conceal = true;
      };
    };
  };
}
