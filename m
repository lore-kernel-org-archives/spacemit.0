Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78819F12D
	for <spacemit@lists.linux.dev>; Sun, 28 Jun 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782625750; cv=pass; b=B43FtUv8xskuZcvRQcCer+hoMS3dJwFfXqoRNFh4eRA6+dnRgc/l4KvOQA0NJ6GuHCP82N1dx2zc9sr8C2ryNIqejtA0s9yBUX0GXlD3JrtHHTpZjBTAJCPajfVBh2kk13tOCQbkq3urpajRHZPKuWkvTGfQB7gQpH2z9+FxNIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782625750; c=relaxed/simple;
	bh=J2BVCEpLCnErlmCXfv0FnU5YR1md9y8+1viacZEFezI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbtRE0ydkChCV5wPM9/k+bRAmcbSdbchRb8II8Jwgi5rIzkooKBNFJ4XGEvPcn11CS74xcc/M+6ibuvB6Som2DBn8CI4avi6iLEVhFGjOo+41rLpwGZOAI5YmuTs7zkN4f0y4LcLQz3oSRVUNWvdCXMz84Tg0zBoink8TfwbnyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=aalbAJaL; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="aalbAJaL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so15000045e9.3
        for <spacemit@lists.linux.dev>; Sat, 27 Jun 2026 22:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782625747; cv=none;
        d=google.com; s=arc-20260327;
        b=HWJvsX0jzppfwjDoQu9WB9XQf6t1STfIaG49fcPzsxDZrld6AUPxu4Slfw4GiP03CN
         kAtXRI9L5/ecvnWfPeXDQsef9DlSn+S8O070oUta80KQLPYeqwgmbduM1L3GZz0Nps6e
         fGGLygHh2fv03AxneyrS/ywFPiNrsFq4cDn5C9mmL8mNviy6IdUib9G1N0tltg2LvMM/
         A4AO2soyh0k88XyJl2FZyQXkJ0Xy2VEv8B0Pm7EuOo15yVGgdUWDRDT4y0no8Lxu6YUh
         LGS0cNi+QnMr+O+QgSzb9KI3HTpwWw8lGDTeshL/Lnf3h2cwlnV8fZ9TiOyub7HR97Zm
         wsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nk/+nqt1wza5j66BqfL9c5z5ytm1b6XImAIMAGcBvRM=;
        fh=bhIRzxS47hEfjBV03P3J3wjMNiWxMBa9QLfsxfdTDA0=;
        b=eC4Mm2GmQC4Qc7Src42eFXCgUEH/YusGmYXVnMJghAKnO2Sdp27wNMvIGJ+W2ZPO2w
         pl4jd61k9RcdVfIT0PVv+WYCg+0oy7Q4xMUjkquPgn5EVJTvZD+0+r6bOFPMmNw2ohgq
         p3t02Y6y4XiOlKJfYqpZ2RGigMpFJAqo29zMWZsx5e3GQFRQOmddBapjIRXHhNV10GD0
         m+q3f7yYRbKgoEoPPmGvdhL3szHIgW7WYs5GVsiDydCByqSyU0MxHa1RiGHKHB4FIZLg
         BU0Suz715Wc4rgt2wJvLncqNAFb2FnC7AhT8Mg9x38/mTT23aYh7t0KTPdOJ3q3BKHwW
         8TEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1782625747; x=1783230547; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nk/+nqt1wza5j66BqfL9c5z5ytm1b6XImAIMAGcBvRM=;
        b=aalbAJaL6fFta6gBmbl9BUx9Mjaf2EyQuHff+eyzSauCgGk6bU8X3hAtJOhRIoEkPB
         CqsBpoYfL/0stXEiatSCdtijpI/KNJnqk5wWO9vjWiIyJSc6shTOLDJH+iH8/RZLDEg3
         DGU0Wrju8R4XxqFlPbj6Xs/Keh5k1H28rUzdt1E7KvAkXPQHZqKcPhHThpM8R+ALhwJN
         Q6tKj2KgP/mP5TC3RoaMtfB3HoGr3Fx6hiGA0Pol/IPQfJKK0JVAWnNLbW3jpNEVutWt
         1v8XPQ3GGl3bFXUmRz/AskC4He/n26hjOgJMzBcWsXM2VS6GwdiKU03gVaxmACA7CRnq
         VoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782625747; x=1783230547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nk/+nqt1wza5j66BqfL9c5z5ytm1b6XImAIMAGcBvRM=;
        b=dTDf2z0k+I6V3nwBLhSfhNOoGQ46T8KHGe4/fFe/4590TY901lMFNyXpovQPwbmRFa
         SUI9j17lvxAC83+HfXfovWz9ngX9uvQbUdZRkClT2rUhD3DbceCCAU/g8MHc9flqTKDw
         gaaPVygADUD5WUv/55cXI0Kh2rgpYhTuYQ5nq/6OzQz/M0kUihRnC/pJcDAUmEm+MkXc
         lxnuyCN6fcUg8ca0PvUqgL5nPWjkwxz3gJFPKkfBnxvtFyESpk8p6+rk48ELIM2kqZcl
         DZYX6Gn3MRvLHQqM/HMWIybWROXcc5ytf9HIXMHI680O8WY9OrXZpyDU7hzc2AV3WdBy
         bkeA==
