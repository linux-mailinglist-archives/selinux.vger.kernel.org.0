Return-Path: <selinux+bounces-4461-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62AB151CE
	for <lists+selinux@lfdr.de>; Tue, 29 Jul 2025 19:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EBF73BD6DE
	for <lists+selinux@lfdr.de>; Tue, 29 Jul 2025 17:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D1828ECD8;
	Tue, 29 Jul 2025 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="E2qdbJC/"
X-Original-To: selinux@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871318DF89
	for <selinux@vger.kernel.org>; Tue, 29 Jul 2025 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753808862; cv=none; b=s5x313FbIZnMH+2seakbQWzzOHBL7HPrN5qP3I9OpuTYKoioLAEhSkZjFqSUfXpdCn7JZRNg7Cyv7gMsgUc3DGQPHfkTIX96rl/ykHSPXQMVAHDGX+JkoshuaTn2zhWkw8kqtjYZFhnN2mEleVzgRKBn46a1Qa7DMsby51K5V88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753808862; c=relaxed/simple;
	bh=6plPDim40Rrg3eWDseVxgEdiUV0GoaPMygFRlXp+Hhc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=GiO7UGYBIq3VqjYXuEHpHLSoTz8ZumVOLp4vuhEK9k/8zYN+LRNlnTxVWIO35zPQNp/5Uq3eXXi7UwaueJowrqfQskUL4PlTcJQTYfH6vY0UfVQ4UHeDzdjbWqalkIZosEKSKCRXriSvyIKsolsFctKzPDcA8TCjjwI9kUyXlNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=E2qdbJC/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-612b67dcb89so9006432a12.1
        for <selinux@vger.kernel.org>; Tue, 29 Jul 2025 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753808858; x=1754413658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6plPDim40Rrg3eWDseVxgEdiUV0GoaPMygFRlXp+Hhc=;
        b=E2qdbJC/MXhG8SI4mCeuS9tNnJbWxEIQNMi6UhmlEhuvBOqPdax8fwJO2OsJ8izXME
         DadQSEDV2MMuP1wBnix8cJqNk8WCApIEkykZen/Bv9C+E+VKQidgWs+np10Li+rmgcrq
         Kowicc0gk9+2io6yR7hMLN6ew/IGG0/kAY1vcxQk90txTvXus3Pgah/B9K2CWEI9Ap7O
         LqyR383QFnqg6g6A8/7KwluA4ZNtUdn0ezR7FbkiDki1Na8pIBcpJUEB5s+X2SBK11Tk
         bPHaA5wo7xIwV/2lF28Z7U1Jcg+OK3x5sXFGVZAPr1clnzM4wQkBCJczfKgNDNQp5pW5
         tjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753808858; x=1754413658;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6plPDim40Rrg3eWDseVxgEdiUV0GoaPMygFRlXp+Hhc=;
        b=wYvP60z6MpMr2ZeiI9ScLsxqGDCeNJAbwckQQvuTZaE23i25UMznE9cMf7W4Jd2vcm
         2H7iQd1NlGKDlkMMOeKGaFRvDpCqalR441pNRfbd1HjWzg462y/Cxm2N5deQmcD+F3z7
         XRMKuIfQRQFY1OdwWJZwfuXRIP6C749qog5dKDqnxYrMbBe+2OayqSi00R56whTGA+MS
         8yKyHsYi4BzkUgDEe3BUf+aD87EEgGINPzGOCprxsF8bRQ/CBuDre+BL/Qv8n4QBCAbF
         9ebGY5KIgMa5l5p558/g45oJqdUGbbiXXPlb9AucrOukah2UcTwnl1oMqOolFgVprYRo
         4dBA==
X-Forwarded-Encrypted: i=1; AJvYcCU4mb9YoNOMVEuy/OWlt5j6ChdU0rv5bSnILEdMDCAmUMOrYB3uXZ3b25UkKB96iD9waGahCgiT@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCkGl8nv3ATAYqO/i5geI+/O2ONGgZdC32WxiuUKB2wIcpjqq
	lcwIfaZYzqoR1Ohd22aw2BNI+KLKw5uX6YSdj7TTlzaS0cLOdPZiXgpc
