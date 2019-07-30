Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 921807AE4E
	for <lists+selinux@lfdr.de>; Tue, 30 Jul 2019 18:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfG3Qpt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 30 Jul 2019 12:45:49 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:33189 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG3Qpt (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 30 Jul 2019 12:45:49 -0400
Received: by mail-io1-f53.google.com with SMTP id z3so10794286iog.0
        for <selinux@vger.kernel.org>; Tue, 30 Jul 2019 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LcI6MVsnhrIb8AdfZ1LbEBtkMTVSE3On48QbYyusHqw=;
        b=rn1MyY07s4LqEHH7f5BFHQ3Di7FTpY5PnleeUsjsmCkowJfcxTh/H3vfzcnS71s53S
         huBUA20SaUXvmqg7C1Wf6P/v8+jK80D6QIYJAf2bda5Wbn7RqIy/ZLWAZ4/7/+K16BsK
         z2cKePftQFOhgqP4FKZWFGL+73bEZu5IOIaW4/A0s1Pon5bS7qYDon2iJFRBmb4NaMMe
         SoDu37xCiBSfwe1WaH9DH6Ct2bbRmuG+/SbzLhJSC1ck1pvkiaWDHNkezlFDO3pe0T+r
         6uYTdWqXO5Cb13WViS8HYW6rPeYnlamlr4x2BOguaDjSE2BgOxbDwjWxk2HlQbMd8/lc
         XzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LcI6MVsnhrIb8AdfZ1LbEBtkMTVSE3On48QbYyusHqw=;
        b=WD9jLl5obTGLSvdjEs3bFJDi8LjmUEXwgFqGJXH5Vmn2pEN64CLuUphDRlXQBlLBe2
         09BUCqA+gYQlefSAkVj7oIf/eWmQ3sH6oZcUCcuShjYSiTz7oG84GVnsyToBOJ6jf545
         7iuUvIRHDVMTBMoWjesHjyxuifq957wRuLgzSiuxtnJX91UHymZ4adXyWst1EI5DJyyj
         rqcTKXJQWE2VZ45whoJvkUd2QA+iXVXgTzv+hpYC90yyT/+m8uNYLcaMOWY7Ay8I17/W
         sCg4pPztETDyvycm/fwLT8CwgB9Nl2cdi+JhpxuvbTR6z1eYyXmtAqdqQA2iFCQdFEuC
         JKSA==
X-Gm-Message-State: APjAAAWii5h2sk0BKCoggRK6C+2qcFsfVeFcjjithtoHusK3is6q6gAS
        BxbelIGrzdtngM/IIc1Ekk6Jz3Bhk/xWOfZvd+wthiZ2
X-Google-Smtp-Source: APXvYqzHLoS2yLMy5ok7HMcCEI9zd2X8kjldmqdQ+gyc94CSx9ojLaavSOelUyYlaB6VdqUGKZsGaSBE9nIefFHDV9M=
X-Received: by 2002:a6b:b843:: with SMTP id i64mr113062822iof.81.1564505148410;
 Tue, 30 Jul 2019 09:45:48 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Kralevich <nnk@google.com>
Date:   Tue, 30 Jul 2019 09:45:37 -0700
Message-ID: <CAFJ0LnFZcJRQdZzMYXvqodk=H45wEwCJt5evWa0YkM+P0pDtNA@mail.gmail.com>
Subject: userfaultfd SELinux support?
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In glancing over the SELinux code, it appears userfaultfd file
descriptors are not managed by SELinux. Am I perhaps misreading the
kernel code and this is supported? Or is this a known issue? If it's a
known issue, has there been any attempt to add SELinux userfaultfd
file descriptor support?

Thanks,
-- Nick

-- 
Nick Kralevich | nnk@google.com
