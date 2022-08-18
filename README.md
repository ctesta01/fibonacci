# Intro to Git and GitHub with R and RStudio 

This repository contains some basic code that implements the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number) in R.

The Fibonacci numbers start with 0, then 1, and are subsequently defined 
where the Nth Fibonacci number is the sum of the N-1 and N-2 Fibonacci numbers.

This readme provides a narrative account of the git commands, processes, and scenario 
we worked through to give an example of how a beginner might start to use git in 
their own work. The choice of the Fibonacci numbers as an example to work with is 
arbitrary and just serves for an example of a concept that can be coded up and 
iterated on, all the while using git and GitHub. 

### Repository Setup

You'll want to create a new project for your work in RStudio and a new repository 
on GitHub. Check the "Create a git repository" checkbox while making your new RStudio project.

![Screenshot of the new RStudio project window with the "Create a git repository" checkbox checked](new_rstudio_project.png)

Once you've created a new repository on GitHub, you'll see a screen like this: 

![Screenshot of the new GitHub repository information](figures/new_github_repo.png)

You'll want to copy and paste those commands from the "push an existing repository from the command line"
into the terminal.  If you use the terminal builtin to RStudio, you should already be in the 
directory of your project, but if you use a separate terminal app, you'll need to make sure you're in 
the project directory. 

```sh
git remote add origin git@github.com:ctesta01/fibonacciGitDemo.git
git branch -M main
git push -u origin main
```

### Initial Commit 

One of the first things we recommend adding to your project is a README.md file.
This file will be the public face of your project and what most people see first
when looking at your project. 

You might take a look at these articles *[How to Write a Good README](https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/)*
and *[Make a README](https://www.makeareadme.com/)*,
or you might take a look at some well-known software projects' READMEs to get a sense
of what an important role the README file can play: 

  - https://github.com/cran/dplyr/blob/master/README.md 
  - https://github.com/cran/ggplot2/blob/master/README.md 

Since the README file is in a file format called markdown, it's helpful to get 
familiar with the markdown syntax.  You can learn more about markdown here: 
https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax

Once you've started a REAMDE, add it to the staging area, write a commit message,
and push it. 

```sh
git add README.md
git commit -m "Add a readme file"
git push --set-upstream origin main 
```

### Adjusting your .gitignore

The .gitignore file tells git which files it should ignore and not track changes
for -- this can be useful to keep sensitive data off of GitHub, to prevent
irrelevant files from getting uploaded and confusing anybody, and to keep large
files from being version controlled since git works best for handling text-based
files rather than binary or compressed data.

If you're on macOS, you'll probably want to add the .DS_Store file to your
.gitignore file as this is just a macOS file that is created by Finder in every
folder to hold the user's folder view preferences and not relevant to your code.

Typically a .gitignore for an R related project should include at least the following

```
.Rproj.user
.Rhistory
.RData
.Ruserdata
```

### Subsequent Commits

As incremental progress is made on your code, you'll want to use git in a few 
different ways. 

One way is to just check what the differences in the files you're working on 
are.  For example, if you've made updates to the fibonacci.R file, you might 
run `git diff fibonacci.R` or check the diff using the button in the git panel 
of RStudio. 

Once you're happy with the changes that you've made, you can add them to the 
staging area or index with `git add fibonacci.R`.  After doing so, you can write a 
commit message to go with your work.  E.g. `git commit -m "Adding a new recursive method"`.
Now you can push you work with `git push`. 

### Making A Branch and a Pull Request 

To create a branch where you can test out some revisions, you will want to 
run `git checkout -b branchName` or in our case `git checkout -b fix-DependenciesGoAtTheTop`.

Once you've made your changes, committed them, and push them to GitHub using `git push origin fix-DependenciesGoAtTheTop`, you can go online to GitHub to create a Pull Request to the 
`main` branch inviting the developer to accept your changes.  As long as your branch has 
all of the recent commits from the `main` branch, GitHub will tell you that the changes can 
be automatically merged.  In general, it's good courtesy to make sure your pull requests 
can be automatically merged if at all possible when asking others to incorporate your code.