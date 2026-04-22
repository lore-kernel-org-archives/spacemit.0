Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0DE2BEC43
	for <spacemit@lists.linux.dev>; Wed, 22 Apr 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838473; cv=pass; b=aSk78A2V77zq12NJeK8QMp2LLJii7Ki9OyatmvztWrdd6XLxlwNQabfzzQNVN0TTRURuT/ZWCCUdvx1bCycTDu0O24mE2e2LkagOevjnLv2+Mjz6yXTIG38AehYm0f1Zh7NTHw6tYWywUIh9WTLqhl470n+bmJISwkm30vrM2ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838473; c=relaxed/simple;
	bh=jeF7sRuCE/tgNWpWkEp8CGIbKh6Ye/S47INTgDZFQCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=EDMRqiBgfzHoRWbaX6KLHAmrAxaf3sTrwltV39N5QVNcEpq603+SEkYkM/VcZB3kD9SjAJd3ClSVOM0BpyUR+SdoIBC21Lqkg+bH+qPs6JSS7E9qyn4EXy+AOt1eWXFZr/2ljWFld65S2jnS3bYp9ZknrdvD0s/+UlMcfZJ5xE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S08Iqoih; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S08Iqoih"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba8472c1613so471644966b.0
        for <spacemit@lists.linux.dev>; Tue, 21 Apr 2026 23:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776838470; cv=none;
        d=google.com; s=arc-20240605;
        b=fDGCUdf30ruUlPJPT0tuf5+DpgLhdNqwkDKCai100uxrM0vwteKItrtGwqG8qzUL8d
         0kMaIYQzHZ0oQG9cAcC/BHxwgwA6AwFOb8tdz/yqrX3dSGFb7Qa7KRkfEl2F1ExLYBeS
         eRndzcQ3j8vJ1GCKQZVhKcSzF9oitdHlbveMItRazikDRvWtEt5O3xbr7A6bbs9LqB8l
         ZtJ7mYgxIcuqYcZWknZmxWw1hO2o0rBT37CKxiqbK8ilUGa73WunW+799Uxl5jEdHTm8
         54UkB6YvlHUtLQQ9tyg4HmGfGmyDeBs6k429g0QL+b1xmuZD+g3dechUGh+7EuLv73jU
         fXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        fh=YtHkRpSMjgVbIc9shU+LDiW7eH14/bYYASwej/nqmZk=;
        b=QH1rMVka8JCf1fxItMImHj4VaZ4BBwV4Ye7f+Gl617yyvtO6VmjGSqwvvDnoOl78Jf
         VH99EC876vPNIWlazuHZnPO1vlix1tNvN8o5xXFD4qYWC62/BO4ec2N3AayWa81MKtGi
         RPGxPlMx4lVI7xZEArnBSUtycxgPe+sACTBRGRVoCcBVBm+N27qJDibRaFB0/OFGdFiS
         UftLYL1Ktkr1RRmxaWLWl1uxZj9V27794pGG8p0BfGCsSdnBSOCVWGzDhQXQN0hj6plN
         NfQCvJerHhoifoGU/cmit1i7keiR24Q3c6Tt9dZk5tZrFIzZWieIIIgvUo2bmN/rc4Vh
         Me9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776838470; x=1777443270; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        b=S08IqoihhCTSQAJd9wtydceEAXcpTiNgmWc0Sn4tDzgWaRfxEq1cKcnI4plxyfyiuH
         nlb6Ndyoxt7LscvDpfQaYWprkzKthNzl/cO028DttSxHp6UhOOg6jEr5yejEnFujP93B
         YrgDx9dr2ZCdo98oZNrrAZTehag25bEyug6TdF8D6uqkWTdOtnXFo5NTikLiADH5w/ff
         Q/qcbYmeiFSSbaXJwZJyF6qODfv/3QMYXoU8lk0QC+6Sm6Jrx5ycnO8LF20D5+61Waa6
         CYVobWDJMmsU+DoTM7UC4ohadFcvPCRzfMGxhlPwRjv88kSnx20eZmXJXs685zko+kuo
         yWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838470; x=1777443270;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        b=atmm2IJ/40z+vSpo/yaVTLs4VJ6B1cI+nkx4w0up/S2/P+DOB3CW6usKkjEWIcYgyL
         ZS+8QDSC2b2BMYpNpYW4GZjw5y9ypKT0LW+fSepwYFH4c7Xf09XEh4hpDB8FDmO5BP9y
         c3AzgeOQSGohXxU4SibZucM7BfaAAoKCKiZEBIKkNCSafYi7JF8mW/G+ttp33g9XrX/L
         FXcuFwPAjmIDrjxB988c9awGXD0toMSnDF2AwEsb3mxUAgAvhmEl9OSJ1Yyq51Smt/Oa
         wzDvxDV8QXAM6aEGluy6SM//INgkm5ha9kitRGQ7/KVqPN4QkGsoxDX9eI5YbhLten7B
         CJVA==
