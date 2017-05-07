# What is Bcfg2 ?

Bcfg2 helps system administrators produce a consistent, reproducible, and verifiable description of their environment, and offers visualization and reporting tools to aid in day-to-day administrative tasks. It is the fifth generation of configuration management tools developed in the Mathematics and Computer Science Division of Argonne National Laboratory.

It is based on an operational model in which the specification can be used to validate and optionally change the state of clients, but in a feature unique to Bcfg2 the client's response to the specification can also be used to assess the completeness of the specification. Using this feature, Bcfg2 provides an objective measure of how good a job an administrator has done in specifying the configuration of client systems. Bcfg2 is therefore built to help administrators construct an accurate, comprehensive specification.

Bcfg2 has been designed from the ground up to support gentle reconciliation between the specification and current client states. It is designed to gracefully cope with manual system modifications.

Finally, due to the rapid pace of updates on modern networks, client systems are constantly changing; if required in your environment, Bcfg2 can enable the construction of complex change management and deployment strategies.

Read the documentation and more at http://bcfg2.org/


Design Principles
=================

   * Have a dead simple setup process and a minimal learning curve
   * Manage machines very quickly and in parallel
   * Describe infrastructure in a language that is both machine and human friendly
   * Focus on security and easy auditability/review/rewriting of content
   * Manage new remote machines instantly, without bootstrapping any software
   * Be the easiest IT automation system to use, ever.


# How to use this image

## hosting some static config

```console
$ docker run --name some-bcfg2 -v /some/content:/var/lib/bcfg2 -v /some/content:/etc/bcfg2 -p 6789:6789 -d bcfg2-server
```

- /etc/bcfg2 : Configuration directory
- /var/lib/bcfg2 : Template repository

## exposing the port

```console
$ docker run --name some-bcfg2 -v /some/content:/var/lib/bcfg2 -v /some/content:/etc/bcfg2 -p 6789:6789 -d bcfg2-server
```