X-Forwarded-Encrypted: i=1; AHgh+Ropaxcz4VvY6wBkIb1tb6Hiv1ye/Nnov5SvmBAp5xCIzPExS0iNi8Hrq8ZbNrgEZUBiugqyNsy+ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIATgOV/Yeqw0r3JF6DucYubnV3s9/aLTdtxBomQNNnrdno0I0
	UenLnuhdwMVr1TVNrUoKks3W/JFG0sMWUrE18a6YdQuMdr389/zk8A7OOScH/inK8LOIdgT2L4e
	MVwpkj95HB7ZZblvKX4MbgK1dZ9vPlzhZgNaTMcRSpQ==
X-Gm-Gg: AfdE7ckk4SeV3EZ3m/Q2fy4OyS9Od9Ua3+PIMD4A+fYjOhctyz9N1NIScZTiWuq2qsk
	Il1JUmjl5gnnhQfAp5rA8MsNViWqLuPSGmHyaxzzjDmDNr0pJR+XgVoIX4i2t6DD/gg8zkBZFVo
	KjiCwFE/c/dWTGbJQdWkpTtipRqykAJtuwYmaJbSpv/nyBv6LL9VOj0Qo5Zqp70IGgROhqJmpnb
	zvc/VLcpuJx8hhUXpx/4lRy52eXPtxCmSS/bo7z5ZvI/XOz3qgM4iCxAvlzH5dJnpFQESbtYBJU
	0vS6Ruu8VLNLMfYUzt+anHd790VqvkdHf03lWPjSNreOmrU851jjxvoK1ZX5vXeTA3vyU/M9DXJ
	Bi1gY1uwLcd4AfAM=
X-Received: by 2002:a05:6000:708:b0:472:7ded:66ac with SMTP id
 ffacd0b85a97d-4727ded6837mr2249229f8f.7.1782625747015; Sat, 27 Jun 2026
 22:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623-k1-fix-addr-v1-1-3dbde8c03bd6@pigmoral.tech>
