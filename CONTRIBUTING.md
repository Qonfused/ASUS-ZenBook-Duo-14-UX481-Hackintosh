# Contributing Guide

Welcome! Thank you for your interest in contributing to this project. There are many ways to contribute, including submitting bug reports, improving documentation, submitting feature requests, reviewing new submissions, or contributing code that can be incorporated into the project.

This document describes this project's development process. Following these guidelines shows that you respect the time and effort of those managing this project. In return, you will be shown respect in addressing your issue, reviewing your changes, and incorporating your contributions.

> **Note** Please, don't use the issue tracker for support questions. Instead use: [Github Discussions](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/discussions).

**Table of Contents:**

1. [Important Resources](#important-resources)
2. [Questions](#questions)
3. [Feature Requests](#feature-requests)
4. [Improving Documentation](#improving-documentation)
5. [Reporting Bugs](#reporting-bugs)
6. [Contributing Code](#contributing-code)
	1. [Getting Started](#getting-started)
	1. [Finding an Issue!](#finding-an-issue)
	1. [Development Process](#development-process)
	1. [Building the Project](#building-the-project)
	1. [Testing](#testing)
	1. [Style Guidelines](#style-guidelines)
	1. [Code Formatting Rules](#code-formatting)
	1. [Whitespace Cleanup](#whitespace-cleanup)
1. [Pull Request Guidelines](#pull-request-process)
	1. [Review Process](#review-process)
	1. [Addressing Feedback](#addressing-feedback)


## Important Resources

> TODO

## Questions

If you have a question or need help, please open a [new discussion](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/discussions/new).

## Feature Requests

Please create a new GitHub issue for any major changes and enhancements that you wish to make. Please provide the feature you would like to see, why you need it, and how it will work. Discuss your ideas transparently and get community feedback before proceeding.

Major Changes that you wish to contribute to the project should be discussed first in an GitHub issue that clearly outlines the changes and benefits of the feature.

Small Changes can directly be crafted and submitted to the GitHub Repository as a Pull Request. See the section about Pull Request Submission Guidelines, and for detailed information the core development documentation.

## Reporting Bugs

> **Note** If you find a security vulnerability, do NOT open an issue. Please refer to our [Security Policy](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/security/policy) for reporting security vulnerabilities.**

Before you submit your issue, please [search the issue archive][0] - maybe your question or issue has already been identified or addressed.

If you find a bug in the source code, you can help us by [submitting an issue to our GitHub issue tracker][0]. This project provides a bug issue template to help you kickstart your issue.

Even better, you can submit a new Pull Request with a fix.

## Improving Documentation

Should you have a suggestion for the documentation, you can open an issue and outline the problem or improvement you have - however, creating the doc fix yourself is much better!

If you want to help improve the docs, it's a good idea to let others know what you're working on to minimize duplication of effort. Create a new issue (or comment on a related existing one) to let others know what you're working on. If you're making a small change (typo, phrasing) don't worry about filing an issue first.

For large fixes, please build and test the documentation before submitting the PR to be sure you haven't accidentally introduced any layout or formatting issues.

```
TODO: Instructions on building and viewing documentation
```

## Contributing Code

```
TODO: Describe dependencies, development, testing, style rules, formatting rules, etc.
```

Working on your first open source project or pull request? Here are some helpful tutorials:

* [How to Contribute to an Open Source Project on GitHub][https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github]
* [Make a Pull Request][http://makeapullrequest.com/]
* [First Timers Only][http://www.firsttimersonly.com]

### Getting Started

```
TODO: Instructions on installing dev environment + dependencies.
```

You will need to fork the main repository to work on your changes. Simply navigate to our GitHub page and click the "Fork" button at the top. Once you've forked the repository, you can clone your new repository and start making edits.

In git it is best to isolate each topic or feature into a “topic branch”. While individual commits allow you control over how small individual changes are made to the code, branches are a great way to group a set of commits all related to one feature together, or to isolate different efforts when you might be working on multiple topics at the same time.

While it takes some experience to get the right feel about how to break up commits, a topic branch should be limited in scope to a single issue.

```
# Checkout the master branch - you want your new branch to come from master
git checkout master

# Create a new branch named newfeature (give your branch its own simple informative name)
git branch newfeature

# Switch to your new branch
git checkout newfeature
```

For more information on the GitHub fork and pull-request processes, [please see this helpful guide][https://gist.github.com/Chaser324/ce0505fbed06b947d962].

### Finding an Issue

The list of outstanding feature requests and bugs can be found on our on our [GitHub issue tracker][0]. Pick an unassigned issue that you think you can accomplish and add a comment that you are attempting to do it.

Regarding issue labels:

- `good first issue` labeled issues are deemed to be good low-hanging fruit for newcomers to the project.
- `help-wanted` labeled issues may be more difficult and may include new feature development.
- `type:documentation` labeled issues must only touch content in the `docs` folder.

### Development Process

This project follows the [git flow](http://nvie.com/posts/a-successful-git-branching-model/) branching model of development.

The `origin/master` branch should always reflect a *production-ready* state, while the `origin/development` branch is an *integration branch* reflecting the latest development changes.

> TODO

### Building the Project

> TODO

### Testing

> TODO

### Style Guidelines

> TODO

### Code Formatting

> TODO

### Git Commit Guidelines

> TODO

## Pull Request Process

This project doesn't enforce any labeling conventions for pull requests, but it's desired to use a short and concise title that addresses the big picture of your changes.

When you are ready to generate a pull request, either for preliminary review, or for consideration of merging into the project you must first push your local topic branch back up to GitHub:

```
git push origin newfeature
```

Once you've committed and pushed all of your changes to GitHub, go to the page for your fork on GitHub, select your development branch, and click the pull request button. If you need to make any adjustments to your pull request, just push the updates to your branch. Your pull request will automatically track the changes on your development branch and update.

1. Ensure any install or build dependencies are removed before the end of the layer when doing a
   build.
2. Update the README.md with details of changes to the interface, this includes new environment
   variables, exposed ports, useful file locations and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this
   Pull Request would represent. The versioning scheme we use is [SemVer](http://semver.org/).
4. You may merge the Pull Request in once you have the sign-off of two other developers, or if you
   do not have permission to do that, you may request the second reviewer to merge it for you.

### Review Process

Except for critical, urgent or very small fixes, we try to leave pull requests open for most of the day or overnight if something comes in late in the day, so that multiple people have the chance to review/comment.  Anyone who reviews a pull request should leave a note to let others know that someone has looked at it.

For larger commits, we like to have a +1 from someone else and/or from other contributor(s) before proceeding.  Please note if you reviewed the code or tested locally -- a +1 by itself will typically be interpreted as thinking its a good idea, but not having reviewed in detail.

### Addressing Feedback

Once a PR has been submitted, your changes will be reviewed and constructive feedback may be provided. Feedback isn't meant as an attack, but to help make sure the highest-quality code makes it into our project. Changes will be approved once required feedback has been addressed.

If a maintainer asks you to "rebase" your PR, they're saying that a lot of code has changed, and that you need to update your fork so it's easier to merge.

To update your forked repository, follow these steps:

```
# Fetch upstream master and merge with your repo's master branch
git fetch upstream
git checkout master
git merge upstream/master

# If there were any new commits, rebase your development branch
git checkout newfeature
git rebase master
```

If too much code has changed for git to automatically apply your branches changes to the new master, you will need to manually resolve the merge conflicts yourself.

Once your new branch has no conflicts and works correctly, you can override your old branch using this command:

```
git push -f
```

Note that this will overwrite the old branch on the server, so make sure you are happy with your changes first!

[0]: https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/issues
