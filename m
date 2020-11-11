Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDB92AED62
	for <lists+selinux@lfdr.de>; Wed, 11 Nov 2020 10:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgKKJWe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 11 Nov 2020 04:22:34 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:41094 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgKKJWd (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 11 Nov 2020 04:22:33 -0500
Date:   Wed, 11 Nov 2020 09:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=milcent.co;
        s=protonmail2; t=1605086550;
        bh=zK1TZncY/z89XLluVvKuIPuN6KHlAYO/SM/M9hDso0Y=;
        h=Date:To:From:Reply-To:Subject:From;
        b=VsQH2xwTCQaOgZyGkMHAJjDjklKpuy5ay8sZRG6NkPqg4Eg/7FbIKiew3r8C9DCl0
         Kg6utt1R1loMVOLLO0bge5IFgCflF+ETFH/J9ACPx2wH3RaO40RlbYjfB5JAtarSZR
         p6k4qRuuIpVs+Zttn5T5kDNdUWZvbonr4b1S/nW6lInrb3WCCRCMiL7oJFTmdZWUVw
         Rm+5EkeeG8dr3puiv+voD+tQ2xhLaNZg/xVvSaOn01hjGijOUH15I+cPZDkaH/nvmJ
         CzDcvLQPIDmOeCj8CPLU4dG+ntHkeVIM+Dil+2pyDhtlYWs8j6rvDi6ER7sLIh66VM
         4FceA4+2Q2+lw==
To:     "selinux@vger.kernel.org" <selinux@vger.kernel.org>
From:   Louis MILCENT <louis@milcent.co>
Reply-To: Louis MILCENT <louis@milcent.co>
Subject: SElinux bug with docker custom path
Message-ID: <ZVdo8CDylRcmX-ujxPIa9RmGC0JZFyF-cjeaaTbXNnqXpoNafqzyd-zK7hqn6b5dqpeBHwo-4CqnSu6yqy-aw2smf7KJz3mv0Edmkz8rRvg=@milcent.co>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello,

I have found an error with SELinux and docker when changing the default doc=
ker installation path.
It result in an impossibility to start containers, like "alpine".

I already opened an issue on moby github repo, but without answers for now =
where I explain how to reproduce the issue:
https://github.com/moby/moby/issues/41654

Can you check or help me to debug this?

Regards,

Louis MILCENT
