---
title: Overview
page_title: Overview
description: Learn about Progress security practices, vulnerability reporting options, and security guidelines for Telerik Document Processing libraries.
slug: security-overview
tags: security, telerik, document, processing, vulnerability, compliance, practices, guidelines
published: True
position: 1
---

# Security

Security is critical for every software product. Progress prioritizes customer security and builds products with a strong foundation to safeguard data and operations. The Progress team identifies and addresses potential vulnerabilities to provide the highest level of protection and confidence in the products.

## Purpose of This Article

This article covers common security-related questions, best practices, and the tools and processes that Progress uses to ensure product security. It also outlines how customers and security researchers can report security issues, including the processes to mitigate risks. You can find guidance for submitting security reports through technical support or Bugcrowd.

## Reporting Security Vulnerabilities

Whether you are a customer encountering an issue or a security researcher, Progress has processes to ensure a swift response and evaluation. The following sections describe the steps for Progress customers and security researchers to report potential security vulnerabilities:

### For Progress Customers

Progress works diligently to identify and fix security vulnerabilities in its products. If you believe you have identified a security issue, contact Technical Support for an evaluation. This allows the team to document the issue and have the engineering teams confirm and address it as needed. You can submit reports through the support center:

* [Technical Support](https://www.telerik.com/account/support-center)
* [Contact Us](https://www.telerik.com/account/support-center/contact-us/technical-support)

### For Security Researchers

Progress values the contributions of security researchers and ethical hackers. If a researcher identifies a potential vulnerability, they can submit it through the [Bugcrowd](https://bugcrowd.com/engagements/devtools-vdp) platform. Progress aims to meet the following response times:

| Type of Response | SLO (in business days) |
|------------------|------------------------|
| First Response    | 7 days                 |
| Time to Triage    | 10 days                |
| Time to Resolution| Depends on severity    |

For more information, visit:

* [Bugcrowd Vulnerability Disclosure Program](https://bugcrowd.com/engagements/devtools-vdp)
* [Progress Trust Center](https://www.progress.com/trust-center)
* [Vulnerability Reporting Policy](https://www.progress.com/trust-center/vulnerability-reporting-policy)

## Risk Mitigation

The dedicated security team, composed of experienced developers and security experts ("Security Champions"), reviews all web, desktop, and mobile product technologies for potential vulnerabilities. These vulnerabilities may be internally identified, reported by third-party tools, or flagged externally.

Progress actively manages the following strategies to mitigate risks:

### Prevention

The primary goal is to prevent security issues before product delivery. The team uses the following prevention techniques:

* **Internal Logging**: Every potential security issue is logged, researched, tested, and verified. Issues deemed valid are assessed with a CVSS score, and critical issues are prioritized.
* **Third-Party Static Analysis Testing**: Progress uses leading security scanning tools to scan for vulnerabilities in the software code. Regular scans are conducted, and results are reviewed to address vulnerabilities and mitigate false positives.

## Third-Party Dependencies Handling

Progress uses leading commercial tools to automatically monitor and update third-party dependencies in the Telerik and Kendo GitHub projects. This keeps the dependencies secure and up-to-date. Alerts are enabled for all GitHub-hosted products, and the identified vulnerable dependencies are addressed by the repository code owners and security champions.

> The definition of "Done" includes successful builds that are scanned with top security scanning tools, and the resolution of any security alerts.

## OWASP Top 10 Alignment

The team closely monitors the [OWASP Top 10](https://owasp.org/www-project-top-ten/) list of security risks and aligns security practices with these industry-leading standards. Regular updates ensure that the products address evolving security threats and vulnerabilities.

## Redistributing Telerik Document Processing

Telerik [Document Processing]({%slug introduction%}) is part of several Telerik bundles and is licensed under the conditions with which you have obtained the product. In the [Redistributing Telerik Document Processing]({%slug installation-deploying-telerik-document-processing%}) article, you can find technical guidelines for protecting the Telerik Document Processing binaries when you redistribute them with your integrated product.

For more detailed answers to common security-related questions, refer to the [Security FAQ page]({%slug security-faq%}).