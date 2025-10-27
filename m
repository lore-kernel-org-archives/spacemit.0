Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E370211F
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761560276; cv=none; b=I2Yu1jk9i4inhoAlFsiRR0kuegGbgRTPoOZhuP4rPHsQzAihtW7jcrmNbtBZ8HsAJhdm6mPydciuMLtXlosMqua78noTMdPOJ25LgyQX23UGgPJi7meFCHGNDmPU60DSV1cOUfL4FEiZpQ4w/cDUCGREnEMJwkUBY7Y4OlEGyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761560276; c=relaxed/simple;
	bh=VlS7+HlKBSECYTt1bDBOxvEU+ZOLlEUucB1RHUNo4pI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRLb6nN/LARhxw/JK01X7alZSSPIXHlWCVJjkyUA2hQrsCrD1+ZRRTv4zO0c6WHQQxRFQuXzywe1Y/F6idN4CB7L2ekg02w7xouIxS71VcsoO18vyDUYZRttKDmefzoXewMGnlFEtj/K13+4Y6oxq2coajANrnGT2hKHoUS+aiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=KzO+ak/H; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="KzO+ak/H"
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF1C846645
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761560265;
	bh=9DhDySVvD7mdReEgfjhQfxSVU5DcbAQWOe9Vkh93eqY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KzO+ak/HqMmf3ga2KQ3aFSrL5+vMztVJnO8zJg/L8ndyVkRqWwDhaBYPAMIRDUk0H
	 98rEbFxM6KOPRW405OzymEPXXVwnHfMMIFZx4CAefyEqYA7dDiyR8NMBMX3Br1lpfZ
	 rjZavcTvRI+QvoCsaV520UidrJYYssBjFc2VYJEcq/nIvD+AHKaf1S3upIT8lOfJcx
	 vGjU9ZQiSokFL85VtW0jPFVVpVHmgmHrI2kACtYO3651AE/hM7OYxkbZEUeyt6Rj4g
	 tgaqvnBJGG8/4BcXh2vsUkbpog+fRP5mt8srsK98B6Kjn3G9o7j+m8iHdLBxepcv5f
	 Fapwb0YaHgU4onNLhrV7bProfetIPTxHiWpGWvr37VPTwVMszxn9EmsE4VcKY32BAm
	 5ExuxyaMyL4Kx5Vo6c1KkQy63aZK/VxS2TBxCLhjcFfDKq6vPX3KYwhFCMJ8Nn2S0w
	 QX1ta4bWWALT6M7g6sgQu1410eVwXDJ4QZPBuCx5DEUhmyTJO1GghJUsF1xm1BDSxv
	 jIHt2YRXM6pwazh38epZ7wK+Pt1sfcWdTn7lckwP/M/hH4Nx2/G6BJvsRALq0e/d9p
	 4Q7Ae8j+PyKv+gtdH2s9zkxL8gHSNYcSxVTH4ynROIbKVrtx0aDYDu453oX6/XQjDm
	 eCvUSYctRbDnvkg3ZWFQbf7o=
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-934e1916338so112228241.0
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 03:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560264; x=1762165064;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DhDySVvD7mdReEgfjhQfxSVU5DcbAQWOe9Vkh93eqY=;
        b=HoXk/8dqXfn3lN+aYrwS9HdD5Cf7VOphPMhWn9KhlHi9ojVfjzIWZwUCzbWGV+Z7gx
         qBxREuhCxr9RAugEEjf7mtp2Yv0kAySW0asn8WHxU+KO2jGOCFms2Koo8oH+4HM0Uxc6
         D5HKw8csE6IXNp72fHPmplLa7pYPO3f/6QoC0Et9EMTACWLSGs5Rj8KRP5iIhU1K4TXW
         4UtkcJEwbNIjnoljokpvLGCCSbRQHVdQp/ZFKA6uicNVg3wda5iWCpHM5UWpXg36FTGq
         l+XBantr8P9L7JFijSe0xb1rirwLFYTL2EOrKzovs3ebfAd1ZGY0EUGwjtqR1iUPWtFH
         VbEg==
