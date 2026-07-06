{{"

If the installation instructions have become disconnected with the current lesson material, you need to get changes from this repository into your workshop page repository.
Please follow the steps below:

1. Add the workshop-template repository as upstream:
    ```bash
    $ git remote add upstream https://github.com/carpentries/workshop-template.git
    ```

2. Fetch the data from upstream repository (also know as the workshop-template
    repository):
    ```bash
    $ git pull upstream
    ```

3. Address possible merge conflicts, and
    ```bash
    $ git commit -a
    ```

4. Push the changes to your repository on GitHub:
    ```bash
    $ git push origin gh-pages
    ```
    
" | markdownify }}