In-Reply-To: <20260623-k1-fix-addr-v1-1-3dbde8c03bd6@pigmoral.tech>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 28 Jun 2026 11:18:55 +0530
X-Gm-Features: AVVi8CcRx0fpRSoUIgpfsKnuWLX2LwaXwn0DsPE7t7DmDO_IzTWLtUhYbtl0-Gc
Message-ID: <CAAhSdy3DzJaQg74mSeWhKqN9wOLWVqp6wKru21mzPbymCzyL6A@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: spacemit: k1: fix wrong address definitions
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 8:20=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> PMU_AP_CORE2_IDLE_CFG and PMU_AP_CORE3_IDLE_CFG are not continuous with
> PMU_AP_CORE0_IDLE_CFG and PMU_AP_CORE1_IDLE_CFG. They are at PMU AP
> base + 0x160 and + 0x164, matching the vendor OpenSBI definitions. After
> fixing these addresses, the intermediate cluster offset macros are
> redundant now, so define the wakeup and idle registers directly as
> PMU_AP_BASE offsets. This makes the actual register addresses easier to
> inspect and compare against the vendor code.
>
> C1_RVBADDR_HI_ADDR is also corrected according to the vendor OpenSBI
> definition. This was tested by writing an invalid value to the corrected
> address, which prevents cluster1 CPUs from coming online, while doing
> the same with the old address does not affect SMP boot.
>
> Fixes: 1f84ec2a ("platform: generic: spacemit: add K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/include/spacemit/k1.h | 46 +++++++++++++---------------=
------
>  1 file changed, 18 insertions(+), 28 deletions(-)
>
> diff --git a/platform/generic/include/spacemit/k1.h b/platform/generic/in=
clude/spacemit/k1.h
> index bd666346..7095bc08 100644
> --- a/platform/generic/include/spacemit/k1.h
> +++ b/platform/generic/include/spacemit/k1.h
> @@ -25,33 +25,23 @@
>
>  #define PMU_AP_BASE                            0xd4282800
>
> -#define PMU_AP_CORE0_WAKEUP_OFFSET             (PMU_AP_BASE + 0x12c)
> -#define PMU_AP_CORE4_WAKEUP_OFFSET             (PMU_AP_BASE + 0x324)
> -#define PMU_AP_CLUSTER0_WAKEUP_OFFSET(index)   (PMU_AP_CORE0_WAKEUP_OFFS=
ET + index * 4)
> -#define PMU_AP_CLUSTER1_WAKEUP_OFFSET(index)   (PMU_AP_CORE4_WAKEUP_OFFS=
ET + index * 4)
> -
> -#define PMU_AP_CORE0_IDLE_CFG_OFFSET           (PMU_AP_BASE + 0x124)
> -#define PMU_AP_CORE4_IDLE_CFG_OFFSET           (PMU_AP_BASE + 0x304)
> -#define PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(index) (PMU_AP_CORE0_IDLE_CFG_OF=
FSET + index * 4)
> -#define PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(index) (PMU_AP_CORE4_IDLE_CFG_OF=
FSET + index * 4)
> -
> -#define PMU_AP_CORE0_WAKEUP                    PMU_AP_CLUSTER0_WAKEUP_OF=
FSET(0)
> -#define PMU_AP_CORE1_WAKEUP                    PMU_AP_CLUSTER0_WAKEUP_OF=
FSET(1)
> -#define PMU_AP_CORE2_WAKEUP                    PMU_AP_CLUSTER0_WAKEUP_OF=
FSET(2)
> -#define PMU_AP_CORE3_WAKEUP                    PMU_AP_CLUSTER0_WAKEUP_OF=
FSET(3)
> -#define PMU_AP_CORE4_WAKEUP                    PMU_AP_CLUSTER1_WAKEUP_OF=
FSET(0)
> -#define PMU_AP_CORE5_WAKEUP                    PMU_AP_CLUSTER1_WAKEUP_OF=
FSET(1)
> -#define PMU_AP_CORE6_WAKEUP                    PMU_AP_CLUSTER1_WAKEUP_OF=
FSET(2)
> -#define PMU_AP_CORE7_WAKEUP                    PMU_AP_CLUSTER1_WAKEUP_OF=
FSET(3)
> -
> -#define PMU_AP_CORE0_IDLE_CFG                  PMU_AP_CLUSTER0_IDLE_CFG_=
OFFSET(0)
> -#define PMU_AP_CORE1_IDLE_CFG                  PMU_AP_CLUSTER0_IDLE_CFG_=
OFFSET(1)
> -#define PMU_AP_CORE2_IDLE_CFG                  PMU_AP_CLUSTER0_IDLE_CFG_=
OFFSET(2)
> -#define PMU_AP_CORE3_IDLE_CFG                  PMU_AP_CLUSTER0_IDLE_CFG_=
OFFSET(3)
> -#define PMU_AP_CORE4_IDLE_CFG                  PMU_AP_CLUSTER1_IDLE_CFG_=
OFFSET(0)
> -#define PMU_AP_CORE5_IDLE_CFG                  PMU_AP_CLUSTER1_IDLE_CFG_=
OFFSET(1)
> -#define PMU_AP_CORE6_IDLE_CFG                  PMU_AP_CLUSTER1_IDLE_CFG_=
OFFSET(2)
> -#define PMU_AP_CORE7_IDLE_CFG                  PMU_AP_CLUSTER1_IDLE_CFG_=
OFFSET(3)
> +#define PMU_AP_CORE0_WAKEUP                    (PMU_AP_BASE + 0x12c)
> +#define PMU_AP_CORE1_WAKEUP                    (PMU_AP_BASE + 0x130)
> +#define PMU_AP_CORE2_WAKEUP                    (PMU_AP_BASE + 0x134)
> +#define PMU_AP_CORE3_WAKEUP                    (PMU_AP_BASE + 0x138)
> +#define PMU_AP_CORE4_WAKEUP                    (PMU_AP_BASE + 0x324)
> +#define PMU_AP_CORE5_WAKEUP                    (PMU_AP_BASE + 0x328)
> +#define PMU_AP_CORE6_WAKEUP                    (PMU_AP_BASE + 0x32c)
> +#define PMU_AP_CORE7_WAKEUP                    (PMU_AP_BASE + 0x330)
> +
> +#define PMU_AP_CORE0_IDLE_CFG                  (PMU_AP_BASE + 0x124)
> +#define PMU_AP_CORE1_IDLE_CFG                  (PMU_AP_BASE + 0x128)
> +#define PMU_AP_CORE2_IDLE_CFG                  (PMU_AP_BASE + 0x160)
> +#define PMU_AP_CORE3_IDLE_CFG                  (PMU_AP_BASE + 0x164)
> +#define PMU_AP_CORE4_IDLE_CFG                  (PMU_AP_BASE + 0x304)
> +#define PMU_AP_CORE5_IDLE_CFG                  (PMU_AP_BASE + 0x308)
> +#define PMU_AP_CORE6_IDLE_CFG                  (PMU_AP_BASE + 0x30c)
> +#define PMU_AP_CORE7_IDLE_CFG                  (PMU_AP_BASE + 0x310)
>
>  /* power down */
>  #define PMU_AP_IDLE_PWRDWN                     BIT(0)
> @@ -68,7 +58,7 @@
>  #define C0_RVBADDR_LO_ADDR                     0xd4282db0
>  #define C0_RVBADDR_HI_ADDR                     0xd4282db4
>  #define C1_RVBADDR_LO_ADDR                     0xd4282eb0
> -#define C1_RVBADDR_HI_ADDR                     0xd4282c04
> +#define C1_RVBADDR_HI_ADDR                     0xd4282eb4
>
>  #define CCI_550_PLATFORM_CCI_ADDR              0xd8500000
>
>
> ---
> base-commit: a8be5e9478be08f09a720f7013ec30d6e2bd9fcc
> change-id: 20260605-k1-fix-addr-e25f6231cfb1
>
> Best regards,
> --
> Junhui Liu <junhui.liu@pigmoral.tech>
>
>
> --
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi
