Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD802864A5
	for <lists+selinux@lfdr.de>; Wed,  7 Oct 2020 18:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgJGQjK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 7 Oct 2020 12:39:10 -0400
Received: from sonic313-13.consmr.mail.bf2.yahoo.com ([74.6.133.123]:39655
        "EHLO sonic313-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726105AbgJGQjK (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 7 Oct 2020 12:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602088749; bh=PxMwWzXvs+dqOoH0/FHvFmQpYH2JguaCUHYAVLLmaiw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=kEBe5ef967GP9yrskeDYdZ1ZX/Cz4jyaRScS+UBSUjCDxn5op3+BG8aQEk55M2h6QzMDX+M3F+0e2R/RbJLQwcQ6Zf6JvNN6wMK2qQwbI+Dz+OJVk6afUmLxhPtdJNUbcCTnVjf9GZ1+dfH4fG1pEv8gC4db+4Ot5AqsW+r3BpyFDNsXqYSV46tGi8L2F7ZxNj92P9YhwC+0gqMh01tXwAmdJCL5Z15PoRBFH7OzyOAZjt9fY8u6sD8OLGZcB5oi6XEe2v91WQ9h8A52HykV+nvpYiL/KVdeGyZdkmuoSHvf+EQxIEzHc1RTAHrcyqOViYNeNCWpwJmcxwagrmG5Pg==
X-YMail-OSG: jQ5dwBIVM1ktYTu_8OzAsAoQEgdn3aAgWr7JwM_xhc.ssTEuT1lVS_Ags4EI9dl
 MyAIIDH_IL9o21Y.kzkiaCDjNrOjnaStalbRKLnueBBaqfRXaxbOZ6.B.3krteoozdlQkkxWgKRE
 LAYDqypyK8hnuTMz9AL4xAloPvi9901m_1vaAw6KToM9BApXXntZIDLWCWVE5dlUBs9h_OxAkC9y
 IEw2JmpUclIQDdYbZdjm0gQA2MVkSEfa9TuYgSiS8ff57NmzFjpaW2x75NBiJ0dezA059hz03kV4
 .0gxuKqAH7a9IEOf07jptnENQQZqbPj_jBjMrRBML5O79klYvQE..j7rLm2lZ76g.LHGUl7oYsVR
 M4ECFVTVy2a4iKqM7XuKVxY7CS1089dojfaYZ8l3vRJZEZeZ3vT9GRm8YFgeXDr3UuU69ojxM9iv
 JS7njJa0k8arfH2Bz8.b0NuefM96UE2W3whJj_PX2faMa2.IQb.xwffNaFsoXn6RTrbp9I3lIGlA
 IvsEhlC_lHFH2iuVatMQkcVT_TCTOCrZnQ6mw8bYO84njf2sdWOt9zPS8BEYKAiB5oIC.Z57SFjY
 P48_G3NgDa7cJ8cxNxfNvXIEDmEtDs78h.6MM1Kt4ZbogzVAO9q2K5azX14Z2kaQcxhO16Jlnksf
 5Tfl8WlKElA8xPIidL1_ZHCiGHPQoUVRkcjuNPDkdo9MEMdZLWh7uvXzWxXwAef9SdXxM5jDUjb9
 NEPW.o.M3I4FT856eamKIVIWRpuPE8zm_qT05OlRsN2DIVDd36vxuS5Wf5pK2cWGXLL7Th.61Uij
 upkAmxREIOzFbyFut9fkpPRFPphZoBo3vx5hQK5U8VtaVWknzPYzLwhJI6BysG8OIJos04KEbPks
 UvJmHYsOVk.TqPX_0FkTuIMMdEOu1iIOkHYZikCAwAr5lo8AAOcbHH_cqWgrq1lB0sCbUnTMT3Gx
 6TJ34GDvKKP34TSyEqSrC.LJbSb3NOClUnXW0dgHgbhh0NJjQvHnULUGceJA6x1foMXWcSXYHfzX
 ADs2RoHx8CM.RVZlrEbLgeM2zw7gIit_k.K.JiVHtQTNPMa5sBplU8Ek9z.OK.qHPN7OqGj2N23o
 WYe0jJJgBz8vpbH71PlrVv5fUB5vd9cVwj6ZN81uS.F0edLlUow3iSeL4RUpjBN6IJfrEbH18mhR
 pYfAJKn75u5uDXQ4kRpUPku0ZwoMCshQkXx6qFpl.cJ_8kX8wBDL5ODN3Wy6aA9PMdFukHyNXw20
 pdm0SLHJLks.byFKxHttKZRvCzuja3MZ.B9HG1FkNvxO0DbVU2lfxJ1biaCW4A8urHeWoro1a6Jm
 8glxx8ezwb6zCNcrhHJwkfR7Wj7nExq9htIGw.hy0wsgMKgmmAggFBOEq_GJ4baTcFoPFepSte2D
 jqDP2TI72_jKvwOFOjACXUKf0RRm4uoJxnx8-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.bf2.yahoo.com with HTTP; Wed, 7 Oct 2020 16:39:09 +0000
Date:   Wed, 7 Oct 2020 16:39:07 +0000 (UTC)
From:   Mrs Marilyn Robert <fredodinga22@gmail.com>
Reply-To: marilyobert@gmail.com
Message-ID: <885096625.152433.1602088747948@mail.yahoo.com>
Subject: =?UTF-8?B?0J3QsNGY0LzQuNC70LAg0LrQsNGYINCz0L7RgdC/0L7QtNCw0YDQvtGC?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
References: <885096625.152433.1602088747948.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

DQoNCtCd0LDRmNC80LjQu9CwINC60LDRmCDQs9C+0YHQv9C+0LTQsNGA0L7Rgg0KDQrQiNCw0YEg
0YHRg9C8IDY4LdCz0L7QtNC40YjQvdCwINC20LXQvdCwLCDQutC+0ZjQsCDRgdGC0YDQsNC00LAg
0L7QtCDQv9GA0L7QtNC+0LvQttC10L0g0LrQsNGA0YbQuNC90L7QvCDQvdCwINC00L7RmNC60LAs
INC+0LQg0YHQuNGC0LUg0LzQtdC00LjRhtC40L3RgdC60Lgg0LjQvdC00LjQutCw0YbQuNC4LCDQ
vNC+0ZjQsNGC0LAg0YHQvtGB0YLQvtGY0LHQsCDQvdCw0LLQuNGB0YLQuNC90LAg0YHQtSDQstC7
0L7RiNC4INC4INC+0YfQuNCz0LvQtdC00L3QviDQtSDQtNC10LrQsCDQvNC+0LbQtdCx0Lgg0L3Q
tdC80LAg0LTQsCDQttC40LLQtdCw0Lwg0L/QvtCy0LXRnNC1INC+0LQg0YjQtdGB0YIg0LzQtdGB
0LXRhtC4INC60LDQutC+INGA0LXQt9GD0LvRgtCw0YIg0L3QsCDQsdGA0LfQuNC+0YIg0YDQsNGB
0YIg0Lgg0LHQvtC70LrQsNGC0LAg0YjRgtC+INGB0LUg0ZjQsNCy0YPQstCwINC60LDRmCDQvdC1
0LAuINCc0L7RmNC+0YIg0YHQvtC/0YDRg9CzINC/0L7Rh9C40L3QsCDQvdC10LrQvtC70LrRgyDQ
s9C+0LTQuNC90Lgg0L3QsNC90LDQt9Cw0LQg0Lgg0L3QsNGI0LjRgtC1INC00L7Qu9Cz0Lgg0LPQ
vtC00LjQvdC4INCx0YDQsNC6INC90LUg0LHQtdCwINCx0LvQsNCz0L7RgdC70L7QstC10L3QuCDR
gdC+INC90LjRgtGDINC10LTQvdC+INC00LXRgtC1LCDQv9C+INC90LXQs9C+0LLQsNGC0LAg0YHQ
vNGA0YIg0LPQviDQvdCw0YHQu9C10LTQuNCyINGG0LXQu9C+0YLQviDQvdC10LPQvtCy0L4g0LHQ
vtCz0LDRgtGB0YLQstC+Lg0KDQrQlNC+0LDRk9Cw0Lwg0LrQsNGYINCy0LDRgSDQvtGC0LrQsNC6
0L4g0YHQtSDQv9C+0LzQvtC70LjQsiDQt9CwINGC0L7QsCwg0L/QvtC00LPQvtGC0LLQtdC9INGB
0YPQvCDQtNCwINC00L7QvdC40YDQsNC8INGB0YPQvNCwINC+0LQgMiwgMzAwLCAwMDAg0LXQstGA
0LAg0LfQsCDQv9C+0LzQvtGIINC90LAg0YHQuNGA0L7QvNCw0YjQvdC40YLQtSwg0YHQuNGA0L7Q
vNCw0YjQvdC40YLQtSDQuCDQv9C+0LzQsNC70LrRgyDQv9GA0LjQstC40LvQtdCz0LjRgNCw0L3Q
uNGC0LUg0LzQtdGT0YMg0LLQsNGI0LjRgtC1INGB0L7QsdGA0LDQvdC40ZjQsCAvINC+0L/RiNGC
0LXRgdGC0LLQvi4g0JfQsNCx0LXQu9C10LbQtdGC0LUg0LTQtdC60LAg0L7QstC+0Zgg0YTQvtC9
0LQg0LUg0LTQtdC/0L7QvdC40YDQsNC9INCy0L4g0LHQsNC90LrQsCDQutCw0LTQtSDRiNGC0L4g
0YDQsNCx0L7RgtC10YjQtSDQvNC+0ZjQvtGCINGB0L7Qv9GA0YPQsy4gQXBwcmVjaWF0ZdC1INGG
0LXQvdCw0Lwg0LDQutC+INC+0LHRgNC90LXRgtC1INCy0L3QuNC80LDQvdC40LUg0L3QsCDQvNC+
0LXRgtC+INCx0LDRgNCw0ZrQtSDQt9CwINC/0YDQvtC/0LDQs9C40YDQsNGa0LUg0L3QsCDQvNCw
0YHQsNC20LDRgtCwINC90LAg0LrRgNCw0LvRgdGC0LLQvtGC0L4sINGc0LUg0LLQuCDQtNCw0LTQ
sNC8INC/0L7QstC10ZzQtSDQtNC10YLQsNC70Lgg0LfQsCDRgtC+0LAg0LrQsNC60L4g0LTQsCDQ
v9C+0YHRgtCw0L/QuNGC0LUuDQoNCtCR0LvQsNCz0L7QtNCw0YDQsNC8DQrQky3Rk9CwINCc0LXR
gNC40LvQuNC9INCg0L7QsdC10YDRgg==
