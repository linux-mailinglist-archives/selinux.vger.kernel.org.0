Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA4277E7CE
	for <lists+selinux@lfdr.de>; Wed, 16 Aug 2023 19:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345259AbjHPRk1 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 16 Aug 2023 13:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345265AbjHPRj7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 16 Aug 2023 13:39:59 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8111A2715
        for <selinux@vger.kernel.org>; Wed, 16 Aug 2023 10:39:56 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso103128581fa.2
        for <selinux@vger.kernel.org>; Wed, 16 Aug 2023 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692207595; x=1692812395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDqI2y13jthCE4rr5X5y4RmNdJt2GHm7M+Z5amAY9SQ=;
        b=gUmB/33Xz3QiPZ7ydLB3WhCUD+HLDyJmkLvwqItrcAV2rU4t0z1aBSApGyhSi+qT+I
         KyJr1NcaSMXFzffL7/8Ek+NvQIyeEVhjgm4gayuXA33TGvex7HW8ci3ll6dhu7aa6NRP
         iY4iedEm29ktP40gDEVDHGG7Kroh/xSZe5J36soGbVHqpxoGZxxVP4fQPA5ZP8k9THqV
         h3RmXYil6to4PJgLvdjVRbGDPo9/rCHmUKTEK8OwYJHuns2H99FzqEyBBucyLzz8+SfV
         u/FkE3Ct+Nf4jxAltBLAzPWrttZgRnJTRR/pC/cwIiLRuF6eJORuTMRu7tV3kNWNsgt2
         xdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692207595; x=1692812395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDqI2y13jthCE4rr5X5y4RmNdJt2GHm7M+Z5amAY9SQ=;
        b=TA5lsQ+kWVNA1T4vr+HunKiQVeWJz3JIdklvKu6FcvMj+zBCygsH+XbBfwaqFYPeV5
         eya4U3n4pjlPUPm9LPTq8DTXkR8qv8l+PqcyrLaTcOfEO2pEXTlk1N6FseY462YDjbkg
         luxABNgj68ea1IJGUUEWvbywIzW0QxVWdCpYW65aMtta2kWrbiYp+pSefHyuRIP9oR90
         q7VpDE3Z7GwNSOXj+omRL929irLaSxBeCsGIykaGtRVN0z8uFu8fFsXLFz45HZVabb9x
         ePKuEVytEh1p4bRZmRa8biupTjxT+K2WNNSYdXqu3flmto0caTshotvAQpvmgzEs1YyR
         ypNA==
X-Gm-Message-State: AOJu0Yzl+uT9wt17rFekr76aYX1yG1VqsJ95RnJYfCwGaeud9Bo3uPDz
        l9A5fBa1hp+tlSN8XtyM2cwad/qrGMkmd/56+xqCRdn8
X-Google-Smtp-Source: AGHT+IG14Ac3acKr4o7Igh7hbeF03hQzE56nkjxdi+XgolTWtnyj0qmWx9L9Aj1f+l0Ib4CynMsWZ3S+lfO1pMwB0G0=
X-Received: by 2002:a2e:9f17:0:b0:2b6:cf31:5e81 with SMTP id
 u23-20020a2e9f17000000b002b6cf315e81mr2270906ljk.20.1692207594399; Wed, 16
 Aug 2023 10:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230809163059.97671-1-jwcart2@gmail.com> <20230809163059.97671-12-jwcart2@gmail.com>
 <87350mc6v2.fsf@redhat.com>
