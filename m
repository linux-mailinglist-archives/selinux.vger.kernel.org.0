Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6049D190E64
	for <lists+selinux@lfdr.de>; Tue, 24 Mar 2020 14:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgCXNLz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Mar 2020 09:11:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45416 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbgCXNLz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Mar 2020 09:11:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id c9so6745133otl.12
        for <selinux@vger.kernel.org>; Tue, 24 Mar 2020 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQfkfKKbWSOH/N5MCf+BaTj5rl8YYm3BcO9Yjkz+B+s=;
        b=lzxldDy0hUqM/hFQh17DBNZGn7h2rN0niYCXNgoFxxnasNLyzcZAiobGSKKLDo5XQF
         q2CdwdSuvdGzdliM+2ulF5AUaYPRyjnq9zfpdebouKYnOzDX259XzwijZUtg+kVngWnP
         yxqVxJAJXSpLTzlrjtyox0hPFPr1212vVOKOUmdsXdqjPISGFW3VXvvRjFDmT89duDHi
         k/LYtifgsY/AtUk4iqHen0qQgJr5I1vCgoV9rUY4PHwolZj8IvTVHLf/kH1cJoiKpDwk
         Iks3Xo0fE5XmJxOzQNpeuG2ji3gqHVFC0Oa6xLx3EBcc6m9bbQIg5aYJXuf3vtkaeGoL
         JfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQfkfKKbWSOH/N5MCf+BaTj5rl8YYm3BcO9Yjkz+B+s=;
        b=VankoXlTvt2nNOQ+K1G5AIVgZbz0sFGCsB3crsQRAjFNxoJ5w/W98k306DIgd1pr4E
         f1Sr9FA4wj9plZEZ1uM7KpAvIutaa0dEwcaFqkobDZiT/5tltsT88dn6EQ7+0FDMbeyF
         PObYVwWWJQQyXWg3varmmrDk/zVxe8285tHNQ4M5iS2bsds89nXuJlapltkDfvUPulUb
         82ldvNCcFtvpMtaMHHES7bWuTwmpV78dqCYQqsKOxM1gNm3NypiT3JmT6xgsndQ2EHNT
         2/l3207c9DpvXR5/GQN7ZCCQEuwFatbPjKUBIgTI7UPidIAyiOvh6fZE0IeEb7FhvWOI
         zkrQ==
X-Gm-Message-State: ANhLgQ0g/wEqDnZ9S9zzhBjeqnXfJFswTHuCM/NPOj9OyLQfn9fipP+G
        C8RmTUCSVgzvKJyuCMskE6HCPQkMIjG1lu21kp4=
X-Google-Smtp-Source: ADFU+vt8CB12UmX6tOdXtDuNM46JQFKRG927NCDRqNJC/z7xARzZnP308BB8GuwFnqZiHDWfzzAwVce8VxfPaBRR/vs=
X-Received: by 2002:a9d:7dc4:: with SMTP id k4mr20663934otn.89.1585055513089;
 Tue, 24 Mar 2020 06:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200323175037.19170-1-william.c.roberts@intel.com> <20200323175037.19170-5-william.c.roberts@intel.com>
In-Reply-To: <20200323175037.19170-5-william.c.roberts@intel.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 24 Mar 2020 09:13:00 -0400
Message-ID: <CAEjxPJ71--8A6Edm1FN+RSfCp-dCbtVHnqC8Kr9hgZ=qs=9otA@mail.gmail.com>
Subject: Re: [PATCH 4/4] libsemanage: cleanup linker map file
To:     William Roberts <bill.c.roberts@gmail.com>
Cc:     Ulrich Drepper <drepper@redhat.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Petr Lautrbach <plautrba@redhat.com>,
        SElinux list <selinux@vger.kernel.org>,
        William Roberts <william.c.roberts@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Mar 23, 2020 at 1:50 PM <bill.c.roberts@gmail.com> wrote:
>
> From: William Roberts <william.c.roberts@intel.com>
>
> The linker map file had inconsistent style in the 1_1 versions.
> Drop the mixed tabs and spaces and use the consistent spacing indent
> of two spaces.
>
> Signed-off-by: William Roberts <william.c.roberts@intel.com>

For all four,
Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
