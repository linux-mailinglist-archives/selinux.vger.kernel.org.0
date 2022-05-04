Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F25351B468
	for <lists+selinux@lfdr.de>; Thu,  5 May 2022 02:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238769AbiEEAEt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 May 2022 20:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353765AbiEDX6y (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 4 May 2022 19:58:54 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8AB754685
        for <selinux@vger.kernel.org>; Wed,  4 May 2022 16:54:17 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id s12-20020a0568301e0c00b00605f30530c2so1934032otr.9
        for <selinux@vger.kernel.org>; Wed, 04 May 2022 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ampHH5WJLIBWSsxWwzVjbk5pO9UBFxn81pZ6QIDzZtY=;
        b=jG1k/bO0Nq5OpfddybGyQMOWQigENT/JFNekaKtm1E/HZ1a8FuNBrgE9fRE7gcHC8O
         1kvgjim+YyPR4q8yTYXW90TRFMvMtD3eFdFmlzCVzkwSKdd7AyHudhbo4nNGRQcu/Har
         zU3zphNWQ6lSCdG6gYbEoPfZ9KDbFp7PnHYnN0rBoPuWowQiYjRuat0gViGMFTu3V0RP
         J9hqm8PqQhnlG6nJCbOivw+BF52aXpQBxk6hfyTrbqQSdM97zI7NJJ1KcU0LFzvtHCOc
         Mz3Ce7R6uc6NL7bBGz/4sYD+R48TcX34R4EupJw8ycmUAbR5uqKN5wNKBWPj7yY5Uynx
         q5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ampHH5WJLIBWSsxWwzVjbk5pO9UBFxn81pZ6QIDzZtY=;
        b=R3+qzdPo4bqIExx63NOSEV1jW13kWCuPeIH1GbkWcY4rqzlt9gnMa4CayT4kDwsBeg
         1NEhT7oCQ65GRlHw6vwAFSR/y2JURho8Rj6Hygi09SvrM7LuFdqYDnpki8PlwcZLuX9Z
         Q97JUpdta+iD7faf0nn+DlioIwfp2HPdFxDtXHXYFKFQrBNAgxmbVMmdGUDB22IkNOcV
         8AsEbFlm/AQD9+/AbD3PgA7cQ3BCS9QMDp6VvGr79DEwgwX0pGN/K0+JOt5N7PM5/8Cw
         6V9NQPoAm9ACg62sdVQ7VdLIvnOmTZjhfZrDUOQZHNe/DhRn0/63oUFYrv6Zdb2gkDOO
         Dl4A==
X-Gm-Message-State: AOAM532Dc+hXEi9fvRFhn/PwCmtJgUDf86yipddOiWvKT67KfbO+fj4B
        FsgJhPMiZ9BvhI6oC3Yct2AvmuhhleSpopoq7FM=
X-Google-Smtp-Source: ABdhPJyobZJlcsZ6zCytgK5JW+Q09o0HYFp1zwLPWaFfYXPyjmVGzEvNCr+16hunmHPMGASL3FJ/dZw/arR6sb3w6PU=
X-Received: by 2002:a9d:400c:0:b0:605:f835:974c with SMTP id
 m12-20020a9d400c000000b00605f835974cmr8455450ote.269.1651708457384; Wed, 04
 May 2022 16:54:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6802:1a9:0:0:0:0 with HTTP; Wed, 4 May 2022 16:54:17
 -0700 (PDT)
Reply-To: ortegainvestmmentforrealinvest@gmail.com
From:   Info <joybhector64@gmail.com>
Date:   Thu, 5 May 2022 05:24:17 +0530
Message-ID: <CAP7KLYghodqQ8mxOwNTzCK_KCfu7gm5og-TXWb9cWgFAR7i9XQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:344 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [joybhector64[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [joybhector64[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
I am an investor. I came from the USA and I have many investments all
over the world.

I want you to partner with me to invest in your country I am into many
investment such as real Estate or buying of properties i can also
invest money in any of existing business with equity royalty or by %
percentage so on,
Warm regards
