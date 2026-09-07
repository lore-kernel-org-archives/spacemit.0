Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C504FECD5
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796390; cv=none; b=TyJ9SfDJ5VjsF4hb2whIH+Cem7c5XA8w10Lwe1+9ZF+FbTd3um1OoZPhxbYSk9BFq8+FfYFYRzV3U44EBeJDFGgi98NOV2xswCEb/PNYa/p99xL75QtVwVQx91U8YCt+snTj6SfBw/DeeGsXVeWsO3QC7ixUj6bA+0e5AEsw2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796390; c=relaxed/simple;
	bh=LT8/T3bapnQyB62nOSvmPlXMWQQ2lnLEYW3h8EL0aYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8slEi9RFukg9iKqseD2YT5VwnmKdDqgpL0BSscch/sRV8grgSpFWijaawsi8UE3Hkm2RtH5q9Y1jdb74zTMgahUtqC9dgCnvKX7B5ptQmuE3RtunAjOO3Zp+/sHD3gbPcxE78wjR2AFTKekwszccnDVB5uIWOyhFxGTniK2XNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiZpJHxT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiZpJHxT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso3916358a91.2
        for <spacemit@lists.linux.dev>; Mon, 07 Sep 2026 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788796388; x=1789401188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6erjGy3u0IztxSasYUB07Hda9mjPevh3TT6gn74YsDM=;
        b=YiZpJHxTUqMtleI5o8CEXjeHnyNNsGQROCK8TmpizE3kOcc7+Kgj4t2rhrkZZ8qgVI
         KASnLlS79M4yV1z6ddMneLisxpKvwiGi22mHddAX51rdjpFqfzsrnGIv5fc1NJoCI0lk
         BjTkTBFtyJF6Ud6WQmmMvLTn1KybI9XFvTHmF6GAV/7pqEFdctT3by3HLWO8SZrunNN2
         2AhV6joOMj/z1DTgblHlE/uefOURivPcWCeE8X0k6+qGnMloz1c6QN2aiaLiKVzb5uVE
         cJp2GaWcs/SVKKaiTIj//6NLpusBnZoCp8qCT8FyMKtkyqWERwezh4ABVloY6Rv5q5T5
         LClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796388; x=1789401188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6erjGy3u0IztxSasYUB07Hda9mjPevh3TT6gn74YsDM=;
        b=NJO61BGMK1s46P3CshjyRMJaLrdVhPMtdqaT6PF1VyCWHlzLLFXde27Rd84kaAXlso
         1+A03kl6Bzvhwm4bFGZY5mau5uSgc7iLU3m2a/PtNZnl//RzY8p0vv/2oWaNOFsl3TRj
         IC0Gm0z7pfxf4huNIl1JRphufdHd3/RgFq8BTGIEc4x2qqAHi35sbNK+N/hyF5GhMZUd
         1BeUzILRQBxybEnrNLqGyiovtosBTMV1CiMNIWGSbrhrft+cYIiEUTCgLTlm8Uemv6AS
         ZJPJ0KRnsQOZORYEq29VYOyNq/Zc2tUtVb3XReIbhQeWccOccMKhd+1jHyhkPZox2gyz
         ruhw==
X-Forwarded-Encrypted: i=1; AKwUvBzj719ZD/mewRbivoOHeG6Dib8Y8iCsy7/FT27KBE46SL0aIYHpOGwKLEJqCzj0tlWnKra9pr2Ubg==@lists.linux.dev
X-Gm-Message-State: AFuF++lec4ZCOcHq3W8LJfD12l1JvZts0gcwKnW35DnLTF5Cl+gIL6Gv
	4tY89kuW8k9TkBIDtvnmYA2AWJAkIzHNHJAFAlrP7ZfNHl51BALWDh5Z
