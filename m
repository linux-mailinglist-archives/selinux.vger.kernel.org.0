Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2478E1E4ABA
	for <lists+selinux@lfdr.de>; Wed, 27 May 2020 18:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391476AbgE0QqF (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 27 May 2020 12:46:05 -0400
Received: from sonic307-15.consmr.mail.ne1.yahoo.com ([66.163.190.38]:41714
        "EHLO sonic307-15.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390066AbgE0QqE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 27 May 2020 12:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590597963; bh=4RUKhG0MsorRuTFWk3IKXk7iyxpxqMUqyq1xoFppTaw=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=XV2h4N9q2trocfRvbMfbAm47mC6BlnPWOOYiCSThd6X1U1nY6oR6RPbhbp8ZAJe/XTaoH1//U/5hw2tqznUi69FVOs82ikDMiOggV+jPFoNE89yy7TH4kiWyrNa1vJ1olTPsPiuKfsnz9V1JHhxci1cH7b5ogRJ2nlVyID8BcLi4cmbGHeObVvxvxgwNEm1gm9hnQtGh53PWngCshLMJmv8YsdREBtaxkc0+7FTRTnHFQRPhZPFsI+y55sh1bQIdhL/dN78WEscXebEBN86es4JVM7eolk8SnK6vyvi4ph4mFzNkJlmFEUirbd/K4VHlztEk73Mva4VSzoXxz/aUOA==
X-YMail-OSG: IKruBnUVM1kuwlSdjAURCpF0gZRNauOK_K.x.x13adDUYJ_d0VdJjXj7m83J_pC
 0Q_2amgXYltWN7kom71kxzqA1nnxIqVzl5jWj2fAimlr_L5N_jZKnSTJsh306EYocPwbDB4u_jVF
 BLz6GGDeDCnsuJA9Ucs_O8rC2pIAdw5QzyChK0Jmq5YDjg7NJIaIh9XEmv8TqwmnWCHvaN9_Z0ES
 3ri2c2f6HxaOocm0QgHPAtjQQvUpERm7pkYvJbs.eAlutOIxtpw4slD4XKtRTBPP0KRIyOX7A7is
 sNPL9oB1.d4To8UdMcsiSOeFcq7qTcRZ1idPij28KYfY1Rh0I_m2VywBzoL7S6baqPryoWFdS7Qh
 wDDvQaqhBorhDu5zPD7nvCevKlYKQ1Ufh8WtSa0Tt.a6XOrOIYGedLoqvi3uJR1uan8jZKZSDD80
 fGRsYi7PTyuaKrTQ3FmhIlUH_UomBV3nj6OOt0AdlJayegQw3.9Mxx9lPrX8Xwt7fwkQh66pJ5hP
 Hs8b1wk2hS.OgoRkXjubSIL2O4I710JDknRqYBAP4MTiIfldfnx9.VFe3fjIbyY5Jt69m3gSkdBh
 UiFV_JalgIg36D_7jBwoHzFRfRNSVS6J6ZFsk03mat.2NDgJEKtTUKw_jrJqrKKdBAoTm4ecZEbY
 9RR3alEnJGo_bcFpuAOdWLzN41uwYva1yYBtPjpQvK89fD7PqPtWxaS5IFyqNWB3xfw6Gc_9LHVC
 fY.MjXPB9W8kf90_OVGldF1IQSEmFswPt7jgc6s3W1qgdCUPqrC2kvvM4cG5PeWvEtYq8XsFWGB9
 TQBI8V3ZX36u8mLSlQ6QoYUuIrIEyLn0b759PMMoYyvV5cXf91qw4caiVu4JshAF8SDqCKSlsSGE
 mNl0S92k1lEj3TJbMAK.cOGswgyCZhNuKIcYTFvA7Nix0bkQgvkq6dCor6dlBJXZNPpCDFdT4PPc
 .WQ_g3ABtWj4HTc_guS_AgXgqm9clpWUSCz1q_4C_nEeo9Ic1OklGQWd5OIKerEJYwmLARbpjRbP
 RsWIa1FbmH_h2VvuNoy.Cb21URXG_J0CnW79gyDUHquOMcJNZJLMRkNVcIzAgjrjAkD7XA7Thr5E
 gZeqG9OAfF35nyVqXKglOtPiOZuznMUawsolcOYSHicDnyOlEOuCNIHQLEaOm6v23VFrwutMSjkD
 Yh1F1n6ofvnJ4SnOKzMOinXbU_WsnIwusWJ6A0.Hd_hCqXVL8OleQ9oVeo9C2MGoL2P4ii2FPJEY
 uI6wNvHnwyXgEqhsjpcoi2gdghsRiw0x.8dxVXhgUZZpvw7xzbmyLS1PC0buX38ZHFWiBRdVuB.O
 3_0EA5o_nayTilzjgmUKMTWMU0UDJ2Lps.8xgYHx3tp_KKuZShVVz_sTJAorbiDJ87AZxm41UZTM
 CXnwxQ_BcTAQCi8zAyfmhmii1rodpPhKgjw--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 27 May 2020 16:46:03 +0000
Received: by smtp419.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID b0e54431ea93744bec34cb09feee7ca8;
          Wed, 27 May 2020 16:46:02 +0000 (UTC)
Subject: Re: [PATCH] capabilities: Introduce CAP_RESTORE
To:     Nicolas Viennot <Nicolas.Viennot@twosigma.com>,
        Adrian Reber <areber@redhat.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Pavel Emelyanov <ovzxemul@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrei Vagin <avagin@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>,
        Kamil Yurtsever <kyurtsever@google.com>,
        Dirk Petersen <dipeit@gmail.com>,
        Christine Flood <chf@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Radostin Stoyanov <rstoyanov1@gmail.com>,
        Cyrill Gorcunov <gorcunov@openvz.org>,
        Serge Hallyn <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Sargun Dhillon <sargun@sargun.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Aaron Goidel <acgoide@tycho.nsa.gov>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Eric Paris <eparis@parisplace.org>,
        Jann Horn <jannh@google.com>,
        Casey Schaufler <casey@schaufler-ca.com>
References: <20200522055350.806609-1-areber@redhat.com>
 <dc86dffb-c7f8-15bb-db4e-be135da650cc@schaufler-ca.com>
 <20200525080541.GF104922@dcbz.redhat.com>
 <a75f3f71-66cf-e615-2cd5-86ac65a3bbdc@schaufler-ca.com>
 <20200527134842.GA250149@dcbz.redhat.com>
 <f43921ac-2e55-7d9d-406a-d0f4cfd8ff93@schaufler-ca.com>
 <ac167440b8b64f02a034dd94687b8aee@EXMBDFT11.ad.twosigma.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <518a910c-b526-b7aa-f9f1-ddccb992954f@schaufler-ca.com>
Date:   Wed, 27 May 2020 09:46:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ac167440b8b64f02a034dd94687b8aee@EXMBDFT11.ad.twosigma.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.15959 hermes_yahoo Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 5/27/2020 9:37 AM, Nicolas Viennot wrote:
>>> If I understand part of CRIU correctly, then we only need read-access 
>>> for the current user. I am sure Andrei, Pavel or Cyrill will correct 
>>> me if I am wrong concerning map_files.
>> If I do "ls -l /proc/self/map_files" I get the link name and link content.
>> While I can't open /proc/self/map_files/7fbde0c3200-7fbde0c3300 I can read that it points to /usr/lib64/ld-2.30.so, which is something I can open and read. Sure, it's an extra step, but it's no big deal. It does raise the question of what value comes from disallowing open via the symlink.
> Reading the symlink doesn't work in two cases:
> 1) The file has been deleted

In which case you won't be able to read it directly from
the symlink, either.

> 2) The file is a memfd file

Ditto? Or is there some other problem?

