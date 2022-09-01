Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366675AA2FA
	for <lists+selinux@lfdr.de>; Fri,  2 Sep 2022 00:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbiIAW06 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Sep 2022 18:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbiIAW0l (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Sep 2022 18:26:41 -0400
Received: from burlywood.elm.relay.mailchannels.net (burlywood.elm.relay.mailchannels.net [23.83.212.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3745A837
        for <selinux@vger.kernel.org>; Thu,  1 Sep 2022 15:24:21 -0700 (PDT)
X-Sender-Id: techassets|x-authuser|susanlee23@ingodihop.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 206C02267A;
        Thu,  1 Sep 2022 22:22:45 +0000 (UTC)
Received: from vmcp128.myhostcenter.com (unknown [127.0.0.6])
        (Authenticated sender: techassets)
        by relay.mailchannels.net (Postfix) with ESMTPA id 10D5A229A5;
        Thu,  1 Sep 2022 22:22:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1662070963; a=rsa-sha256;
        cv=none;
        b=oEb+WPBJVf2aTS9er6Ea6ZWjbj6V3QeF22czPTvKx8UhU5uIp8gLzkiSGcqHIObs6GqxqS
        4FnZKzndzrTWleVOKgYRg8F2I+ib14ab1AyQX+6cGt0U+1su+iDIr5nklcwlPh5PJT1aaU
        Pn+t+kIfmTRV7b0B+PmElIQ/+OCODqv+Frxe3wcCXp0Rtje0xlpgkYMqLQ5owI/Lg2g9Qp
        seCQyActHHjax1WnM2VmuH46+eBbWjS5YWkf9WCciGTmnVC1PhHII0z7Yr1teMgCnUGvhR
        LW8duOtUvasdxSPQu2Gcl7QZ2yOFToTnxJpbpfueqaDc/g4Mqqpl/X5C//kAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1662070963;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=lk3bJyd8y857dJgjG4s8NjFXdOCsb6gQAFjio/VR4EE=;
        b=AP97RdAmZOO8qmdTXi2YFl5TkJ5PzCfx9TEFFvaRFI52wWa34PrjK+GIt1rCNEBYye096f
        izXJ6/aNlSZFrqlsn8XcUucyMf3IL5OpXOfB9Ajv8gbCPP84cBz+VxTuChlCT7LpgRqy0X
        iaFtmXblD5ur1xWlLIBWe23PeFYLRX+dIjoTJXJQtbrJg9F8d9vdTvrAaicTIbHq1AyTS8
        4BMSs4PEP65Sh8ArfIc9sckoOaGeKyhg2dqFNJdcCLsWGYNrNHQSX2Dzrj4/b42UjkKktv
        sxiqvwlOjapwmN3+d8GVTMXRYhGaYXwcMk8js3K2u7sMz0pAEyU8UdZeqz1liA==
ARC-Authentication-Results: i=1;
        rspamd-64cc6f7466-tg55j;
        auth=pass smtp.auth=techassets smtp.mailfrom=susanlee23@ingodihop.com
X-Sender-Id: techassets|x-authuser|susanlee23@ingodihop.com
X-MC-Relay: Junk
X-MailChannels-SenderId: techassets|x-authuser|susanlee23@ingodihop.com
X-MailChannels-Auth-Id: techassets
X-Plucky-Industry: 28f3d86b4ce57f88_1662070963575_889637051
X-MC-Loop-Signature: 1662070963575:1613952542
X-MC-Ingress-Time: 1662070963575
Received: from vmcp128.myhostcenter.com (vmcp128.myhostcenter.com
 [66.84.29.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.108.161.89 (trex/6.7.1);
        Thu, 01 Sep 2022 22:22:43 +0000
Received: from [::1] (port=51546 helo=vmcp128.myhostcenter.com)
        by vmcp128.myhostcenter.com with esmtpa (Exim 4.95)
        (envelope-from <susanlee23@ingodihop.com>)
        id 1oTsZd-00ExCA-TO;
        Thu, 01 Sep 2022 18:22:07 -0400
MIME-Version: 1.0
Date:   Thu, 01 Sep 2022 18:21:55 -0400
From:   "Mrs. Susan Lee Yu-Chen " <susanlee23@ingodihop.com>
To:     undisclosed-recipients:;
Subject: INFORMATION
Reply-To: mrs.susanlee22@gmail.com
Mail-Reply-To: mrs.susanlee22@gmail.com
User-Agent: Roundcube Webmail/1.5.2
Message-ID: <7b949f3b6dbc60abd0bbade323de8111@ingodihop.com>
X-Sender: susanlee23@ingodihop.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AuthUser: susanlee23@ingodihop.com
X-Originating-IP: ::1
X-Spam-Status: Yes, score=6.3 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,HK_NAME_MR_MRS,
        ODD_FREEM_REPTO,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4824]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrs.susanlee22[at]gmail.com]
        *  0.0 T_SPF_PERMERROR SPF: test of record failed (permerror)
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [23.83.212.26 listed in wl.mailspike.net]
        *  2.1 ODD_FREEM_REPTO Has unusual reply-to header
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.0 HK_NAME_MR_MRS No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org



-- 
Hello,

I have sent you two emails and you did not respond, I even sent another 
message a few days ago with more details still no response from you. 
Please are you still using this email address? I am VERY SORRY if 
sincerely you did not receive those emails, I will resend it now as soon 
as you confirm you never received them.

Regards,
Susan Lee Yu-Chen
