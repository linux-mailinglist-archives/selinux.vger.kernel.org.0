Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3115D342
	for <lists+selinux@lfdr.de>; Tue,  2 Jul 2019 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfGBPoo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 2 Jul 2019 11:44:44 -0400
Received: from sonic311-30.consmr.mail.gq1.yahoo.com ([98.137.65.211]:37803
        "EHLO sonic311-30.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727093AbfGBPol (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 2 Jul 2019 11:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1562082280; bh=Ci+wW5Si0CG7QvQYsprhGqBTnZe4IsiHvGNzOf95aYw=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=EUjIbIKVjJWLJhUwDsxjKdSMoUWco3J/9kMPKDafIyL60i3lwYRFcoFnyADSriKXFFXsDxHYiFToekxFpfVSiS+JUUqYhIBvNvpZBrVFUKhlsagQm7gwGZBYuQ7OOOKLrE7aVCiSLLCXtJCKX59P7t7RTRXr9Y30Al5Gkn6ZDx6TzMbleIx+RipKvZpz6uJdurQWluw3FEBM4lYDlrl3UhBy5tvP2OAnGCPPF94LLTNU/DFZYztlUmAG8qUaek83xP6Rlvhn8Y2KNV41hR17brHO1OzWVyYJzSSt+z08ni7Mdl1AcXY3kQoqs7NdSOQgjCLevMtLpTZTsmuYaRlJlw==
X-YMail-OSG: 5fvj1fUVM1mlR02P0Z1ibX9X1zrxalSWDH4A5tj_zITyF3QcCiyhNKh1o.Zy3Xm
 zQksLi.VOFpxmlF_Twxo16MmjmFZBXZ.QPe14yVyz4.1n6wVabjMqAh9v_bbdNm14.Ydg79MPu_p
 3G0d9NM.m4qULfbiVAXWol8VmraS_wyp1QXCpOCk7mwHvxg6e8Hn10OJ5tvqSSvaaKqyWDmVxZ.J
 szGEHkPXXP.eEzrkiXzMIAh3bOKLiXxpXZtCZn4nPv8kP4sHYsDFKQUJzPnJ55l1Vp9xV7k2YicW
 NrHnuHtWrBUZzhKVjQX34MBa2s4E.uFOgcGmel12iTAU_pnvIVruXzuRKw0x6cGKPRX5FteymRkd
 UiXni57Daihgws_2HbQPktVqyWsoVwtaqgbY6bk0W3t6jc.rbHvwxxaXM_Atd4KfKPRuNSaq2cMc
 lE9m8zMhYT50LMWIEL.TFyiWtm4LwUvX.I0ErIcsZbgBXYhjRJa5JH0eaUg8R.ZA3RGmDp2k2WF5
 hr9jGLM0j0FV3LrRcuS4h6DnXK8umnQv7W9v_ziMGznkOijO4vhtXI_6Hj0nTt1RzX9wjvZd5zS5
 er8chCoLBSghLyioERe_85FzHQVWpxNOG1KPPC0QraSEmbniMbp6fhsRdLg9teQkOXB18Yfs2_Mm
 7omtD2_IojDFMHlajC9l1zGf31z_dYOGtD56PRKnjSG1Lc7hy8VXdZ6JVsgHwbYkbKvc4iMYhMCo
 7cVWh_lvhUokQJ.q4jDna4w4ucVMfF.cC3FpgQo8GrrSluMgguLLJulEuP6nSn7TIoKWQtlEveKP
 QJFzV3ZE8BxcjWdFJt.sql7HPJKN1KLx6B47gUWjg9WVr7UtsKEpJAdmthWLxSOx_jb2Q4MIcAiW
 Q7OGaMvO58wzDmDnzd0MlkhZKiNOsdSqbrXJe3Zb2xK3RZEaju4vmZHdRPBHEPkL4sfgv.m5i5w0
 qVmvfdBLQYrgv1RfyRBqOKMf9GnYteLkbqNadZ_10LLGRMANdKratYSfAl6_k5c7EyaJt6f6lE7S
 6XtFHpULvMxXhYN57nXdUnRCtGFUODVNhXCsa9zJtXi4cyP9KZ9BqLj766f6PnRLySkpdA3RLR2b
 GhAKN_CogHiVecIzctrNwPMMUft6PJbmelma3haoR0AVcZ0bc7kHydLQYESvhuBW1VTNtgjevjeo
 eAh54VgJM2zIMiQOYIewFzHpkARfJcURgOXZWf_3zK.02X085ms50w5Gp4IyA585PSpBDsopUPov
 S9zhLwG9uDSAOBcWC_cJugO5ZYw--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.gq1.yahoo.com with HTTP; Tue, 2 Jul 2019 15:44:40 +0000
Received: by smtp423.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID f27669c21121ebc91fbbd890c8eded8f;
          Tue, 02 Jul 2019 15:44:39 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/3] x86/sgx: Add SGX specific LSM hooks