X-Gm-Gg: AYBFou082cvA5uIlUbWu+slJmtA8asB3RUu9eXp/td5xWqpElcbkCx8JRpfPCeGy5T8
	Z/LhaRB1GB9/kP7EQSPhgnwFXApk1Yvq3nHcEW/fczQQdBgzWvOw9YRdh8IENg5PaJ5Z03pOb7t
	UTH5wO3iLcS4fXD3aq1fl4Wo85rwGTDzhJfah8VqyrstV1NbOONKrhWE5/AHtyzTgkbi7q/LIDj
	nEwASqQQwfP8TEonNfXwUdu5zdAm+TjTycW+78xfAP5/fjcS6mKNHrYjCzCb85SZOGUIvU/f/ML
	2B2F54LOPtL+MSp0ywwGc9YyyXIVwDfESpY2O/eHKiT1Sc8eRKRIqWM04tAJtYAEGZ37WoRuTNz
	5S6ohz8xrwZowRNcSpf9aDiXF/TV2zVHLnzoWAEL6VN/SOTO2wJEbPeV7aMa4aU7WfOg5jzc+qj
	HPWwJhUcrXr0ZW40Gvf9Xw+Cm0GrUWxe+lIOdoekhfh0HjFAAy86duVvd/SUrCuqe+ZEGG4KG6l
	R5R9M/z5tQCIJVpl32PVtcbSeHqhFgm3nnhj88PER4kRaF3m8ww3apN0i97LKsjaWblOPo7DZrI
	ZhRXgGyHBy1mIbyyUEQ4pBC+CTHhQOGX6mf84/FriXYHco8EgktLUA==
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr35695612a91.4.1788796387891;
        Mon, 07 Sep 2026 08:53:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b90e26276sm59604a91.2.2026.09.07.08.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:53:07 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: dlan@kernel.org,
	adrian.hunter@intel.com,
	ulfh@kernel.org
Cc: long.wan@linux.spacemit.com,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
Date: Mon,  7 Sep 2026 23:53:00 +0800
Message-ID: <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2026 at 08:04:27AM +0000, Yixun Lan wrote:
> Raise the minimum delay codes of RX tuning window from 3 to 50, to more
> accurately retrieve a valid configuration.
>
> A window of 3 codes wide leaves no sampling margin, which will result
> tuning tests reporting success on a configuration that drifts out of the
> window under thermal or power variation.

I agree with the motivation, and I have some data from a K1 board that
supports it. But I would like to ask about making 50 a compile-time
constant.

Caveat up front: my board runs the vendor sdhci-spacemit driver
(6.6.63, compatible "spacemit,k1-x-sdhci"), not sdhci-of-k1.c, so the
numbers below are observations from that driver rather than a test of
this series. I could not test the series itself: rootfs on this board
is on the SD card driven by this controller, and there is no eMMC, so
a tuning regression means it does not boot.

Measured RX tuning windows, Milk-V Jupiter (K1), SDR104 SD card,
across three boots (the vendor driver already logs these):

  mmc0 (SD, rootfs):
    boot 0:  [0,55) [77,255)         -> widest 178
    boot -1: [0,54) [77,255)         -> widest 178
    boot -2: [0,50) [71,76) [79,255) -> widest 176

  mmc1 (SDIO):
    boot 0:  [0,73) [81,106) [137,255) -> widest 118
    boot -1: [0,74) [81,106) [107,108) -> widest 74
    boot -2: [0,76) [82,100)           -> widest 76

So a threshold of 50 is comfortable here. It also supports your
rationale directly: boot -2 produced a 5-code window and boot -1
produced a 1-code window on mmc1, so the narrow-window case this
patch guards against does occur in practice.

Relevant to the delay-line question in 5/7: this board's DT already
sets spacemit,rx_dline_reg = 0, so the windows above are already at
the finest step size, i.e. they should be comparable to post-5/7
behaviour rather than to the current mainline default of 9.

My question is about the form rather than the value. The vendor
driver takes this same limit from DT, per host:

  sdh@d4280000: spacemit,rx_tuning_limit = <0x32>;  /* 50 */
  sdh@d4280800: spacemit,rx_tuning_limit = <0x32>;  /* 50 */

So 50 matches what SpacemiT already ships -- but there it is a
per-controller DT property, and this patch turns it into a global
compile-time constant. Was that deliberate? The vendor design implies
the value is expected to need per-board adjustment, and with a Fixes:
tag this will land in stable, where a board with a narrower window
would go from "adjust the DT" to "patch and rebuild the kernel".

Two options, if you think the concern is real: keep it as a DT
property (matching the existing binding), or keep the constant as a
default that DT can override.

One more thing on 5/7 and 6/7: since patch 5 changes the delay-line
step from 9 to 0, the same physical timing window spans a different
number of delay codes with and without it. If 50 is calibrated against
the finest step, then backporting 6/7 without 5/7 could reject
configurations that currently work. Both carry Fixes: tags pointing at
e9cb83c10071, so they may well be picked up separately -- might be
worth making the dependency explicit for the stable maintainers.

Thanks,
Hung-Chun Tseng <alan.tseng.cs@gmail.com>
