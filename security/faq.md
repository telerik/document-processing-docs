---
title: FAQ
page_title: FAQ
description: "Find answers to common questions about Telerik's Document Processing best security practices and guidelines"
slug: security-faq
tags: security, faq, telerik, vulnerability, document, processing, compliance, guidelines
published: True
position: 2
---

# Frequently Asked Questions (FAQ)

In this article, you can find essential security information and resources related to the [Document Processing Libraries]({%slug introduction%}) and Telerik UI. Whether you need to report vulnerabilities, manage third-party dependencies, or understand how security fixes are delivered, this FAQ provides clear guidance on the security processes. Explore best practices and learn how Progress maintains the highest level of security for its products, from vulnerability reporting to compliance with industry standards.

## How can I submit a security vulnerability report?

If you have identified a potential security vulnerability in a Telerik or Kendo UI product, you can report it through the following channels:

* **For Progress Customers**: Submit a security report by opening a support ticket through the [Technical Support Center](https://www.telerik.com/account/support-center). Provide detailed information, including the steps to reproduce the issue and any relevant reports or screenshots.

* **For Security Researchers**: Ethical hackers and security researchers can report vulnerabilities through the [Bugcrowd Vulnerability Disclosure Program](https://bugcrowd.com/engagements/whatsupgold-vdp). This platform ensures that security issues are addressed efficiently and transparently.

The team reviews the report and follows up in line with the security processes, making every effort to resolve confirmed vulnerabilities in a timely manner.

---

## What if clients are using a third-party scanning tool and want an assessment?

Clients can open a support ticket through the [Technical Support Center](https://www.telerik.com/account/support-center) for the respective product and submit detailed information, including scan reports (PDF/Word/Excel/Screenshot) triggered against a non-minified version of the scripts and steps to reproduce or evidence of the issue. The team reviews and responds accordingly. Progress treats Security Vulnerability reports with **highest priority** and engages with internal Security Champions for revisions.

> Run the scan against the latest product version, as the problem may have already been resolved.

---

## What is Progress's policy on handling third-party dependencies?

Progress uses leading commercial tools to automatically monitor and update third-party dependencies in the Telerik and Kendo GitHub projects. Alerts are set up for all GitHub-hosted products, and any identified vulnerable dependencies are addressed by the repository owners and the dedicated security team.

The definition of "done" includes successful builds that are scanned with top security scanning tools, and the resolution of any security alerts.

---

## Is security integrated into the CI pipeline?

Yes. For example, the CI builds are integrated with some of the leading security scanning tools to ensure that new code commits do not introduce vulnerabilities or insecure code.

---

## How does Progress prioritize security reports?

Progress prioritizes security vulnerability reports with the highest urgency. When an inquiry or vulnerability report is received, the process begins with analyzing the issue to determine whether it is a false positive or a valid concern. If the report is confirmed as valid, the team assesses its severity with the CVSS (Common Vulnerability Scoring System) and promptly releases a patch based on the severity level.

---

## How are security fixes shipped?

Security fixes are typically included in the next product release. Similar to the bugfixes policy, Progress maintains and commits to support the latest version of the product. If you want to benefit from a security fix, you need to upgrade to the version where the fix exists.

---

## How are customers notified about security fixes?

Once a vulnerability is fixed, a patched version of the product is released. Depending on the severity of the issue, customers may be notified through CVE publications, email, blog posts, KB articles, or Release Notes for the specific product.

---

## Does Progress/Telerik have any security certifications or accreditations, such as SOC 2 or other industry-recognized standards?

Yes. Progress and DevTools products complete annual SOC 2 compliance, which validates the commitment to security, confidentiality, and privacy. You can find more information about compliance on the [Progress Trust Center](https://www.progress.com/trust-center). Progress aligns its security practices with industry-leading frameworks to maintain and continually improve high security standards.