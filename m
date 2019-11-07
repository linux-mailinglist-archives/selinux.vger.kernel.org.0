Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A73F35C2
	for <lists+selinux@lfdr.de>; Thu,  7 Nov 2019 18:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfKGRcn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 7 Nov 2019 12:32:43 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:36595 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfKGRcm (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 7 Nov 2019 12:32:42 -0500
Received: by mail-lj1-f181.google.com with SMTP id k15so3221659lja.3
        for <selinux@vger.kernel.org>; Thu, 07 Nov 2019 09:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=59vW0855dYUSx1FlGjwtM/g/lH825vqjL1GF0q9vVSk=;
        b=ccD+5kc6OBOMuZLX5+u+JMTp6uUCMgkAhKSkmX0Drf4fRouhtoZt07PFu9YhlaqKuv
         2SVAuMqUmOXtwJ7dZRtr9tEIMKuY0uQtKuThaK4Z5eXL/YzpzZnqLwf9GxZUX7g2Mm01
         f7q6o7xQ6RhRs0G7QdofT9U9p+bb6dImn3IV8CTcTJjxW9jbnEJhdwLX8D4Np+X/o5ZX
         me9svqLvwI+bwoTfkFrtVjhtgzeliRJUBDPUH5WtIjMhGL/z2wvyKkYZn3M+X83XP5xc
         ySR/ixnXikXT6dm1HsjEah5yI05qJyiHiTk1IWEv99KEXBvsGnbztKKzOyy2QL+ef/Mh
         PGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=59vW0855dYUSx1FlGjwtM/g/lH825vqjL1GF0q9vVSk=;
        b=lmAIUR5YyF9P4I3nEsG4vulyC5sxw9wXGPeenEoX9rlhvxl5ot9IoFf7urRMNRtmey
         SAGsMRdtTUPRrmOF/57XUFV2MoLCvTs8kIIlbeN2oYbkLcph11ix2Ne32AJW67A7hemO
         522mV1UJQp9qy4IkrT1DkKs4/RKkKUnBF+ieuTH5XrZQJ1RMRqOqq2qpLPvUKIdYtfA6
         cze4/3ZAewg8DBAKJIW8Per1fZvM+MnsVTubKPWLe/cRn1+/sjvSQBqvJ7RREaaIJ5c8
         H39UFar06S91jtDnq8Uja+4V8bCdHXXIbtQuIkHpcOjm3TvWgM8KuqQ/BC+R1ct9w6A6
         UOeA==
X-Gm-Message-State: APjAAAWs8IqbKK7rfOYYGogi0U2MLUasfVVdk58AjpmcShx5LLO4ikHv
        tCdMneeekSk9bQj3JLFyzQiTwcTIimuce/UyuJGi+J/kkw==
X-Google-Smtp-Source: APXvYqz0w0rNo668zaXRdi1cpnJdrujwJbvxmPq4ohydSOc45GptYr5EgXwOe9/VXF2OJcLWge1I6Sj/2Nyv1O4XEV4=
X-Received: by 2002:a2e:970e:: with SMTP id r14mr3198287lji.57.1573147958985;
 Thu, 07 Nov 2019 09:32:38 -0800 (PST)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 7 Nov 2019 12:32:29 -0500
Message-ID: <CAHC9VhSppLbPb=-OS=5e=o=jUZntS05RZ_tvqJU4DQ9raknb-w@mail.gmail.com>
Subject: Welcome Ondrej as a maintainer to the selinux-testsuite
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello all,

In an effort to help things run smoothly and ensure better coverage,
Stephen and I asked Ondrej Mosnacek to help maintain the
selinux-testsuite and Ondrej graciously accepted.  Thanks Ondrej!

-- 
paul moore
www.paul-moore.com
