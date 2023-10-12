Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D697C79E3
	for <lists+selinux@lfdr.de>; Fri, 13 Oct 2023 00:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442450AbjJLWjh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 12 Oct 2023 18:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442438AbjJLWjh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 12 Oct 2023 18:39:37 -0400
Received: from correo1.cdmx.gob.mx (mtax.cdmx.gob.mx [189.240.235.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEC7BB
        for <selinux@vger.kernel.org>; Thu, 12 Oct 2023 15:39:33 -0700 (PDT)
Received: from cdmx.gob.mx ([10.250.108.150])
        by correo1.cdmx.gob.mx  with ESMTP id 39CMdAZI015264-39CMdAZK015264
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 12 Oct 2023 16:39:10 -0600
Received: from cdmx.gob.mx (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTPS id 8A2622436A6;
        Thu, 12 Oct 2023 16:38:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 5C9872436E1;
        Thu, 12 Oct 2023 16:38:33 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 5C9872436E1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=cdmx.gob.mx; s=DKIM1; c=relaxed/relaxed;
 h=content-type:mime-version:subject:to:from:date:reply-to:message-id;
 bh=zJ1vXSYiqX0uK45jjGyseVl8B0gyi++/jATCWPJGM10=;
 b=Gbpvy7FOHJCzyLLXYYNMAbVcJXyM1+qzEFmwRH5JzDqUtOYhVCu1Qoshm+yeZXkBZDCAWRlQvz42
        gg4n0avk1A2Oh47SGWus+fbC271EDufG1geg/o2aFIBacUL+iQk3zQPhBFiTrhehOylItkcjkHGp
        4d61ZPxfW7MbBEiogUdMdDOEQdHaLl8ncELNb3CyHCJCPYuPJgCU4Hz+GR+rB51tre+Xrzyw/iUH
        XjzzuaSkPjgVB1jZsqchNtYXWMj+AfGVwfca1MiE2hEq/wKrlBTjcpD/oVx75ZAzw0daEji/9kME
        3Wh0Vf1k/bHg3tdJ6yMGUqDDRhL8cCSN+I1BkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=2020J4N146MXCTY; t=1697146713;
        bh=Su0faOMxLuS325I4H5zHoVSrB8JG7L1kQkTEDMwaLzg=;
        h=Content-Type:MIME-Version:Subject:To:From:Date:Reply-To:
         Message-Id;
        b=CrwgQDhZuIR3F7seQhEYLoW3EenwEF1+RsaaGca/JR//jeUmjYAvW+Ui4oWqvKNxN
         Dsdce9lMDdJ5D6f1jQWH7dUfjP0nSahI85qzaaxh40jtnMduRvDG+ipc4ExuMdiD7t
         dg16tlMf8C7sp0Chgmsx2I9WsUmsPQe3YRM4SkqA=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WbAll79jE3ec; Thu, 12 Oct 2023 16:38:33 -0500 (CDT)
Received: from [192.168.8.123] (unknown [179.61.245.12])
        by cdmx.gob.mx (Postfix) with ESMTPSA id A01DD2436DE;
        Thu, 12 Oct 2023 16:38:17 -0500 (CDT)
Content-Type: multipart/alternative; boundary="===============1606201945=="
MIME-Version: 1.0
Subject: $4,800,000.00 dollars for you.
To:     Recipients <ctrinidad@cdmx.gob.mx>
From:   "Mrs. Mavis Wanczyk" <ctrinidad@cdmx.gob.mx>
Date:   Thu, 12 Oct 2023 15:38:22 -0700
Reply-To: maviswanczykdonation34@gmail.com
Message-Id: <20231012213817.A01DD2436DE@cdmx.gob.mx>
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_NAME_MR_MRS,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        SUBJ_DOLLARS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7546]
        *  0.1 SUBJ_DOLLARS Subject starts with dollar amount
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [189.240.235.197 listed in list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [maviswanczykdonation34[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 HK_NAME_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.5 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

You will not see this in a MIME-aware mail reader.
--===============1606201945==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

I have a donation of $4.8 million dollars for you, I won the America lotter=
y worth $758 million Powerball jackpot and i'm donating part of it to you. =
contact me for further information at (maviswanczykdonation34@gmail.com) fo=
r your claim.
--===============1606201945==
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

I have a donation of $4.8 million dollars for you, I won the America lott=
ery worth $758 million Powerball jackpot and i'm donating part of it to y=
ou. contact me for further information at  (maviswanczykdonation34@gmail.=
com)) for your claim.

--===============1606201945==--
