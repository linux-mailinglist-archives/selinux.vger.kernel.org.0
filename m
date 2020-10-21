Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7B42950E7
	for <lists+selinux@lfdr.de>; Wed, 21 Oct 2020 18:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502986AbgJUQiX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 21 Oct 2020 12:38:23 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:60070 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391406AbgJUQiW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 21 Oct 2020 12:38:22 -0400
X-Greylist: delayed 6072 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Oct 2020 12:38:22 EDT
Received: from in01.mta.xmission.com ([166.70.13.51])
        by out03.mta.xmission.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kVFY2-00C1oh-KT; Wed, 21 Oct 2020 08:57:06 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in01.mta.xmission.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1kVFXy-0003Sy-G0; Wed, 21 Oct 2020 08:57:06 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Mark Salyzyn <salyzyn@android.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        John Stultz <john.stultz@linaro.org>,
        linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org
References: <20201021143533.115895-1-salyzyn@android.com>
Date:   Wed, 21 Oct 2020 09:57:14 -0500
In-Reply-To: <20201021143533.115895-1-salyzyn@android.com> (Mark Salyzyn's
        message of "Wed, 21 Oct 2020 07:35:29 -0700")
Message-ID: <87wnzj6305.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kVFXy-0003Sy-G0;;;mid=<87wnzj6305.fsf@x220.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX199I58QG2refBpWT2h/3qg84rj5WxpAjCg=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa03.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
        T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
        *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Mark Salyzyn <salyzyn@android.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 3757 ms - load_scoreonly_sql: 0.03 (0.0%),
        signal_user_changed: 3.7 (0.1%), b_tie_ro: 2.6 (0.1%), parse: 0.60
        (0.0%), extract_message_metadata: 25 (0.7%), get_uri_detail_list: 1.71
        (0.0%), tests_pri_-1000: 27 (0.7%), tests_pri_-950: 1.02 (0.0%),
        tests_pri_-900: 0.87 (0.0%), tests_pri_-90: 97 (2.6%), check_bayes: 94
        (2.5%), b_tokenize: 6 (0.1%), b_tok_get_all: 7 (0.2%), b_comp_prob:
        1.32 (0.0%), b_tok_touch_all: 78 (2.1%), b_finish: 0.66 (0.0%),
        tests_pri_0: 235 (6.3%), check_dkim_signature: 0.71 (0.0%),
        check_dkim_adsp: 18 (0.5%), poll_dns_idle: 3341 (88.9%), tests_pri_10:
        2.6 (0.1%), tests_pri_500: 3363 (89.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v18 0/4] overlayfs override_creds=off & nested get xattr fix
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Is there any reason why the cc list from the body of the email does not
match the people who have been cc'd on the email.  Skipping the
linux-unionfs list (which seems to be the mail list for overlayfs)
seems like a pretty big oversight.

> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: Eric W. Biederman <ebiederm@xmission.com>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stephen Smalley <sds@tycho.nsa.gov>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> To: linux-fsdevel@vger.kernel.org
> To: linux-unionfs@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: selinux@vger.kernel.org

Eric