To:     "Xing, Cedric" <cedric.xing@intel.com>,
        Stephen Smalley <stephen.smalley@gmail.com>,
        casey@schaufler-ca.com
Cc:     "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        "jmorris@namei.org" <jmorris@namei.org>,
        "luto@kernel.org" <luto@kernel.org>,
        "jethro@fortanix.com" <jethro@fortanix.com>,
        "greg@enjellic.com" <greg@enjellic.com>,
        "sds@tycho.nsa.gov" <sds@tycho.nsa.gov>,
        "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>
References: <cover.1561588012.git.cedric.xing@intel.com>
 <72420cff8fa944b64e57df8d25c63bd30f8aacfa.1561588012.git.cedric.xing@intel.com>
 <b08798a5-65f7-f96e-1c04-39dd0e60c114@schaufler-ca.com>
 <960B34DE67B9E140824F1DCDEC400C0F6551B8D7@ORSMSX116.amr.corp.intel.com>
 <9f525db2-f46b-b4cb-c4e9-b9dbd18ed4d2@schaufler-ca.com>
 <960B34DE67B9E140824F1DCDEC400C0F6551B975@ORSMSX116.amr.corp.intel.com>
 <f6f16990-0291-c530-61dd-dcd26525285c@schaufler-ca.com>
 <CAB9W1A1RpM_9D_49E1VauuKE1tL=TyfeATomv47HX4FONnjA4A@mail.gmail.com>
 <18833f2e-9d18-1f39-6bc5-9242910ab25c@schaufler-ca.com>
 <960B34DE67B9E140824F1DCDEC400C0F6551D585@ORSMSX116.amr.corp.intel.com>
 <f59529e4-6cc8-2405-d7db-2519727f9a80@schaufler-ca.com>
 <960B34DE67B9E140824F1DCDEC400C0F6551D7F7@ORSMSX116.amr.corp.intel.com>
 <63c92ab6-dc8d-826b-b8bf-05ad262f06e4@schaufler-ca.com>
 <960B34DE67B9E140824F1DCDEC400C0F6551DBF7@ORSMSX116.amr.corp.intel.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <9e45df1b-3aac-e851-4ef2-5b262f5139bd@schaufler-ca.com>
Date:   Tue, 2 Jul 2019 08:44:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F6551DBF7@ORSMSX116.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 7/2/2019 12:42 AM, Xing, Cedric wrote:
> ...
> Guess this discussion will never end if we don't get into code. Guess i=
t'd be more productive to talk over phone then come back to this thread w=
ith a conclusion. Will that be ok with you?

I don't think that a phone call is going to help. Talking
code issues tends to muddle them in my brain. If you can give
me a few days I will propose a rough version of how I think
your code should be integrated into the LSM environment. I'm
spending more time trying (unsuccessfully :( ) to discribe
the issues in English than it will probably take in C.