X-Forwarded-Encrypted: i=1; AJvYcCUmXYmPip0PdvgLDgnLyujgUngZYhnuOYQrn9GSY1S4zO3ZdumbOaUULAHYbrZk/b5WQIrOHYqlvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyJxIMDFzXfGHuCIF3qNt7sve8zdiMZeZLKIMzN5ArvB3enuks
	BBWxnn5ObZ2nyXt9eyZ6auj2Z/nE/9kjTCdG7J8Zvk7HHUd8GhK/A7gAwn7CSX1e21mNQdKVd2c
	uTMl+xf0CCVb2WbcP73aM36nfOQe2onAJD32TGCX7cg//jWQt1jCBvygPh3xc6Mz4pIqk0ej0HP
	ccKgb3zHsDqsuN/dMbSwfkZuu/1OP3D+5sQywIdJoPVdoz7E8cEmY=
X-Gm-Gg: ASbGncvpKf3AsCWIiPGouK091zclnOaK9fVDx2eFdRya/pS0IEDs/dLr5lAPcwBoojU
	rcRw2UtJHsHMY1mdtpyiPsWQtHZPqz0chny7xxr0IvKa/RIm5zLeN2alDtmLwu5gGYhJK6yTyqq
	uUlyu9phj48q6rlEMnotbMBTwAPC42qfkxNxteAG/9JwNxb0eRLOYZpA==
X-Received: by 2002:a05:6102:954:b0:5d5:f40d:28cc with SMTP id ada2fe7eead31-5d7dd6a1b92mr14555709137.34.1761560264191;
        Mon, 27 Oct 2025 03:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdPvzfUWy+KzTQx0NZKC+viVyDjrKZWPq/ag/aFPbstdqmRZATfbto1tMny89+DUKS+pVIxA5PrA3lQ+wZpqk=
X-Received: by 2002:a05:6102:954:b0:5d5:f40d:28cc with SMTP id
 ada2fe7eead31-5d7dd6a1b92mr14555692137.34.1761560263720; Mon, 27 Oct 2025
 03:17:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Oct 2025 03:17:43 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Oct 2025 03:17:43 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aP86TltQ2uqeK6FY@pie>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net> <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie> <mvmh5vk67in.fsf@suse.de> <aP86TltQ2uqeK6FY@pie>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 27 Oct 2025 03:17:43 -0700
X-Gm-Features: AWmQ_bkt48PMnhkCO0H9qLGejhLpBvvYCPQTMfZ0eF7vE7Bd7Gc1hHCSa_6NREU
Message-ID: <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
To: Andreas Schwab <schwab@suse.de>, Yao Zi <ziyao@disroot.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Yao Zi (2025-10-27 10:24:30)
> On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> > On Okt 27 2025, Yao Zi wrote:
> > > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> > >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > >> > index 8248895ca9038..61c16f3d5abc7 100644
> > >> > --- a/drivers/power/reset/Kconfig
> > >> > +++ b/drivers/power/reset/Kconfig
> > >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >> >          help
> > >> >            Reboot support for the KEYSTONE SoCs.
> > >> >
> > >> > +config POWER_RESET_SPACEMIT_P1
> > >> > +        tristate "SpacemiT P1 poweroff and reset driver"
> > >> > +        depends on ARCH_SPACEMIT || COMPILE_TEST
> > >> > +        depends on MFD_SPACEMIT_P1
> > >> > +        default m
> > >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> > >> I believe that reboot and shutdown are actually essential functionalities,
> > >> so it might make more sense: default ARCH_SPACEMIT?
> > >
> > > I don't think there's anything preventing it to be built as module by
> > > default: even though it's "essential", it's unnecessary during kernel
> > > and userspace startup, thus I see no reason to build it in the image.
> >
> > Wouldn't it be needed in a reboot-on-panic situation?
>
> Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
> could switch to another boot option if one fails to boot. And if it's
> caused by a (very early) kernel panic, then reboot support does play a
> part here.

But if systemd is running then you've at least got as far as the initramfs,
and have the module available. So I don't see the problem.

/Emil