X-Forwarded-Encrypted: i=1; AFNElJ+EwCQPkJD1r85/+tyIobWYh/lwD/L0kL0xA2EJFv2XZm3giebXGLDmlcG4+/xzuieGOEw1Amp1TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkLOXfdQ5jL7GB005+UMgX0sI4KFOcyaHNDYcBhsBd/bXtTEmT
	2u2k+9HaFvppnafhWE8t467Xx5Tlt/sPoZgdG/HWWDNOX4mOKDSyBq0BId7GWkGD/sMAzDMnOxp
	Ux3Is1/FA14vHGvb1T4is3cr8VZFDyCg=
X-Gm-Gg: AeBDiesAAT0VvteidPR/2NwxoFGZTfO8syf6ve2fah6GY2D3fp4fj/KcHRHmwqvDi4O
	JiwLcqSisXkCuPvdD+ylE+FgipM/Gwj9M14EN0XeG42OpUzQPdZ645ReZs+jG7JVsTXLzbc6ukA
	i4CARp3ui0AVB5M8ji8ALlF0g3p2O9gx9WyyVe7bwjfHJubEm87h6wS4MrnMK2Pc3kF4lFQAkRX
	agxpteSqtrt5vL6hZFlk9ZPG9M8mUTjVTkSHbHXGWA061/RQwNMMMR91vQmfjkiVGUedcV1vp2l
	BNm2QI4w8nu7NDI=
X-Received: by 2002:a17:907:1588:b0:ba9:3162:182 with SMTP id
 a640c23a62f3a-ba9316201a6mr261303166b.19.1776838469610; Tue, 21 Apr 2026
 23:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net> <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org> <aeevr6Zj3Pwm9wux@aurel32.net>
In-Reply-To: <aeevr6Zj3Pwm9wux@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Apr 2026 11:44:14 +0530
X-Gm-Features: AQROBzCenitl4Odlgd_JfKGymltQZPnNxQ-FB_fBcOyLvkgF7DPs6UdEgDyDJDo
Message-ID: <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, Anand Moon <linux.amoon@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuwei,

On Tue, 21 Apr 2026 at 22:41, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-04-21 16:10, Shuwei Wu wrote:
> > Hi Aurelien,
> >
> > Thanks for your addition.
> >
> > On Tue Apr 21, 2026 at 5:16 AM CST, Aurelien Jarno wrote:
> > > Hi Anand,
> > >
> > > On 2026-04-16 17:07, Anand Moon wrote:
> > >> After reviewing the Banana Pi F3 schematics, I confirmed that Buck1 =
and Buck2
> > >> Both supply the CORE_0V9 with 0.9V=C2=B11% rail. To resolve the rest=
riction errors,
> > >> I expanded the voltage range in the DTS to 500,000=E2=80=93950,000 =
=C2=B5V.
> > >>
sorry I was wrong from the doc below 1.2.1 CORE Power Design

The typical core voltage is 0.9 V to 1.05 V. Actual voltage is
dynamically regulated by
the **remote-sense dynamic voltage** adjustment circuit inside P1.
P1 BUCK1 and BUCK2 must be combined to supply the core rail.

[1] https://www.spacemit.com/community/document/info?nodepath=3Dhardware/ke=
y_stone/k1/k1_hw/k1_hw_design_guide.md&lang=3Den

> > >> Additionally, I updated the DTS to map the second CPU cluster (cores=
 4=E2=80=937)
> > >> to Buck2 to better align with the hardware's power distribution.
> > >
> > > Actually the output of Buck1 and Buck2 are connected together, so the=
y
> > > should always be configured with the same output voltage. And both
> > > clusters should be mapped to both outputs.
> >
> > You are right, I received the same response from the official developer=
s.
> >
> > Therefore, I'm wondering if an additional regulator-coupled-with: prope=
rty
> > definition is also needed here?
>
correct.
> Yes, I think this is the way to go. I even wonder if this shouldn't be a
> fix with Cc: stable. This also has to be done for the Milk-V Jupiter
> board, I haven't checked the other boards yet, but I guess they all use
> the same schematics at that the PMIC level.
>
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