X-Gm-Gg: ASbGncsIG0npPZNZBUXbnOEBF11LGyT7u6d9NbUQdRY7wAcFy1tREbB7+o01cEsEvqV
	OWjVEbIwE5xotZ+FEmFx5Rwuck9Xbo3NLqSTAyF0kgcA0JV3eUMI1/h/GvWqSLrymQckXtNb5me
	VljRR/uZqdZ7Bgau4tKys3R8Dobv6DhrJdmh14nsOp41W9Bq9OxcBQg4q4e8+b+f4mFXwwcF3Io
	oJ+RuQeKcSI7HfdKg24eijfALHh5aMkVUfMo6o9jv383zONL1XAef1aC9UhBtCrwyqriLXTYqsS
	oHxEd1mYyhE5W3e1o5vIh+W1VLtF6uEsaeNyAWyi+kPNFdvE6CSxz2Di7n2AACpa1v0YBnus81/
	LSV1XnzEVN+zQOLy24nrn0bm1
X-Google-Smtp-Source: AGHT+IGXSc5bX/AqlRzJ/yKIdUZ9WrvI+rWkBltzZ2N20MEJU5cYaJwKdakGcrmKOGDDy4bQx0PCPw==
X-Received: by 2002:a17:907:60cb:b0:adb:45eb:7d0b with SMTP id a640c23a62f3a-af8fd7001c4mr27293566b.15.1753808857943;
        Tue, 29 Jul 2025 10:07:37 -0700 (PDT)
