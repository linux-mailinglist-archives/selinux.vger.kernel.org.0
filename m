Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4593474881
	for <lists+selinux@lfdr.de>; Tue, 14 Dec 2021 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbhLNQty (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Dec 2021 11:49:54 -0500
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210]:48715 "EHLO
        out162-62-57-210.mail.qq.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236085AbhLNQtu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 14 Dec 2021 11:49:50 -0500
X-Greylist: delayed 25181 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Dec 2021 11:49:49 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1639500586;
        bh=YCAmTaA0K2S/MJXLjh8iNzCecb4+HnsdZ8jgDLGf12w=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date;
        b=WrhQbmqYB1QQtk9+ly4xapN0FrcyebMgiS9WqyUz/uhPtni6+4Xmt5gGG38+0lNhL
         Xo8gc+j6FdKFKC0R0eGU98qabEx5yXxPJzYgrvNySlcPddiJcWkHdfREzUuG5FL1fn
         87bsmJVrZBjTk4SFmSObOStf5Cx4Dl8EbOcSoaX4=
X-QQ-FEAT: oHWrrGTW1dAsR6hyfs4/PqKPBWkWhQyz
X-QQ-SSF: 00000000000000F000000000000000Z
X-QQ-XMAILINFO: OfBuNT7NLq4plpxDJ6jG6+UAV+vjpYDlUS1unHSNPYNysI6Zlg1XKs2AjI0a2p
         Da0dQHvwD5AF+w2t1Pf3e/OifaylMJEfOgfZRMrwXwjqePo/1YyzxWD4WFbrL7QlTBjbbyjJPFuWl
         j8yUloVXInAjdDcuAV+Qgp4bf8ESHev/MfHY+8XJ6H83RixGbvgzsb+Fd7ujiLrAAq6xuIH8OFtmT
         kdiRcFVml2LHBPPSdLiQcn8HXrTdMVzZz2R7sngyPhcSoklxOPRUsO+qUGnL95qBy7/nr5JTwOZkc
         qvxWuV33RN2D8AOeKLIzu+U3h8K2hr4oESN6ga1wcWPBr3MK4NHoGGeHbSFkdUu7GtJLRJsoB+Hw6
         eE1fn8CJXBcbEb+s6GIb5aLkT4oxqZ27Jk4OuJYgLOhD+RtiGBBrX5BxigI8bzNjimXGJxb9S/EVV
         PGrqGL+5ML7LFWjKNuvAj3EePxVE35jM5LDUquzV9fPzT4m2ntpDo8IB8F2nZnGR63uYCNdxC8pAV
         0EeaO2207++fvbEmoUxytEpez1fySCDs+kOduN9nmPkAol3D3jWVm9up/dEDJmWhJSM0BABD3+49I
         LNVY+TDAqbH098HV28zbVU5ebaiuD9dCzqBovrDXRKRt9RoAmlldjB27vLJXyp3wdPjh0PYL1rsGQ
         PZHPSlLnJ8l5Dz8GYqaBB0UCz8BNxs3LM0THd4aQXfHpzpc/4EK3mPJr6aDDwKiFvU/CYfj5/Peqj
         acDRquUV6nEgfl6JTRu74eGFkdL3JrYLEO2zoXrs91CgOrYFQQBrVhF5reLJPGo9eBtfqrtMouEzQ
         /gmCaqXcKIwWBALuUEcx07ZODn/P3jGI/GCOkNM6Rv4E0t0i77Fnurwz4FFaKMayDOOTWIg0jALBk
         EmUcOgdfQ7CfdVehxPyLA==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 223.75.155.17
In-Reply-To: <CAEjxPJ4nT3LFqNNh7PRP5DuuJeVfOh_JQiDboskbpBATgoJkOQ@mail.gmail.com>
References: <tencent_D6BF2948237359EE0A47338567B88512D106@qq.com>
        <CAEjxPJ4nT3LFqNNh7PRP5DuuJeVfOh_JQiDboskbpBATgoJkOQ@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webmail716t1639500522t3631643
From:   "=?ISO-8859-1?B?WGlhb2tlIFdhbmc=?=" <xkernel.wang@foxmail.com>
To:     "=?ISO-8859-1?B?U3RlcGhlbiBTbWFsbGV5?=" 
        <stephen.smalley.work@gmail.com>
Cc:     "=?ISO-8859-1?B?UGF1bCBNb29yZQ==?=" <paul@paul-moore.com>,
        "=?ISO-8859-1?B?RXJpYyBQYXJpcw==?=" <eparis@parisplace.org>,
        "=?ISO-8859-1?B?U0VsaW51eCBsaXN0?=" <selinux@vger.kernel.org>,
        "=?ISO-8859-1?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] selinux: fix a wrong check condition of strcmp()
Mime-Version: 1.0
Content-Type: text/plain;
        charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date:   Wed, 15 Dec 2021 00:48:42 +0800
X-Priority: 3
Message-ID: <tencent_399699213791238D42225C4269FEFF03C405@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

T24gV2VkLCBEZWMgMTUsIDIwMjEgMDA6MTQgQU0sIFN0ZXBoZW4gU21hbGxleSB3cm90ZToK
PiBOQUsuIExvb2sgbW9yZSBjbG9zZWx5IGF0IHRoZSBjb2RlIHRoYXQgZm9sbG93cywgYW5k
IHVuZGVyc3RhbmQgdGhhdAo+IHRoZSBsaXN0IGlzIG9yZGVyZWQgdG8gYXZvaWQgbmVlZGlu
ZyB0byB0cmF2ZXJzZSBhbGwgb2YgaXQuCgpJIGFtIHZlcnkgc29ycnkgdGhhdCBJIGRpZG4n
dCByZWFsaXplIHRoYXQgaXMgYSBzb3J0ZWQgbGlzdC4gSSByZWFkIHBvbGljeWRiLmMKYW5k
IHVuZGVyc3RhbmQgd2hhdCB5b3UgY29tbWVudCBub3cuIApBcG9sb2dpemUgYWdhaW4gZm9y
IGRpc3R1cmJpbmcgeW91LCBhbmQgSSB3aWxsIHJlYWQgdGhlIGNvbnRleHQgYXMgY2FyZWZ1
bGx5CmFzIHBvc3NpYmxlIGluIHRoZSBmdXR1cmUuLi4uLi4=
A