In-Reply-To: <87350mc6v2.fsf@redhat.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Wed, 16 Aug 2023 13:39:43 -0400
Message-ID: <CAP+JOzQjdU8jGjmWJFdyiPip_Y8XthOAUteBm8sqCx4bRJ+aMg@mail.gmail.com>
Subject: Re: [PATCH 12/12] semodule-utils: Remove the Russian translations
To:     Petr Lautrbach <plautrba@redhat.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgNToyNuKAr0FNIFBldHIgTGF1dHJiYWNoIDxwbGF1dHJi
YUByZWRoYXQuY29tPiB3cm90ZToNCj4NCj4gSmFtZXMgQ2FydGVyIDxqd2NhcnQyQGdtYWlsLmNv
bT4gd3JpdGVzOg0KPg0KPiA+IFRoZSBSdXNzaWFuIHRyYW5zbGF0aW9ucyBoYXZlIG5vdCBiZWVu
IG1haW50YWluZWQgYW5kIGFyZSBvdXQgb2YNCj4gPiBkYXRlLCBzbyByZW1vdmUgdGhlbS4NCj4g
Pg0KPiA+IFN1Z2dlc3RlZC1ieTogUGV0ciBMYXV0cmJhY2ggPHBsYXV0cmJhQHJlZGhhdC5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgQ2FydGVyIDxqd2NhcnQyQGdtYWlsLmNvbT4NCj4N
Cj4gQmFzZWQgb24gaHR0cHM6Ly9naXRodWIuY29tL1NFTGludXhQcm9qZWN0L3NlbGludXgvcHVs
bC80MDUNCj4NCj4gRm9yIGFsbCAxMjoNCj4NCj4gQWNrZWQtYnk6IFBldHIgTGF1dHJiYWNoIDxs
YXV0cmJhY2hAcmVkaGF0LmNvbT4NCj4NCg0KVGhpcyBzZXJpZXMgb2YgMTIgcGF0Y2hlcyBoYXMg
YmVlbiBtZXJnZWQuDQpKaW0NCg0KPiBOb3RlIHRoYXQgTWFrZWZpbGUncyBzdGlsbCBjb250YWlu
Og0KPg0KPiBgYGANCj4gTElOR1VBUyA/PSBydQ0KPiAuLi4NCj4gaW5zdGFsbDogYWxsDQo+IC4u
Lg0KPiAgICAgZm9yIGxhbmcgaW4gJChMSU5HVUFTKSA7IGRvIFwNCj4gICAgICAgICAgICAgICAg
IGlmIFsgLWUgJCR7bGFuZ30gXSA7IHRoZW4gXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBt
a2RpciAtcCAkKERFU1RESVIpJChNQU5ESVIpLyQke2xhbmd9L21hbjUgOyBcDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIG1rZGlyIC1wICQoREVTVERJUikkKE1BTkRJUikvJCR7bGFuZ30vbWFu
OCA7IFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgaW5zdGFsbCAtbSA2NDQgJCR7bGFuZ30v
Ki41ICQoREVTVERJUikkKE1BTkRJUikvJCR7bGFuZ30vbWFuNS8gOyBcDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGluc3RhbGwgLW0gNjQ0ICQke2xhbmd9LyouOCAkKERFU1RESVIpJChNQU5E
SVIpLyQke2xhbmd9L21hbjgvIDsgXA0KPiAgICAgICAgICAgICAgICAgZmkgOyBcDQo+ICAgICAg
ICAgZG9uZQ0KPiBgYGANCj4NCj4gSSdkIHNpbXBseSBkcm9wICdydScgZnJvbSBMSU5HVUFTIGlu
IG9yZGVyIHRvIG1ha2UgaXQgcG9zc2libGUgdG8gdXNlDQo+IG9yaWdpbmFsIHJ1IHBhZ2VzIGV4
dHJhY3RlZCBmcm9tIG90aGVyIHNvdXJjZSBhbmQgc2V0dGluZyBMSU5HVUFTIGluIHRoZQ0KPiBi
dWlsZCBlbnZpcm9ubWVudCwgZS5nLjoNCj4NCj4gYGBgDQo+IC0tLSBhL2NoZWNrcG9saWN5L01h
a2VmaWxlDQo+ICsrKyBiL2NoZWNrcG9saWN5L01ha2VmaWxlDQo+IEBAIC0xLDcgKzEsNyBAQA0K
PiAgIw0KPiAgIyBNYWtlZmlsZSBmb3IgYnVpbGRpbmcgdGhlIGNoZWNrcG9saWN5IHByb2dyYW0N
Cj4gICMNCj4gLUxJTkdVQVMgPz0gcnUNCj4gK0xJTkdVQVMgPz0NCj4gIFBSRUZJWCA/PSAvdXNy
DQo+ICBCSU5ESVIgPz0gJChQUkVGSVgpL2Jpbg0KPiAgTUFORElSID89ICQoUFJFRklYKS9zaGFy
ZS9tYW4NCj4gYGBgDQo+DQo+DQo+ID4gLS0tDQo+ID4gIC4uLi9zZW1vZHVsZV9leHBhbmQvcnUv
c2Vtb2R1bGVfZXhwYW5kLjggICAgICB8IDMxIC0tLS0tLS0tLS0tLQ0KPiA+ICAuLi4vc2Vtb2R1
bGVfbGluay9ydS9zZW1vZHVsZV9saW5rLjggICAgICAgICAgfCAzMiAtLS0tLS0tLS0tLS0tDQo+
ID4gIC4uLi9zZW1vZHVsZV9wYWNrYWdlL3J1L3NlbW9kdWxlX3BhY2thZ2UuOCAgICB8IDQ4IC0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgLi4uL3NlbW9kdWxlX3BhY2thZ2UvcnUvc2Vtb2R1bGVf
dW5wYWNrYWdlLjggIHwgMjQgLS0tLS0tLS0tLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDEzNSBk
ZWxldGlvbnMoLSkNCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHNlbW9kdWxlLXV0aWxzL3NlbW9k
dWxlX2V4cGFuZC9ydS9zZW1vZHVsZV9leHBhbmQuOA0KPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQg
c2Vtb2R1bGUtdXRpbHMvc2Vtb2R1bGVfbGluay9ydS9zZW1vZHVsZV9saW5rLjgNCj4gPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IHNlbW9kdWxlLXV0aWxzL3NlbW9kdWxlX3BhY2thZ2UvcnUvc2Vtb2R1
bGVfcGFja2FnZS44DQo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBzZW1vZHVsZS11dGlscy9zZW1v
ZHVsZV9wYWNrYWdlL3J1L3NlbW9kdWxlX3VucGFja2FnZS44DQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvc2Vtb2R1bGUtdXRpbHMvc2Vtb2R1bGVfZXhwYW5kL3J1L3NlbW9kdWxlX2V4cGFuZC44IGIv
c2Vtb2R1bGUtdXRpbHMvc2Vtb2R1bGVfZXhwYW5kL3J1L3NlbW9kdWxlX2V4cGFuZC44DQo+ID4g
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMjhiMzgxYWYuLjAwMDAwMDAwDQo+
ID4gLS0tIGEvc2Vtb2R1bGUtdXRpbHMvc2Vtb2R1bGVfZXhwYW5kL3J1L3NlbW9kdWxlX2V4cGFu
ZC44DQo+ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDMxICswLDAgQEANCj4gPiAtLlRIIFNF
TU9EVUxFX0VYUEFORCAiOCIgItC90L7Rj9Cx0YDRjCAyMDA1IiAiU2VjdXJpdHkgRW5oYW5jZWQg
TGludXgiDQo+ID4gLS5TSCDQmNCc0K8NCj4gPiAtc2Vtb2R1bGVfZXhwYW5kIFwtINGA0LDRgdGI
0LjRgNC40YLRjCDQv9Cw0LrQtdGCINC80L7QtNGD0LvRjyDQv9C+0LvQuNGC0LjQutC4IFNFTGlu
dXgNCj4gPiAtDQo+ID4gLS5TSCDQntCR0JfQntCgDQo+ID4gLS5CIHNlbW9kdWxlX2V4cGFuZCBb
LVYgXSBbIC1hIF0gWyAtYyBbdmVyc2lvbl1dIGJhc2Vtb2Rwa2cgb3V0cHV0ZmlsZQ0KPiA+IC0u
YnINCj4gPiAtLlNIINCe0J/QmNCh0JDQndCY0JUNCj4gPiAtLlBQDQo+ID4gLXNlbW9kdWxlX2V4
cGFuZCAtINGD0YLQuNC70LjRgtCwINGA0LDQt9GA0LDQsdC+0YLQutC4INC00LvRjyDRgNGD0YfQ
vdC+0LPQviDRgNCw0YHRiNC40YDQtdC90LjRjyDQv9Cw0LrQtdGC0LAg0LHQsNC30L7QstC+0LPQ
viDQvNC+0LTRg9C70Y8g0L/QvtC70LjRgtC40LrQuCDQsiDQtNCy0L7QuNGH0L3Ri9C5INGE0LDQ
udC7INC/0L7Qu9C40YLQuNC60Lgg0Y/QtNGA0LAuDQo+ID4gLdCt0YLQviDRgdGA0LXQtNGB0YLQ
stC+INC90LUg0Y/QstC70Y/QtdGC0YHRjyDQvdC10L7QsdGF0L7QtNC40LzRi9C8INC00LvRjyDQ
vdC+0YDQvNCw0LvRjNC90L7QuSDRgNCw0LHQvtGC0YsgU0VMaW51eC4g0J7QsdGL0YfQvdC+INGC
0LDQutC+0LUg0YDQsNGB0YjQuNGA0LXQvdC40LUg0LLRi9C/0L7Qu9C90Y/QtdGC0YHRjyBsaWJz
ZW1hbmFnZSDQstC90YPRgtGA0LXQvdC90LjQvCDQvtCx0YDQsNC30L7QvCDQsiDQvtGC0LLQtdGC
INC90LAg0LrQvtC80LDQvdC00Ysgc2Vtb2R1bGUuINCf0LDQutC10YLRiyDQsdCw0LfQvtCy0YvR
hSDQvNC+0LTRg9C70LXQuSDQv9C+0LvQuNGC0LjQutC4INC80L7QttC90L4g0YHQvtC30LTQsNCy
0LDRgtGMINC90LXQv9C+0YHRgNC10LTRgdGC0LLQtdC90L3QviDRgSDQv9C+0LzQvtGJ0YzRjiBz
ZW1vZHVsZV9wYWNrYWdlINC40LvQuCBzZW1vZHVsZV9saW5rICjQv9GA0Lgg0YHQstGP0LfRi9Cy
0LDQvdC40Lgg0L3QsNCx0L7RgNCwINC/0LDQutC10YLQvtCyINCyINC+0LTQuNC9INC/0LDQutC1
0YIpLg0KPiA+IC0NCj4gPiAtLlNIICLQn9CQ0KDQkNCc0JXQotCg0KsiDQo+ID4gLS5UUA0KPiA+
IC0uQiBcLVYNCj4gPiAt0J/QvtC60LDQt9Cw0YLRjCDQstC10YDRgdC40Y4NCj4gPiAtLlRQDQo+
ID4gLS5CIFwtYyBbdmVyc2lvbl0NCj4gPiAt0JLQtdGA0YHQuNGPINC/0L7Qu9C40YLQuNC60Lgs
INC60L7RgtC+0YDRg9GOINGB0LvQtdC00YPQtdGCINGB0L7Qt9C00LDRgtGMDQo+ID4gLS5UUA0K
PiA+IC0uQiBcLWENCj4gPiAt0J3QtSDQv9GA0L7QstC10YDRj9GC0Ywg0YPRgtCy0LXRgNC20LTQ
tdC90LjRjy4g0J/RgNC4INC40YHQv9C+0LvRjNC30L7QstCw0L3QuNC4INGN0YLQvtCz0L4g0L/Q
sNGA0LDQvNC10YLRgNCwINC/0L7Qu9C40YLQuNC60LAg0L3QtSDQsdGD0LTQtdGCINC/0YDQvtCy
0LXRgNGP0YLRjCDQt9Cw0L/RgNC10YnQsNGO0YnQuNC1INC/0YDQsNCy0LjQu9CwIChuZXZlcmFs
bG93KS4NCj4gPiAtDQo+ID4gLS5TSCDQodCc0J7QotCg0JjQotCVINCi0JDQmtCW0JUNCj4gPiAt
LkIgY2hlY2ttb2R1bGUoOCksIHNlbW9kdWxlX3BhY2thZ2UoOCksIHNlbW9kdWxlKDgpLCBzZW1v
ZHVsZV9saW5rKDgpDQo+ID4gLSg4KSwNCj4gPiAtLlNIINCQ0JLQotCe0KDQqw0KPiA+IC0ubmYN
Cj4gPiAt0K3RgtCwINGB0YLRgNCw0L3QuNGG0LAg0YDRg9C60L7QstC+0LTRgdGC0LLQsCDQsdGL
0LvQsCDQvdCw0L/QuNGB0LDQvdCwIERhbiBXYWxzaCA8ZHdhbHNoQHJlZGhhdC5jb20+Lg0KPiA+
IC3Qn9GA0L7Qs9GA0LDQvNC80LAg0LHRi9C70LAg0L3QsNC/0LjRgdCw0L3QsCBLYXJsIE1hY01p
bGxhbiA8a21hY21pbGxhbkB0cmVzeXMuY29tPiwgSm9zaHVhIEJyaW5kbGUgPGpicmluZGxlQHRy
ZXN5cy5jb20+Lg0KPiA+IC3Qn9C10YDQtdCy0L7QtCDQvdCwINGA0YPRgdGB0LrQuNC5INGP0LfR
i9C6INCy0YvQv9C+0LvQvdC40LvQsCDQk9C10YDQsNGB0LjQvNC10L3QutC+INCe0LvQtdGB0Y8g
PGdhbW1hcmF5QGJhc2VhbHQucnU+Lg0KPiA+IGRpZmYgLS1naXQgYS9zZW1vZHVsZS11dGlscy9z
ZW1vZHVsZV9saW5rL3J1L3NlbW9kdWxlX2xpbmsuOCBiL3NlbW9kdWxlLXV0aWxzL3NlbW9kdWxl
X2xpbmsvcnUvc2Vtb2R1bGVfbGluay44DQo+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggNGE4ZjQxNGUuLjAwMDAwMDAwDQo+ID4gLS0tIGEvc2Vtb2R1bGUtdXRpbHMvc2Vt
b2R1bGVfbGluay9ydS9zZW1vZHVsZV9saW5rLjgNCj4gPiArKysgL2Rldi9udWxsDQo+ID4gQEAg
LTEsMzIgKzAsMCBAQA0KPiA+IC0uVEggU0VNT0RVTEVfTElOSyAiOCIgItCd0L7Rj9Cx0YDRjCAy
MDA1IiAiU2VjdXJpdHkgRW5oYW5jZWQgTGludXgiDQo+ID4gLS5TSCDQmNCc0K8NCj4gPiAtc2Vt
b2R1bGVfbGluayBcLSDRgdCy0Y/Qt9Cw0YLRjCDQstC80LXRgdGC0LUg0L/QsNC60LXRgtGLINC8
0L7QtNGD0LvQtdC5INC/0L7Qu9C40YLQuNC60LggU0VMaW51eA0KPiA+IC0NCj4gPiAtLlNIINCe
0JHQl9Ce0KANCj4gPiAtLkIgc2Vtb2R1bGVfbGluayBbLVZ2XSBbLW8gb3V0ZmlsZV0gYmFzZW1v
ZHBrZyBtb2Rwa2cxIFttb2Rwa2cyXS4uLg0KPiA+IC0uYnINCj4gPiAtLlNIINCe0J/QmNCh0JDQ
ndCY0JUNCj4gPiAtLlBQDQo+ID4gLXNlbW9kdWxlX2xpbmsgLSDRg9GC0LjQu9C40YLQsCDRgNCw
0LfRgNCw0LHQvtGC0LrQuCDQtNC70Y8g0YDRg9GH0L3QvtCz0L4g0YHQstGP0LfRi9Cy0LDQvdC4
0Y8g0L3QsNCx0L7RgNCwINC/0LDQutC10YLQvtCyINC80L7QtNGD0LvQtdC5INC/0L7Qu9C40YLQ
uNC60LggU0VMaW51eCDQsiDQvtC00LjQvSDQv9Cw0LrQtdGCINC80L7QtNGD0LvQtdC5INC/0L7Q
u9C40YLQuNC60LguDQo+ID4gLdCt0YLQviDRgdGA0LXQtNGB0YLQstC+INC90LUg0Y/QstC70Y/Q
tdGC0YHRjyDQvdC10L7QsdGF0L7QtNC40LzRi9C8INC00LvRjyDQvdC+0YDQvNCw0LvRjNC90L7Q
uSDRgNCw0LHQvtGC0YsgU0VMaW51eC4g0J7QsdGL0YfQvdC+INGC0LDQutC+0LUg0YHQstGP0LfR
i9Cy0LDQvdC40LUg0LLRi9C/0L7Qu9C90Y/QtdGC0YHRjyBsaWJzZW1hbmFnZSDQstC90YPRgtGA
0LXQvdC90LjQvCDQvtCx0YDQsNC30L7QvCDQsiDQvtGC0LLQtdGCINC90LAg0LrQvtC80LDQvdC0
0Ysgc2Vtb2R1bGUuINCf0LDQutC10YLRiyDQvNC+0LTRg9C70LXQuSDRgdC+0LfQtNCw0Y7RgtGB
0Y8g0YEg0L/QvtC80L7RidGM0Y4gc2Vtb2R1bGVfcGFja2FnZS4NCj4gPiAtDQo+ID4gLS5TSCAi
0J/QkNCg0JDQnNCV0KLQoNCrIg0KPiA+IC0uVFANCj4gPiAtLkIgXC1WDQo+ID4gLdCf0L7QutCw
0LfQsNGC0Ywg0LLQtdGA0YHQuNGODQo+ID4gLS5UUA0KPiA+IC0uQiBcLXYNCj4gPiAt0J/QvtC0
0YDQvtCx0L3Ri9C5INGA0LXQttC40LwNCj4gPiAtLlRQDQo+ID4gLS5CIFwtbyA8b3V0cHV0IGZp
bGU+DQo+ID4gLdCh0LLRj9C30LDQvdC90YvQuSDQv9Cw0LrQtdGCINC80L7QtNGD0LvQtdC5INC/
0L7Qu9C40YLQuNC60LgsINGB0L7Qt9C00LDQvdC90YvQuSDRgSDQv9C+0LzQvtGJ0YzRjiDRjdGC
0L7Qs9C+INGB0YDQtdC00YHRgtCy0LANCj4gPiAtDQo+ID4gLQ0KPiA+IC0uU0gg0KHQnNCe0KLQ
oNCY0KLQlSDQotCQ0JrQltCVDQo+ID4gLS5CIGNoZWNrbW9kdWxlKDgpLCBzZW1vZHVsZV9wYWNr
YWdlKDgpLCBzZW1vZHVsZSg4KSwgc2Vtb2R1bGVfZXhwYW5kKDgpDQo+ID4gLSg4KSwNCj4gPiAt
LlNIINCQ0JLQotCe0KDQqw0KPiA+IC0ubmYNCj4gPiAt0K3RgtCwINGB0YLRgNCw0L3QuNGG0LAg
0YDRg9C60L7QstC+0LTRgdGC0LLQsCDQsdGL0LvQsCDQvdCw0L/QuNGB0LDQvdCwIERhbiBXYWxz
aCA8ZHdhbHNoQHJlZGhhdC5jb20+Lg0KPiA+IC3Qn9GA0L7Qs9GA0LDQvNC80LAg0LHRi9C70LAg
0L3QsNC/0LjRgdCw0L3QsCBLYXJsIE1hY01pbGxhbiA8a21hY21pbGxhbkB0cmVzeXMuY29tPi4N
Cj4gPiAt0J/QtdGA0LXQstC+0LQg0L3QsCDRgNGD0YHRgdC60LjQuSDRj9C30YvQuiDQstGL0L/Q
vtC70L3QuNC70LAg0JPQtdGA0LDRgdC40LzQtdC90LrQviDQntC70LXRgdGPIDxnYW1tYXJheUBi
YXNlYWx0LnJ1Pi4NCj4gPiBkaWZmIC0tZ2l0IGEvc2Vtb2R1bGUtdXRpbHMvc2Vtb2R1bGVfcGFj
a2FnZS9ydS9zZW1vZHVsZV9wYWNrYWdlLjggYi9zZW1vZHVsZS11dGlscy9zZW1vZHVsZV9wYWNr
YWdlL3J1L3NlbW9kdWxlX3BhY2thZ2UuOA0KPiA+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDNmNGIxNmE5Li4wMDAwMDAwMA0KPiA+IC0tLSBhL3NlbW9kdWxlLXV0aWxzL3Nl
bW9kdWxlX3BhY2thZ2UvcnUvc2Vtb2R1bGVfcGFja2FnZS44DQo+ID4gKysrIC9kZXYvbnVsbA0K
PiA+IEBAIC0xLDQ4ICswLDAgQEANCj4gPiAtLlRIIFNFTU9EVUxFX1BBQ0tBR0UgIjgiICLQndC+
0Y/QsdGA0YwgMjAwNSIgIlNlY3VyaXR5IEVuaGFuY2VkIExpbnV4Ig0KPiA+IC0uU0gg0JjQnNCv
DQo+ID4gLXNlbW9kdWxlX3BhY2thZ2UgXC0g0YHQvtC30LTQsNGC0Ywg0L/QsNC60LXRgiDQvNC+
0LTRg9C70Y8g0L/QvtC70LjRgtC40LrQuCBTRUxpbnV4DQo+ID4gLQ0KPiA+IC0uU0gg0J7QkdCX
0J7QoA0KPiA+IC0uQiBzZW1vZHVsZV9wYWNrYWdlIFwtbyA8b3V0cHV0IGZpbGU+IFwtbSA8bW9k
dWxlPiBbXC1mIDxmaWxlIGNvbnRleHRzPl0NCj4gPiAtLmJyDQo+ID4gLS5TSCDQntCf0JjQodCQ
0J3QmNCVDQo+ID4gLS5QUA0KPiA+IC1zZW1vZHVsZV9wYWNrYWdlIC0g0YPRgtC40LvQuNGC0LAs
INC60L7RgtC+0YDQsNGPINC40YHQv9C+0LvRjNC30YPQtdGC0YHRjyDQtNC70Y8g0YHQvtC30LTQ
sNC90LjRjyDQv9Cw0LrQtdGC0LAg0LzQvtC00YPQu9GPINC/0L7Qu9C40YLQuNC60LggU0VMaW51
eCDQuNC3INC00LLQvtC40YfQvdC+0LPQviDQvNC+0LTRg9C70Y8g0L/QvtC70LjRgtC40LrQuCDQ
uCAo0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90L4pINC00YDRg9Cz0LjRhSDQtNCw0L3QvdGL0YUs
INGC0LDQutC40YUg0LrQsNC6INC60L7QvdGC0LXQutGB0YLRiyDRhNCw0LnQu9C+0LIuINCa0L7Q
vNCw0L3QtNCwIHNlbW9kdWxlX3BhY2thZ2Ug0YPQv9Cw0LrQvtCy0YvQstCw0LXRgiDQtNCy0L7Q
uNGH0L3Ri9C1INC80L7QtNGD0LvQuCDQv9C+0LvQuNGC0LjQutC4LCDRgdC+0LfQtNCw0L3QvdGL
0LUg0YEg0L/QvtC80L7RidGM0Y4gY2hlY2ttb2R1bGUuINCf0LDQutC10YIg0L/QvtC70LjRgtC4
0LrQuCwg0YHQvtC30LTQsNC90L3Ri9C5INGBINC/0L7QvNC+0YnRjNGOIHNlbW9kdWxlX3BhY2th
Z2UsINC30LDRgtC10Lwg0LzQvtC20L3QviDRg9GB0YLQsNC90L7QstC40YLRjCDRh9C10YDQtdC3
IHNlbW9kdWxlLg0KPiA+IC0NCj4gPiAtLlNIINCf0KDQmNCc0JXQoA0KPiA+IC0ubmYNCj4gPiAt
IyDQodC+0LHRgNCw0YLRjCDQv9Cw0LrQtdGCINC/0L7Qu9C40YLQuNC60Lgg0LTQu9GPINCx0LDQ
t9C+0LLQvtCz0L4g0LzQvtC00YPQu9GPLg0KPiA+IC0kIHNlbW9kdWxlX3BhY2thZ2UgXC1vIGJh
c2UucHAgXC1tIGJhc2UubW9kIFwtZiBmaWxlX2NvbnRleHRzDQo+ID4gLSMg0KHQvtCx0YDQsNGC
0Ywg0L/QsNC60LXRgiDQv9C+0LvQuNGC0LjQutC4INC00LvRjyDQvNC+0LTRg9C70Y8gaHR0cGQu
DQo+ID4gLSQgc2Vtb2R1bGVfcGFja2FnZSBcLW8gaHR0cGQucHAgXC1tIGh0dHBkLm1vZCBcLWYg
aHR0cGQuZmMNCj4gPiAtIyDQodC+0LHRgNCw0YLRjCDQv9Cw0LrQtdGCINC/0L7Qu9C40YLQuNC6
0Lgg0LTQu9GPINC70L7QutCw0LvRjNC90YvRhSDQv9GA0LDQstC40Lsg0L/RgNC40L3Rg9C00LjR
gtC10LvRjNC90L7Qs9C+INC/0YDQuNGB0LLQvtC10L3QuNGPINGC0LjQv9C+0LIsINC90LUg0LLQ
utC70Y7Rh9Cw0Y8g0LrQvtC90YLQtdC60YHRgtGLINGE0LDQudC70L7Qsi4NCj4gPiAtJCBzZW1v
ZHVsZV9wYWNrYWdlIFwtbyBsb2NhbC5wcCBcLW0gbG9jYWwubW9kDQo+ID4gLS5maQ0KPiA+IC0N
Cj4gPiAtLlNIICLQn9CQ0KDQkNCc0JXQotCg0KsiDQo+ID4gLS5UUA0KPiA+IC0uQiBcLW8gXC1c
LW91dGZpbGUgPG91dHB1dCBmaWxlPg0KPiA+IC3QpNCw0LnQuyDQv9Cw0LrQtdGC0LAg0LzQvtC0
0YPQu9GPINC/0L7Qu9C40YLQuNC60LgsINGB0L7Qt9C00LDQvdC90YvQuSDRjdGC0LjQvCDRgdGA
0LXQtNGB0YLQstC+0LwuDQo+ID4gLS5UUA0KPiA+IC0uQiAgXC1zIFwtXC1zZXVzZXIgPHNldXNl
ciBmaWxlPg0KPiA+IC3QpNCw0LnQuyBzZXVzZXIsINC60L7RgtC+0YDRi9C5INGB0LvQtdC00YPQ
tdGCINCy0LrQu9GO0YfQuNGC0Ywg0LIg0L/QsNC60LXRgi4NCj4gPiAtLlRQDQo+ID4gLS5CICBc
LXUgXC1cLXVzZXJfZXh0cmEgPHVzZXIgZXh0cmEgZmlsZT4NCj4gPiAt0KTQsNC50LsgdXNlcl9l
eHRyYSwg0LrQvtGC0L7RgNGL0Lkg0YHQu9C10LTRg9C10YIg0LLQutC70Y7Rh9C40YLRjCDQsiDQ
v9Cw0LrQtdGCLg0KPiA+IC0uVFANCj4gPiAtLkIgIFwtbSBcLVwtbW9kdWxlIDxNb2R1bGUgZmls
ZT4NCj4gPiAt0KTQsNC50Lsg0LzQvtC00YPQu9GPINC/0L7Qu9C40YLQuNC60LgsINC60L7RgtC+
0YDRi9C5INGB0LvQtdC00YPQtdGCINCy0LrQu9GO0YfQuNGC0Ywg0LIg0L/QsNC60LXRgi4NCj4g
PiAtLlRQDQo+ID4gLS5CICBcLWYgXC1cLWZjIDxGaWxlIGNvbnRleHQgZmlsZT4NCj4gPiAt0KTQ
sNC50Lsg0LrQvtC90YLQtdC60YHRgtC+0LIg0YTQsNC50LvQvtCyINC00LvRjyDQvNC+0LTRg9C7
0Y8gKNC90LXQvtCx0Y/Qt9Cw0YLQtdC70YzQvdC+KS4NCj4gPiAtLlRQDQo+ID4gLS5CICBcLW4g
XC1cLW5jIDxuZXRmaWx0ZXIgY29udGV4dCBmaWxlPg0KPiA+IC3QpNCw0LnQuyDQutC+0L3RgtC1
0LrRgdGC0LAgbmV0ZmlsdGVyLCDQutC+0YLQvtGA0YvQuSDRgdC70LXQtNGD0LXRgiDQstC60LvR
jtGH0LjRgtGMINCyINC/0LDQutC10YIuDQo+ID4gLQ0KPiA+IC0uU0gg0KHQnNCe0KLQoNCY0KLQ
lSDQotCQ0JrQltCVDQo+ID4gLS5CIGNoZWNrbW9kdWxlKDgpLCBzZW1vZHVsZSg4KSwgc2Vtb2R1
bGVfdW5wYWNrYWdlKDgpDQo+ID4gLS5TSCDQkNCS0KLQntCg0KsNCj4gPiAtLm5mDQo+ID4gLdCt
0YLQsCDRgdGC0YDQsNC90LjRhtCwINGA0YPQutC+0LLQvtC00YHRgtCy0LAg0LHRi9C70LAg0L3Q
sNC/0LjRgdCw0L3QsCBEYW4gV2Fsc2ggPGR3YWxzaEByZWRoYXQuY29tPi4NCj4gPiAt0J/RgNC+
0LPRgNCw0LzQvNCwINCx0YvQu9CwINC90LDQv9C40YHQsNC90LAgS2FybCBNYWNNaWxsYW4gPGtt
YWNtaWxsYW5AdHJlc3lzLmNvbT4uDQo+ID4gLdCf0LXRgNC10LLQvtC0INC90LAg0YDRg9GB0YHQ
utC40Lkg0Y/Qt9GL0Log0LLRi9C/0L7Qu9C90LjQu9CwINCT0LXRgNCw0YHQuNC80LXQvdC60L4g
0J7Qu9C10YHRjyA8Z2FtbWFyYXlAYmFzZWFsdC5ydT4uDQo+ID4gZGlmZiAtLWdpdCBhL3NlbW9k
dWxlLXV0aWxzL3NlbW9kdWxlX3BhY2thZ2UvcnUvc2Vtb2R1bGVfdW5wYWNrYWdlLjggYi9zZW1v
ZHVsZS11dGlscy9zZW1vZHVsZV9wYWNrYWdlL3J1L3NlbW9kdWxlX3VucGFja2FnZS44DQo+ID4g
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDU3YWUzZDcuLjAwMDAwMDAwDQo+
ID4gLS0tIGEvc2Vtb2R1bGUtdXRpbHMvc2Vtb2R1bGVfcGFja2FnZS9ydS9zZW1vZHVsZV91bnBh
Y2thZ2UuOA0KPiA+ICsrKyAvZGV2L251bGwNCj4gPiBAQCAtMSwyNCArMCwwIEBADQo+ID4gLS5U
SCBTRU1PRFVMRV9QQUNLQUdFICI4IiAi0J3QvtGP0LHRgNGMIDIwMDUiICJTZWN1cml0eSBFbmhh
bmNlZCBMaW51eCINCj4gPiAtLlNIINCY0JzQrw0KPiA+IC1zZW1vZHVsZV91bnBhY2thZ2UgXC0g
0LjQt9Cy0LvQtdGH0Ywg0LzQvtC00YPQu9GMINC/0L7Qu9C40YLQuNC60Lgg0Lgg0YTQsNC50Lsg
0LrQvtC90YLQtdC60YHRgtC+0LIg0YTQsNC50LvQvtCyINC40Lcg0L/QsNC60LXRgtCwINC80L7Q
tNGD0LvRjyDQv9C+0LvQuNGC0LjQutC4IFNFTGludXgNCj4gPiAtDQo+ID4gLS5TSCDQntCR0JfQ
ntCgDQo+ID4gLS5CIHNlbW9kdWxlX3VucGFja2FnZSBwcGZpbGUgbW9kZmlsZSBbZmNmaWxlXQ0K
PiA+IC0uYnINCj4gPiAtLlNIINCe0J/QmNCh0JDQndCY0JUNCj4gPiAtLlBQDQo+ID4gLXNlbW9k
dWxlX3VucGFja2FnZSAtINGD0YLQuNC70LjRgtCwLCDQutC+0YLQvtGA0LDRjyDQuNGB0L/QvtC7
0YzQt9GD0LXRgtGB0Y8g0LTQu9GPINC40LfQstC70LXRh9C10L3QuNGPINGE0LDQudC70LAg0LzQ
vtC00YPQu9GPINC/0L7Qu9C40YLQuNC60LggU0VMaW51eCDQuCDRhNCw0LnQu9CwINC60L7QvdGC
0LXQutGB0YLQvtCyINGE0LDQudC70L7QsiDQuNC3INC/0LDQutC10YLQsCDQv9C+0LvQuNGC0LjQ
utC4IFNFTGludXguDQo+ID4gLQ0KPiA+IC0uU0gg0J/QoNCY0JzQldCgDQo+ID4gLS5uZg0KPiA+
IC0jINCY0LfQstC70LXRh9GMINGE0LDQudC7INC80L7QtNGD0LvRjyBodHRwZCDQuNC3INC/0LDQ
utC10YLQsCDQv9C+0LvQuNGC0LjQutC4IGh0dHBkLg0KPiA+IC0kIHNlbW9kdWxlX3VucGFja2Fn
ZSBodHRwZC5wcCBodHRwZC5tb2QgaHR0cGQuZmMNCj4gPiAtLmZpDQo+ID4gLQ0KPiA+IC0uU0gg
0KHQnNCe0KLQoNCY0KLQlSDQotCQ0JrQltCVDQo+ID4gLS5CIHNlbW9kdWxlX3BhY2thZ2UoOCkN
Cj4gPiAtLlNIINCQ0JLQotCe0KDQqw0KPiA+IC0ubmYNCj4gPiAt0K3RgtCwINGB0YLRgNCw0L3Q
uNGG0LAg0YDRg9C60L7QstC+0LTRgdGC0LLQsCDQsdGL0LvQsCDQvdCw0L/QuNGB0LDQvdCwIERh
biBXYWxzaCA8ZHdhbHNoQHJlZGhhdC5jb20+Lg0KPiA+IC3Qn9GA0L7Qs9GA0LDQvNC80LAg0LHR
i9C70LAg0L3QsNC/0LjRgdCw0L3QsCBTdGVwaGVuIFNtYWxsZXkgPHN0ZXBoZW4uc21hbGxleS53
b3JrQGdtYWlsLmNvbT4uDQo+ID4gLdCf0LXRgNC10LLQvtC0INC90LAg0YDRg9GB0YHQutC40Lkg
0Y/Qt9GL0Log0LLRi9C/0L7Qu9C90LjQu9CwINCT0LXRgNCw0YHQuNC80LXQvdC60L4g0J7Qu9C1
0YHRjyA8Z2FtbWFyYXlAYmFzZWFsdC5ydT4uDQo+ID4gLS0NCj4gPiAyLjQxLjANCj4NCg==
