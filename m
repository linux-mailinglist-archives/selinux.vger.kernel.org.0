Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C412175EA9
	for <lists+selinux@lfdr.de>; Mon,  2 Mar 2020 16:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgCBPou (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 2 Mar 2020 10:44:50 -0500
Received: from mail-vk1-f176.google.com ([209.85.221.176]:38511 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgCBPou (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 2 Mar 2020 10:44:50 -0500
Received: by mail-vk1-f176.google.com with SMTP id w4so3068257vkd.5
        for <selinux@vger.kernel.org>; Mon, 02 Mar 2020 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Om8Wg/dL9mkRkfwj2bp8q2WNzWHeI+xkLIys76pnpqA=;
        b=nzwHg1TiL7Ih4ev0rDKAVvpR+mcpCTpPa9VjxL3ZwYPvCGYKF1teAImLOJNssM3XA4
         ZUpW1KxRYg6hes3o1JEK3oVg+gjppytAbflbJGTc2mjw7+jQBmiiQPf8zcnKCHLZSOdw
         23EgA7DFpgHM2NUY0PppaNnb71+AMrF1bRn/kXewgcK/OJWtuNMybK4SSSVTWBlXIde0
         1BXmBSTJpJtS9EHl/DXML15lJPHVHK2CiI6UZAR3B3fo22JsALwkYB4LmwB1RmP4C0+P
         XvuDk/13YbIrd8MJzCfTu5PoioKRzO+kLNHWF2hrOqoO58su/XZfPUPmnqOzuQyUk9qy
         h3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Om8Wg/dL9mkRkfwj2bp8q2WNzWHeI+xkLIys76pnpqA=;
        b=VEGnMPcpsGemexA/+xV2W2YygAj/d8KE1grVI/84IHVodiu6zi6EZWSofs/XTE1oPq
         n3kVaGBgtE8mpih6Q8iChgWsbM736b0ORlW+wD6w7eJKz+aCzDmu3JAaBSQHtqwqQiQI
         8t9i85e394JTpQsNnvguoiI0UamcvclgoOqikzzCJP7jmSVKDgP9VgKA2+Yjar5/uyVr
         Oe/In00eib45QIfkF47NvKWfSkUV3V6IVPOokG08xylGlbWjEiONMeocVEANH2XJ72di
         zXTM0LWcNQTh6KuPXytrokyOvLJ74SFLYMXZnKd9iUlWP9YKDUQvHA1v+T3KQ7/aZGZV
         1kIQ==
X-Gm-Message-State: ANhLgQ0PWEYR73/IKkyLAFpDES03Xmg89KEZ4JkBcP4nbpk+KAQUsO9G
        B9LCblTFtLD0llTOOtTJ9/sY5qMG2PneGWbS6Hb0MzRO
X-Google-Smtp-Source: ADFU+vvsuNBZeTxGW0jwFsYzrL11NYHyitaO5YadxSmBvMzbbbwq2HPL1fYMnkjBHSWbn3p4mwQMHiLN3bPYVoQH+fQ=
X-Received: by 2002:a05:6122:1065:: with SMTP id k5mr233122vko.14.1583163888207;
 Mon, 02 Mar 2020 07:44:48 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date:   Mon, 2 Mar 2020 16:44:36 +0100
Message-ID: <CAJ2a_DdmVfru8dcuEqeQkceVv_UskSYBw=qickHG6SOCEAbPsA@mail.gmail.com>
Subject: target context of security:setbool permission check
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

currently the target context of the security:setbool permission check
is hardcoded to the security-initial-sid.[1][2]
Nowadays it is possible to label the boolean pseudo files via genfscon.

Is this by design or did nobody yet make it possible to base the check
on the actual file-context?

Or is the current access limitation to booleans via the file:write
permission to the boolean pseudo-files sufficient?


[1]: https://github.com/torvalds/linux/blob/b1dba2473114588be3df916bf629a61bdcc83737/security/selinux/selinuxfs.c#L1234
[2]: https://github.com/torvalds/linux/blob/b1dba2473114588be3df916bf629a61bdcc83737/security/selinux/selinuxfs.c#L1290
