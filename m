Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0384C1F4204
	for <lists+selinux@lfdr.de>; Tue,  9 Jun 2020 19:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731676AbgFIRRr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 9 Jun 2020 13:17:47 -0400
Received: from mx.kolabnow.com ([95.128.36.40]:19856 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728783AbgFIRRp (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 9 Jun 2020 13:17:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id E387F403D1;
        Tue,  9 Jun 2020 19:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        collaborative.li; h=content-transfer-encoding:content-language
        :content-type:content-type:in-reply-to:mime-version:date:date
        :message-id:from:from:references:subject:subject:received
        :received:received; s=dkim20160331; t=1591723062; x=1593537463;
         bh=CP9DPAEPnloY9SP+RS/iH4wf1mLYuauYG7+nyA6jH8M=; b=txH+6rimDnDl
        XeSfa806eKS9fSLEtBuhJSx32snhVbfFtcEicXZ4ly8vmda8VajO1VR2ko2W4cwu
        kWkQOio9gGTVjzQgHZzCRe8qq4/1Ny7SfVVmcwbbLrvtZkj6LIyy4nWxwX16iUp2
        Wu8RcQ+mMnTKTFyYlPuD81D/Laqo/t4izaP7SY+1ZRICStg78jScYmVcACbCn5B9
        jC7GHLDpCDCQKnegli7Updzu83E+EZ+313OWSEJNyvlsGI1mbOmyyNuzdg4udQFV
        n9QhstW9Rz0xug+Bbm+skmINxkDEcM7rop863Tul++Sna4C5iT9HkC0WT56j7K/y
        fpO3zlQ/R6vOMKPbBMxVkSUxMGRO+qFGwPa7WH5iV9egIqvStPKvVnmAx4MjyoM2
        SJzEe2VcsFqkyXrY+o4ebPXJFgYfIP8WgU3srk6d6d0zOth5pLF8FozGR04YDDeK
        HbKkkdHrTfl26vbwirsa+U/BaU3uDqMRmFtkcAd131PHY6wpc0+xXeZIwlNDwZfO
        m/yNUVdGFvH4tATModADu3oBg1iPzq/VB6KDg6JoF3AFxxYRdpQpe6g0m26Moz7c
        wCkgT9nMFgQJ7jDCh4LBnJ8uCdS8RRxT9YUHxYMX2+wbT/VdjIdRnU8GCqkOVqYP
        rvEaH3PdaiiNI4egBu63HAIKHHaTX4I=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-10 required=5
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ShZJN5lp0Kzl; Tue,  9 Jun 2020 19:17:42 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 60A84403B4;
        Tue,  9 Jun 2020 19:17:42 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id F2D9451C;
        Tue,  9 Jun 2020 19:17:41 +0200 (CEST)
Subject: Re: No window opening when running sandbox -S
To:     Petr Lautrbach <plautrba@redhat.com>,
        SElinux list <selinux@vger.kernel.org>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
References: <20200609170747.GA139421@localhost.localdomain>
From:   Cristian Ariza <cariza@collaborative.li>
Message-ID: <7dd7daa7-217a-fc99-f7d7-d1c629f7c592@collaborative.li>
Date:   Tue, 9 Jun 2020 18:17:40 +0100
MIME-Version: 1.0
In-Reply-To: <20200609170747.GA139421@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 09/06/2020 18:07, Petr Lautrbach wrote:
> Do you use X session or Wayland?

I've been doing tests now on [Xorg + XFCE] and [Wayland + Gnome]. What I 
could see is:

* Gnome: -S doesn't work, -X firefox seems fine
* XFCE: -S works perfectly, -X firefox doesn't always work and I haven't 
really found what changes between when it works and when it doesn't.


> Btw few years ago I wrote support for bubblewrap in sandbox so it's uses it
> instead of seunshare [1] but I haven't finished it and sent for review.
> 
> https://github.com/bachradsusi/SELinuxProject-selinux/commit/5158ea1f552fc098647d4c503f646bdcb6d0737f

What benefits would bublewrap provide?


