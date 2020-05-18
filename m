Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6157F1D8869
	for <lists+selinux@lfdr.de>; Mon, 18 May 2020 21:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgERTop (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 18 May 2020 15:44:45 -0400
Received: from sonic307-2.consmr.mail.bf2.yahoo.com ([74.6.134.41]:42099 "EHLO
        sonic307-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728380AbgERToo (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 18 May 2020 15:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589831082; bh=lMwnL/6WltFrTd0TmVnY+7WY/Sq+3khHK9hYAyAunB4=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Fq3akDxXswRYKaOoooyR29wJQd9LT938E3pLiby53zHvEjpd3Hsmt7oQ/77MNG1Lqen+LvT7wvKkWcsPFYSUBI9bqx0lJiwL/0FKLE3MU3jp+ZXthEjEC1jUt9wBJ76qXzfkkvHsE9MSDBt78JK4WWuwVaurkQzUVZXBt/WLclbWWqv9zITB0KPrD6if4IcKByCePMComhP869+enueXZfvC5U4FhKC/jBtajatJJbI9niguUVGZDIZNoPWV6xe3LofESc6h7vB76sdAVyl7CRJUQEF8xr6O1VDcvaSPGx4NAmrjBl6Sfkt4nxDHj3Dn45oE6jvChL+Jn8nV8Wb04Q==
X-YMail-OSG: W0st_m0VM1mIxs5fcjaOqBHXUTuORP2hQVg22R5wKgzBOGquw5.M_iCbRtiYJgO
 .PLKBStb1on4xadw5olC6eve0Vp9fQrXghQ7eL5c5H2NEtBr3rvlNpOM_pQ4xn6yMOql3mMcSzgM
 Q8D.BqDS3fETk0mvYZgmzwYPzjHTXDAl8jVgBhNIG.Zha84C9XcYZSxJ6XDCwseuZFMgLSZ660.O
 G0a1Tuoeo0Mb8pEDGczbHkUwH9i.kOhuKRXiy7S7LhXnCEM.x_yEn_wZ4LR8hunIYwugP9rErIsS
 1QU5v9.9Kncd0eFh5VrJlyy78xu.OmnwCttwCJAH0KWRBPFIv7LpYigQs6jB51eiAI4ynp5azirX
 8QGKmFm7uK8lKfJNwpvB1r4fkiEEZyRAFosIa__J3YQiUiWqhT0HokjJODm8qULidO13HSkPASAJ
 F.61ZR_WXbujDPGylYCvAWfM0ceRxjD1AD2EsQktmFRVFmM4BIXYUOKGMpUxTYZ5vRgGD9ydgEun
 IbzyRHaIE7oj4kM5qjnZhR0CJxqdTQUMocu9rWQKh3YJ73FDUZFb03rNqOwaX27bTxGwjbc8STGR
 Us03V4euCNLi3QHIB.y0ozNll1DN0wWGNdcmU_MK4jwhepbL9OW5Ch5Rl1hMYozhr0tXY3WbDbV8
 7en3QTHAZY22GYvsgHlT0nGN_Ph_cJFpnk4MzyI6gEgTvLMeOcV28JYoYaaibkxMOOZgmmCZ_iE.
 gtwxR1_OScRBMm_jVVBr_oIALi2dTbtSwZapIzvXdEp2J4hpZZdc.CZ7nVh4N8zhxt6ry6BqL7x.
 SZksVudpmIaQt5okvURfzkkHc2Ofo2i_1yvKSUm9ZvJwkNegrlFzpFoW.KOTsw_vqRk1jvWObOIy
 CYdcmb7CeyY_aImWi4eEG8J5Kkbzctsj3a.bDWoLpKa03RvpKqIeWr3bXqcn36FoNyekcf2zBTPb
 JLvodHeqD5FmyRp5nSdLj1UohPkl9Lk0A184X40jKBSsFQknUai1F8UMX4mEbHsnc501F88qQGkC
 zTJpir1NTBt56VgSWkLJtC0R27AkLu9GRqmGISaXWkvZdFf3R6J_KFhtbKCv8gYsAKfyKOYZNzKH
 XqNatE4ZcpZqF5bo25O0ztASvf7VCwYFGFyDii.UY169WHT_vC_nqjkbfnY8649Wq0YPKdwxrwJY
 H7OwFReQohbRYwvxBTNiaK3OTJuid5UGd5PTGyFPK3W927ZGI.JnRaV2kZz08gmFKjf7S3wzCU69
 uQCKe2AL.wd2Ux_SsZ.1fAL8vWwzw6JXtsvOy5NB_1_8OPHcHms2CrPGVTE1Lv2o0LC4oIQgxeCz
 BsKJ.eg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Mon, 18 May 2020 19:44:42 +0000
Date:   Mon, 18 May 2020 19:44:41 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <1340666890.737774.1589831081562@mail.yahoo.com>
Subject: Greetings to you
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1340666890.737774.1589831081562.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Greetings to you,
I hope that this letter finds you in the best of health and spirit. My name is Rose Gordan, Please I kindly request for your attention, I have a very important business to discuss with you privately and in a much matured manner but i will give the details upon receipt of your response,

Thank you in advance!

Yours sincerely,
Rose.
