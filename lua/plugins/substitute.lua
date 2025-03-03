return {
    'gbprod/substitute.nvim',
    opts = {},
    keys = {
        {'s', function() require('substitute').operator() end, desc = 'Substitute'},
        {'ss', function() require('substitute').line() end, desc = 'Substitute line'},
        {'S', function() require('substitute').eol() end, desc = 'Substitute to end of line'},
        {'s', function() require('substitute').visual() end, mode = 'x', desc = 'Substitute visual'},
    },
}