Received: from [127.0.0.1] ([90.187.240.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63585fff3sm614563766b.21.2025.07.29.10.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 10:07:37 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:07:35 +0200 (GMT+02:00)
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Rahul Sandhu <nvraxn@gmail.com>, selinux@vger.kernel.org
Message-ID: <82e217c7-7124-4d49-ab98-074a6c2535c9@googlemail.com>
In-Reply-To: <CAEjxPJ483QFyTuM3bHbsgs-i6PJ=UtbezZ-6NPaMBw9JrOCvdg@mail.gmail.com>
References: <20250727153250.731505-1-nvraxn@gmail.com> <CAEjxPJ483QFyTuM3bHbsgs-i6PJ=UtbezZ-6NPaMBw9JrOCvdg@mail.gmail.com>
Subject: Re: [PATCH] libselinux: refactor selinux_getenforcemode
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Correlation-ID: <82e217c7-7124-4d49-ab98-074a6c2535c9@googlemail.com>

SnVsIDI5LCAyMDI1IDE2OjM0OjAyIFN0ZXBoZW4gU21hbGxleSA8c3RlcGhlbi5zbWFsbGV5Lndv
cmtAZ21haWwuY29tPjoKCj4gT24gU3VuLCBKdWwgMjcsIDIwMjUgYXQgMTE6MzPigK9BTSBSYWh1
bCBTYW5kaHUgPG52cmF4bkBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBJbnZlcnQgdGhlIGNoZWNr
IGZvciBjZmcgYmVpbmcgYSBudWxscHRyIGFuZCBlYXJseSByZXR1cm4uCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFJhaHVsIFNhbmRodSA8bnZyYXhuQGdtYWlsLmNvbT4KPgo+IEFja2VkLWJ5OiBTdGVw
aGVuIFNtYWxsZXkgPHN0ZXBoZW4uc21hbGxleS53b3JrQGdtYWlsLmNvbT4KPgo+PiAtLS0KPj4g
bGlic2VsaW51eC9zcmMvc2VsaW51eF9jb25maWcuYyB8IDc1ICsrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLQo+PiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMzggZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9saWJzZWxpbnV4L3NyYy9zZWxpbnV4X2NvbmZp
Zy5jIGIvbGlic2VsaW51eC9zcmMvc2VsaW51eF9jb25maWcuYwo+PiBpbmRleCA3NWRiMTRiYS4u
YTIzMzVmYTkgMTAwNjQ0Cj4+IC0tLSBhL2xpYnNlbGludXgvc3JjL3NlbGludXhfY29uZmlnLmMK
Pj4gKysrIGIvbGlic2VsaW51eC9zcmMvc2VsaW51eF9jb25maWcuYwo+PiBAQCAtODgsNDcgKzg4
LDQ2IEBAIHN0YXRpYyBjb25zdCB1aW50MTZfdCBmaWxlX3BhdGhfc3VmZml4ZXNfaWR4W05FTF0g
PSB7Cj4+Cj4+IGludCBzZWxpbnV4X2dldGVuZm9yY2Vtb2RlKGludCAqZW5mb3JjZSkKPj4gewo+
PiAtwqDCoMKgwqDCoMKgIGludCByZXQgPSAtMTsKPj4gwqDCoMKgwqDCoMKgwqAgRklMRSAqY2Zn
ID0gZm9wZW4oU0VMSU5VWENPTkZJRywgInJlIik7Cj4+IC3CoMKgwqDCoMKgwqAgaWYgKGNmZykg
ewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFyICpidWY7Cj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKnRhZzsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50IGxlbiA9IHNpemVvZihTRUxJTlVYVEFHKSAtIDE7Cj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZiA9IG1hbGxvYyhzZWxpbnV4X3BhZ2Vfc2l6ZSk7Cj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYnVmKSB7Cj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmY2xvc2UoY2ZnKTsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB3aGlsZSAoZmdldHNfdW5sb2NrZWQoYnVmLCBzZWxpbnV4X3BhZ2Vfc2l6ZSwgY2ZnKSkgewo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHN0cm5j
bXAoYnVmLCBTRUxJTlVYVEFHLCBsZW4pKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFnID0gYnVmK2xlbjsKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlIChpc3NwYWNl
KCh1bnNpZ25lZCBjaGFyKSp0YWcpKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhZysrOwo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFzdHJuY2FzZWNtcAo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodGFnLCAiZW5m
b3JjaW5nIiwgc2l6ZW9mKCJlbmZvcmNpbmciKSAtIDEpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmVuZm9yY2UgPSAx
Owo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldCA9IDA7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFzdHJuY2FzZWNtcAo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICh0YWcsICJwZXJtaXNzaXZlIiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVvZigicGVybWlzc2l2ZSIpIC0gMSkp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqZW5mb3JjZSA9IDA7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gMDsKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIXN0cm5jYXNlY21wCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHRhZywgImRpc2FibGVkIiwKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVv
ZigiZGlzYWJsZWQiKSAtIDEpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmVuZm9yY2UgPSAtMTsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQg
PSAwOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKg
wqDCoMKgwqAgaWYgKCFjZmcpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtMTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGNoYXIgKmJ1ZiA9IG1hbGxvYyhzZWxpbnV4X3Bh
Z2Vfc2l6ZSk7Cj4+ICvCoMKgwqDCoMKgwqAgaWYgKCFidWYpIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZjbG9zZShjZmcpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmcmVlKGJ1Zik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
MTsKPj4gwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDCoMKgwqAgaW50IHJldCA9IC0x
Owo+PiArwqDCoMKgwqDCoMKgIHN0YXRpYyBjb25zdCBpbnQgbGVuID0gc2l6ZW9mKFNFTElOVVhU
QUcpIC0gMTsKCkRvZXMgdGhpcyBjb25zdGFudCBuZWVkIHRvIGJlIHN0YXRpYz8KCj4+ICvCoMKg
wqDCoMKgwqAgd2hpbGUgKGZnZXRzX3VubG9ja2VkKGJ1Ziwgc2VsaW51eF9wYWdlX3NpemUsIGNm
ZykpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHN0cm5jbXAoYnVmLCBT
RUxJTlVYVEFHLCBsZW4pKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGludWU7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2hhciAqdGFnID0gYnVmICsgbGVuOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
aGlsZSAoaXNzcGFjZSgodW5zaWduZWQgY2hhcikqdGFnKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhZysrOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghc3RybmNhc2VjbXAodGFnLCAiZW5mb3JjaW5nIiwgc2l6ZW9m
KCJlbmZvcmNpbmciKSAtIDEpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqZW5mb3JjZSA9IDE7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAwOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0gZWxzZSBpZiAoIXN0cm5jYXNlY21wKHRhZywgInBlcm1pc3NpdmUiLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzaXplb2YoInBlcm1pc3NpdmUiKSAtIDEpKSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqZW5mb3JjZSA9IDA7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAwOwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAoIXN0cm5jYXNlY21wKHRhZywgImRp
c2FibGVkIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKCJkaXNhYmxlZCIpIC0gMSkp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICplbmZv
cmNlID0gLTE7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXQgPSAwOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKg
wqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBmY2xvc2UoY2ZnKTsKPj4gK8KgwqDCoMKgwqDC
oCBmcmVlKGJ1Zik7Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gfQo+Pgo+
PiAtLQo+PiAyLjUwLjEKPj4KPj4KCg==

