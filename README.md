Config for NVIM
===============
This is my new Vim config which I will use for neovim

We are using Vundle to manage the plugins,
so you might need to run this in terminal:

```bash
vim +PluginInstall +qall
```


For Syntastic
-------------
 * Python: install one of the following:

        pip install flake8
        pip install pylint

 * JavaScript: install eslint

        npm install -g eslint
        eslint --init

    * When you initialize eslint, it is best to customise it for each project.
    * You probably need the following ```rules``` to work well with JSX and React:

             "react/jsx-uses-react": "error",
             "react/jsx-uses-vars": "error",

    * Also read https://www.npmjs.com/package/eslint-plugin-react for additional configs

 * Run ```:help syntastic-checkers``` in vim for more information about supported checkers
