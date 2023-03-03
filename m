Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457C76A9399
	for <lists+selinux@lfdr.de>; Fri,  3 Mar 2023 10:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjCCJSp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 3 Mar 2023 04:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjCCJSp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 3 Mar 2023 04:18:45 -0500
Received: from mail.crawnon.pl (mail.crawnon.pl [51.68.198.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4026FEB79
        for <selinux@vger.kernel.org>; Fri,  3 Mar 2023 01:18:44 -0800 (PST)
Received: by mail.crawnon.pl (Postfix, from userid 1002)
        id F25DBA2F52; Fri,  3 Mar 2023 09:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crawnon.pl; s=mail;
        t=1677835017; bh=C5hX24svv/9/TME4wPCHfYjl17BCtmuxEd1i9B4zdYs=;
        h=Date:From:To:Subject:From;
        b=xmf9GQBRzKVusuvctmrO9FD4QiuHSgNlTO40nSrTkDSzKGMI97N/ycCZAbrdXDiGw
         7tpRvBJnhEuH0ggV/94KpCAjxz5syBoMNM4Le/fKD0pQ9v/57RZNIQMe98fld8KOpE
         UMFdxK/A4ybBlKqAS8WjrxXlorBPPzUyTbp+h9HmAZAJggaj3pplCPgQ1YYBwLW9Gy
         oJRSbea29JgOsoCB9mgwmWSzqBoFy4K05DEiS/hyFmJ7ZKyGnYZ9VPL1HrhyI4mSvJ
         QAIHewf0xuIar8BepoN8GsInpV3ERAi1XbsBEF6nosrYI54srddJ1W8LVxi67eu/J/
         aFumPDLgYaFAw==
Received: by mail.crawnon.pl for <selinux@vger.kernel.org>; Fri,  3 Mar 2023 09:16:07 GMT
Message-ID: <20230303074500-0.1.9i.okq1.0.7b3726jad7@crawnon.pl>
Date:   Fri,  3 Mar 2023 09:16:07 GMT
From:   =?UTF-8?Q? "Miko=C5=82aj_Fiodorczyk" ?= 
        <mikolaj.fiodorczyk@crawnon.pl>
To:     <selinux@vger.kernel.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.crawnon.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NIXSPAM_IXHASH,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: crawnon.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [51.68.198.42 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: crawnon.pl]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  3.0 NIXSPAM_IXHASH http://www.nixspam.org/
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Dzie=C5=84 dobry,

chcia=C5=82bym poinformowa=C4=87, i=C5=BC mog=C4=85 Pa=C5=84stwo uzyska=C4=
=87 dofinansowanie na systemy fotowoltaiczne w ramach nowej edycji progra=
mu M=C3=B3j Pr=C4=85d.

Program zapewnia 6000 z=C5=82 dofinansowania na instalacj=C4=99 paneli i =
16 000 z=C5=82 na magazyn energii, ni=C5=BCsze cen pr=C4=85du i mo=C5=BCl=
iwo=C5=9B=C4=87 odliczenia koszt=C3=B3w zwi=C4=85zanych z instalacj=C4=85=
 fotowoltaiki w ramach rozliczenia PIT (tzw. ulga termomodernizacyjna).

Czy s=C4=85 Pa=C5=84stwo otwarci na wst=C4=99pn=C4=85 rozmow=C4=99 w tym =
temacie?


Pozdrawiam,
Miko=C5=82aj Fiodorczyk
